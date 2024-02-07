Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23256C4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 14:45:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C172B401B1;
	Wed,  7 Feb 2024 14:45:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YaVLIKxe-JKA; Wed,  7 Feb 2024 14:45:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81A00404A5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 81A00404A5;
	Wed,  7 Feb 2024 14:45:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5FA081BF276
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 14:45:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4CB1F41735
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 14:45:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kbRCjOTB7dgc for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 14:45:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E69614168B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E69614168B
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E69614168B
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 14:45:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 02AA8FF809
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 14:45:32 +0000 (UTC)
Date: Wed, 7 Feb 2024 15:45:31 +0100
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Message-ID: <20240207154531.02546408@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707317133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4G7wAQkFEMnfa9aWXluPamzsoJEt2mXkp1zu6V5pzCo=;
 b=Fbghe8LWCY9rml6AgCUqwNBw+hHgWblx1QkJRBu8enjpoLLG0DMT+zsez+Y53o+ZeskK9l
 4BlCLLs+7zpT+f3oLwObmx17cGHXayVvs1wsZnJdFCFThdOax2qRBWhuLKMMTdsRwsL8z2
 yA1jL6UUxEUdv+EftIrxZDjLY9Ybqzbr/8rYUF766otvJeDCOEkHJwM7vlFnA4vAprD1it
 m4cQGSYKWFRSn6eKOpM82o2jvjh0kb2JcfL/m6Xt7XDBPtR8Yu/7NCH9A0W5rhZDRG5+pa
 ZoEaDMc2jYYjX9e+8DR2eM6Oon+ssLZGLH/9gynCqQ0l0du2qXNpsuN8mRTTZQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Fbghe8LW
Subject: [Buildroot] Invitation to the Buildroot Association General Assembly
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

The Buildroot project is supported by the "Buildroot Association" a
french "association loi 1901" non-profit organization.

As per its bylaws, the Buildroot Association will organize its yearly
General Assembly on February 28, at 9 PM UTC+1, online.

The agenda of the General Assembly is:

- Presentation and approval of the 2023 moral report
- Presentation and approval of the 2023 financial report
- Election of the new association board
- Misc topics, Q&A

The General Assembly is open to everyone. Only the members of the
association will be allowed to vote. How to become a member of the
association is described at https://buildroot.org/association.html.

The link to join the video call for the General Assembly is:

  https://meet.google.com/ffc-exxp-piv

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
