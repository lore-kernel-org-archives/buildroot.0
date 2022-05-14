Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F05D6C433EF
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 07:57:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 859C140C3F;
	Sat, 14 May 2022 07:57:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XTiwifO8QMED; Sat, 14 May 2022 07:57:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 832CB40A0D;
	Sat, 14 May 2022 07:57:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E39311BF2FA
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 07:57:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF8BB8131B
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 07:57:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ko2ukZ_MYbAi for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 07:57:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtpfb2-g21.free.fr (smtpfb2-g21.free.fr [212.27.42.10])
 by smtp1.osuosl.org (Postfix) with ESMTP id BBBEA8130D
 for <buildroot@buildroot.org>; Sat, 14 May 2022 07:57:28 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtpfb2-g21.free.fr (Postfix) with ESMTP id 2F2704CB5B
 for <buildroot@buildroot.org>; Sat, 14 May 2022 09:57:26 +0200 (CEST)
Received: from zimbra-e1-03.priv.proxad.net (unknown [172.20.243.151])
 by smtp6-g21.free.fr (Postfix) with ESMTP id F162E780398
 for <buildroot@buildroot.org>; Sat, 14 May 2022 09:57:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1652515040;
 bh=A12Sqf8za/wgG6e3g2HElzazO59ki6IrxHG/77oFV6g=;
 h=Date:From:To:Subject:From;
 b=tVdfrkxFyp9D5CoFsNxlRGuubFYy62hCkeAilhggbdW4lf9n1p7zACfrLxJSrDX/x
 pYuMTuRcWKjzf7L2iLQBNIA3zMJCbr1SfBb4dhIf+OMQ7N+dMBYJfxOYcZ41qT1rj1
 0ZxTv53uSaIxlElsMAcCLbe1CKDQtpCidF3n4haUVD7mnBf4qjJPjsI7ALkJIHv996
 s0IfXs0E3c2XMQJyloDBIiBBrFxTUst6anXL9/lsyjTwl1SX/+f5jveo0SUGjU+c2N
 FKT6pvc+VMXGgifQdzsgDg0ZEOcBTV5ekTgGS/sudz0o8zWmwhotv8ssAjrnHsOGGK
 JHxbAVr7gVW4Q==
Date: Sat, 14 May 2022 09:57:20 +0200 (CEST)
From: friedtj@free.fr
To: buildroot@buildroot.org
Message-ID: <1555656118.650632846.1652515040908.JavaMail.zimbra@free.fr>
MIME-Version: 1.0
X-Originating-IP: [194.167.45.227]
X-Mailer: Zimbra 9.0.0_GA_1337 (ZimbraWebClient - FF99 (Linux)/9.0.0_GA_1337)
Thread-Index: uxByvjo5czA1FQ7ZmhXPjPpXIbu7kQ==
Thread-Topic: image generation failure (rm .. error)
Subject: [Buildroot] image generation failure (rm .. error)
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

FYI, fresh download of buildroot-2022.02-rc3.tar.gz fails to complete the image generation on Debian/sid with

Generating filesystem image rootfs.ext2
...
rm: refusing to remove '.' or '..' directory: skipping '[...]/buildroot-2022.02-rc3_CM4/output/build/buildroot-fs/ext2/target/run/..'
rm: refusing to remove '.' or '..' directory: skipping '[...]/buildroot-2022.02-rc3_CM4/output/build/buildroot-fs/ext2/target/tmp/..'

I had to comment
 echo "rm -rf $$(TARGET_DIR)/run/* $$(TARGET_DIR)/run/.[^.]* $$(TARGET_DIR)/tmp/* $$(TARGET_DIR)/tmp/.[^.]*" >> $$(FAKEROOT_SCRIPT)
in fs/common.mk to complete the functional image generation.

Jean-Michel
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
