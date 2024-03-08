Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0038C5475B
	for <buildroot@archiver.kernel.org>; Fri,  8 Mar 2024 21:49:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B9750400EF;
	Fri,  8 Mar 2024 21:49:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EgNSXpa_F0hG; Fri,  8 Mar 2024 21:49:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB82C402C3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB82C402C3;
	Fri,  8 Mar 2024 21:49:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 662D01BF48D
 for <buildroot@lists.busybox.net>; Fri,  8 Mar 2024 21:48:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5336041D70
 for <buildroot@lists.busybox.net>; Fri,  8 Mar 2024 21:48:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V4FKPPSW_WBM for <buildroot@lists.busybox.net>;
 Fri,  8 Mar 2024 21:48:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.240;
 helo=mslow1.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 13BD541962
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13BD541962
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 13BD541962
 for <buildroot@buildroot.org>; Fri,  8 Mar 2024 21:48:40 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::227])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 6F366C21D3
 for <buildroot@buildroot.org>; Fri,  8 Mar 2024 21:46:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 54E9520002;
 Fri,  8 Mar 2024 21:46:08 +0000 (UTC)
Date: Fri, 8 Mar 2024 22:46:07 +0100
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20240308224607.3e76f7aa@booty>
In-Reply-To: <20240304074140.1537910-6-neal.frager@amd.com>
References: <20240304074140.1537910-1-neal.frager@amd.com>
 <20240304074140.1537910-6-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1709934369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HdTQi0pWYPFOeLxBWJsTGACSaVSs3k+IyNl4Od+xxCc=;
 b=PV9m62wvHcObDGOf4NyMEgcSsUf7WAAwvlXdUeUHcctumAvxmNYu5A6CGMxfFshRkH30qZ
 C0vqgf2XqRpvSBtKyO/SCR87+sCBtlDZl3RdnuZy3yQia26bblwJiS+6LZ6xQsRKteYwZH
 VfZd0rI/k8Si+TEu5Oo8bVZcKQpnfiKf+AwyFqiH2ipPuLu948eYdbQXHGwm6+7LlAfVBh
 wlhCaV9bRxXn5XdJ6u4djvrlBbsu4ZkBA3ObeZZSy663d2sKPcljyfplCvJt2xDtToOceq
 Xp1SwmuVEL6F/A8IXZx2iozOBF1IA5IsmcpMwe39cuFOISv+jOFiVFBZ5dvorw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PV9m62wv
Subject: Re: [Buildroot] [PATCH v11 6/6] package/versal-firmware: remove
 package
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
Cc: ibai.erkiaga-elorza@amd.com, michal.simek@amd.com,
 thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 4 Mar 2024 07:41:40 +0000
Neal Frager <neal.frager@amd.com> wrote:

> This patch removes the package/versal-firmware as this package is replaced
> by the boot/versal-firmware target boot firmware package for versal.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

[Tested on Kria KV260 starter kit]
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
