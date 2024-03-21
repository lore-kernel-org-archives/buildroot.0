Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A3D3C54E68
	for <buildroot@archiver.kernel.org>; Thu, 21 Mar 2024 16:06:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A1BE60834;
	Thu, 21 Mar 2024 16:06:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sijzQV9UetSA; Thu, 21 Mar 2024 16:05:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D9E960E9A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D9E960E9A;
	Thu, 21 Mar 2024 16:05:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6C5C31BF2A7
 for <buildroot@lists.busybox.net>; Thu, 21 Mar 2024 16:05:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 59A7A82183
 for <buildroot@lists.busybox.net>; Thu, 21 Mar 2024 16:05:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ja8d8aryiXkW for <buildroot@lists.busybox.net>;
 Thu, 21 Mar 2024 16:05:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.240;
 helo=mslow1.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4CEC682153
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4CEC682153
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4CEC682153
 for <buildroot@buildroot.org>; Thu, 21 Mar 2024 16:05:56 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::223])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 49D82CCF8D
 for <buildroot@buildroot.org>; Thu, 21 Mar 2024 16:05:54 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1C96960011;
 Thu, 21 Mar 2024 16:05:46 +0000 (UTC)
Date: Thu, 21 Mar 2024 17:05:40 +0100
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20240321170540.77d0c67b@booty>
In-Reply-To: <20240318140258.1083375-1-neal.frager@amd.com>
References: <20240318140258.1083375-1-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1711037148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sXhaj7oA0bwpibPMUFDLZxJkW8ihNSDpHFwQo5iOALE=;
 b=JPyeOF9bwG1VaoCYmJvoYM7fBw6TcjDMXm33jQRUxllB2bkzoAmW4vO0LABaibDtx+TWFM
 cWmNtbMkpTnj4YPKJKFhahXcFd5+63Dx1Htl08Tvu+8jkqqKWBNfjv0ZitGJhyXawar2G5
 idbyQWJ1Kc5PQp1Rg3jmNt1w5IEd2Y7QIAC/42jRJQQkQvrbJm9SY6MCmnnGb1Xk2i5ePt
 SHOENuwMpAmKxlVg52GmannBqs2Y1/XFYMuihjT/3HHTy4vkDnpSwP3Zh+54bY5KXXfqeF
 KYZdxOmqZe0btEHP861iQNxEtdIsKEgy5cGDIuFhpS5+MGYB9qvQ8WXkYzIoWA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JPyeOF9b
Subject: Re: [Buildroot] [PATCH v1 1/4] configs/zynq_zc702_defconfig: bump
 to 6.1.70
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
Cc: michal.simek@amd.com, thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 18 Mar 2024 14:02:55 +0000
Neal Frager <neal.frager@amd.com> wrote:

> This patch bumps the zynq_zc702_defconfig to Linux kernel 6.1.70.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
