Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28262C10F16
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 10:26:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE12860818;
	Mon,  6 May 2024 10:26:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NsxIDD_iNt4X; Mon,  6 May 2024 10:26:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A02936081F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A02936081F;
	Mon,  6 May 2024 10:26:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 003571BF5DE
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 10:26:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE4C440578
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 10:26:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eJoInYuFEbMJ for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 10:26:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.240;
 helo=mslow1.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D1D4B400BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D1D4B400BA
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D1D4B400BA
 for <buildroot@buildroot.org>; Mon,  6 May 2024 10:26:37 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (unknown [217.70.183.201])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 6D661C33E7
 for <buildroot@buildroot.org>; Mon,  6 May 2024 10:19:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D54631BF209;
 Mon,  6 May 2024 10:19:20 +0000 (UTC)
Date: Mon, 6 May 2024 12:19:19 +0200
To: Jesse Van Gavere <jesseevg@gmail.com>
Message-ID: <20240506121919.118af862@booty>
In-Reply-To: <20240430203401.74587-1-jesseevg@gmail.com>
References: <20240430203401.74587-1-jesseevg@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1714990761;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k7fuZfTyf6tbc3ABbuGJySs7mTlIZ2RFYH46uQAvsxE=;
 b=b7wJ5N2txCssYN6E5w+pcxI1+WKv2xVqsjkx2q5akvF98YmKahpWnUdHLFFfNXtuyp2taz
 +ydyTV+2oxD+31OdciwCZcKF0XXa8DspB7O36KNshRRyy84lexkrpRRoi28wlt+ueoneWk
 eg9pVpepgPVJJgEGeQ5z00YwJo9Xy+SgLSkkJAJ5rG2PEWCHopkXg1KlaNtAN2IpsK0/JX
 O5oORfoB8Dsv8LSLQFU/or2wd8Y4b/lDNYVbHsoXLrl9DWFRtcBwqeD0dyTvue8vy0W9n4
 ks+kbESJ7ueJFc8tYwEuZCqxTC29rMlXfIrdjxnUcZeyXWMlj08B7DSDujmFtg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=b7wJ5N2t
Subject: Re: [Buildroot] [PATCH 1/1] package/agentpp: bump to version 4.6.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Jesse,

On Tue, 30 Apr 2024 22:34:01 +0200
Jesse Van Gavere <jesseevg@gmail.com> wrote:

> This version integrates the patch to fix building without v3 so remove
> that patch, there is however  another failure when linking the library,
> debugprintf is used which was removed in snmp++, so patch that.
> This patch has been sent to agentpp.

Sure about this? snmp++ 3.5.1 does not seem to have any changes related
to debugprintf compared to 3.5.0. Also, testing with both of your
patches (this and the snmppp 3.5.1 bump), agentpp builds fine without
the added patch.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
