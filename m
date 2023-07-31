Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4E53C001E0
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 16:07:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 707DD402C0;
	Mon, 31 Jul 2023 16:07:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 707DD402C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hVu5Eo0x027Z; Mon, 31 Jul 2023 16:07:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4125C402B7;
	Mon, 31 Jul 2023 16:07:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4125C402B7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7AD8F1BF313
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 16:07:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4AB9440B5D
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 16:07:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4AB9440B5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zt1GubviyARk for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 16:07:28 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3EB42404C2
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 16:07:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3EB42404C2
Received: by mail.gandi.net (Postfix) with ESMTPSA id EB6F760004;
 Mon, 31 Jul 2023 16:07:24 +0000 (UTC)
Date: Mon, 31 Jul 2023 18:07:23 +0200
To: "Frager, Neal" <neal.frager@amd.com>
Message-ID: <20230731180723.2ac1d93f@windsurf>
In-Reply-To: <CH2PR12MB5004F616135C586B599F520DF005A@CH2PR12MB5004.namprd12.prod.outlook.com>
References: <20230731061113.193556-1-neal.frager@amd.com>
 <20230731142113.3945104c@windsurf>
 <CH2PR12MB5004F616135C586B599F520DF005A@CH2PR12MB5004.namprd12.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690819645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pxcR/ynz+0EYVLv17Dr+0EinwGy0cylitmw4TUEO6nU=;
 b=Hyb887BUIPlbMX3U6+5J6OU9qQoFGxpp4QfhcIrKGDiqSgLLZXmeylycJyfx8AlLe5hDCq
 At95t+lfg5QlKN8Sj55rR/5T1CPRJbu43K00Lvw3tjNfzxBQpxi6gudnkKpv+BADcumJD1
 ApXfd4qxs30/r6NVcbDnrM7w0BgAZ3uT92F27N//KukZbl5Nvu5qsxSwkvof9GJTIlA5kl
 6TJe50L1MwzT3DwQNtOiXAqLxE4PbqT59wfPrMLOzvjYy8n7l0BDmvD2NQmhHBG0V9hilX
 6VwmkTTj9msw5ECEOktPfkkA26ViIT/8bdCzI//I21CPj++qsmvihEkPhJPwtw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Hyb887BU
Subject: Re: [Buildroot] [PATCH v1 1/1] board/zynqmp: fix atf build failure
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
Cc: "Simek, Michal" <michal.simek@amd.com>, "Erkiaga Elorza,
 Ibai" <ibai.erkiaga-elorza@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 Neal Frager via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 31 Jul 2023 16:01:45 +0000
"Frager, Neal" <neal.frager@amd.com> wrote:

> Thank you for pointing this out.  Are you ok with my just creating a
> link to the arm-trusted-firmware patch for v2.6 already included in
> buildroot?

I saw your patch that use a symbolic link. I don't have a strong
opinion here. On one side, using a symbolic link obviously avoids
duplicating the patch. However, I'm wondering if we will remember to
adjust the symlink in board/zynqmp and board/versal when we
change/remove the patches in boot/arm-trusted/firmware/. Or maybe
AMD/Xilinx will update to a newer TF-A soon, which will no longer
require the bug fix?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
