Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBD23FD88CC
	for <buildroot@archiver.kernel.org>; Tue, 10 Mar 2026 23:18:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C1E641190;
	Tue, 10 Mar 2026 23:18:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nHCA-omGb03u; Tue, 10 Mar 2026 23:18:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9800740CD4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773184734;
	bh=A9kvGeKXLjagdr84kfxsXDef0uHp5bqVTGrxu0+EptU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ahuHM160zi09xtSfQTZ6ttB1bw0Mc0R9Qf7LM498O1pKJFwWx5Lb+T95rKF9aEzvJ
	 KhXnqsd/8fzkYDoJiT/xaFwEMoQNf2pvCcqs9hKpdQv2i2GpQmynnCH2Vp7lu/gRYQ
	 Xt05SfctpuMLMgcE+QPwNbtn29Z1LrcFpeTPC+W6ZMEJ6PSFPpVxOHIVaN6Mj8d3a4
	 Z0+N4s2slvrJvZtpOGsyCT7TXwYFMpxMVCmNDApMYkKC0JzpyV6zqhuJmRFqhAbaZk
	 U3QO7oA9lJlwPblgNafDizu8oSYztsmuqD012VUyLXoJ88BCIem/3PpDftRwuyQTaz
	 iY1OKaTkHDC2w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9800740CD4;
	Tue, 10 Mar 2026 23:18:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A8D79E3
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 23:18:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 70A4240CD4
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 23:18:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gbOpfMsjm99O for <buildroot@buildroot.org>;
 Tue, 10 Mar 2026 23:18:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B093140CBD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B093140CBD
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 23:18:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C9D2786ADD; Tue, 10 Mar 2026 23:18:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 10 Mar 2026 23:46:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 07882440cbc0f6cb754e207db92806aef7c55807
X-Git-Newrev: 0b4d44d71b8f148c21a115131b458c1d4f4c41ae
X-Patchwork-Hint: ignore
Message-Id: <20260310231851.C9D2786ADD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/beagleboneai64_defconfig: remove
 unused file hash
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0b4d44d71b8f148c21a115131b458c1d4f4c41ae
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The commit [1] update arm-trusted-firmware to v2.12 LTS without
removing the custom file hash.

While at it, remove unused linux-headers.hash since we already use a
prebuilt toolchain.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/4abb8a98b26922796b41bc913e72be487337640e

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash              | 2 --
 .../beagleboard/beagleboneai64/patches/linux-headers/linux-headers.hash | 1 -
 2 files changed, 3 deletions(-)

diff --git a/board/beagleboard/beagleboneai64/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/beagleboard/beagleboneai64/patches/arm-trusted-firmware/arm-trusted-firmware.hash
deleted file mode 100644
index 6f02bfbb22..0000000000
--- a/board/beagleboard/beagleboneai64/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally calculated
-sha256  7efa89e1b4e4106ee05d68e876c8efbb146364d89cfd5d26bf4647b09c08f32b  arm-trusted-firmware-v2.10-git4.tar.gz
diff --git a/board/beagleboard/beagleboneai64/patches/linux-headers/linux-headers.hash b/board/beagleboard/beagleboneai64/patches/linux-headers/linux-headers.hash
deleted file mode 120000
index 5808d92afe..0000000000
--- a/board/beagleboard/beagleboneai64/patches/linux-headers/linux-headers.hash
+++ /dev/null
@@ -1 +0,0 @@
-../linux/linux.hash
\ No newline at end of file
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
