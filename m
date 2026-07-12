Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1900C44501
	for <buildroot@archiver.kernel.org>; Sun, 12 Jul 2026 14:19:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6340606B6;
	Sun, 12 Jul 2026 14:19:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G5lnRH1a7LxQ; Sun, 12 Jul 2026 14:19:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B71AE6076D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783865965;
	bh=mYlJred5a8FW2O7VmvzuqVfSTt0ufZnQdLJInPZmSQc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=U26rNX+LsMwmg0Uv8sKD/bIl/QA3Aem2GzsBi7YOdry2+jko3ehPMQE6vBjdhAMrg
	 KfEPuhIBg8oL2hDcMCDO6R4eo+UXPVsu1gpxf1C3Pkw6+osJMUAeEN6bt0QUdn6U2f
	 ALmZgFAWCThhSEWZ/8nAZp+QYnlsCac5omJksxisgdXjV8RGRzezxgiZSWoJrd6gQt
	 DJ3f+Bv7zA4WlLwWVyZLBBtikgVf2c/bbLkTYNCqcnO6BoGPErRswfHrAJrJRVqk1s
	 DUarhzGr7xs1fHChsIVwRRz+R+h/Gpihkt5JJxiMY59NKkK+5PKk6neaGv8o2pVAai
	 naOTbhE9fr44Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B71AE6076D;
	Sun, 12 Jul 2026 14:19:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4811979DB
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 14:19:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2A5D4407E8
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 14:19:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Cji52WRu4OA for <buildroot@buildroot.org>;
 Sun, 12 Jul 2026 14:19:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DEA940783
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5DEA940783
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 14:19:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9919188737; Sun, 12 Jul 2026 14:18:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 12 Jul 2026 16:18:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2df50cc8cf39f0a0d97c35febacc2fe725669a9c
X-Git-Newrev: 5a97e3acbd6912f83dbf305def5d87f6a7a32114
X-Patchwork-Hint: ignore
Message-Id: <20260712141842.9919188737@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/xilinx: remove hashes for
 xilinx_v2025.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5a97e3acbd6912f83dbf305def5d87f6a7a32114
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Now that all Xilinx boards have been bumped to xilinx_v2026.1,
the xilinx_v2025.2 hashes can be removed.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash  | 5 -----
 board/xilinx/patches/linux-headers/linux-headers.hash              | 1 -
 board/xilinx/patches/linux/linux.hash                              | 7 -------
 board/xilinx/patches/optee-os/optee-os.hash                        | 2 --
 board/xilinx/patches/uboot/uboot.hash                              | 2 --
 5 files changed, 17 deletions(-)

diff --git a/board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash
deleted file mode 100644
index 88e212d76d..0000000000
--- a/board/xilinx/patches/arm-trusted-firmware/arm-trusted-firmware.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# Locally calculated
-sha256  ea59fbfb702857a24f96ee8e9cf04f997942db1de98f8406b7daf9dcc8f4e9ea  xlnx_rebase_v2.12_2025.2.tar.gz
-
-# Locally calculated
-sha256  b2c79635797bafcde84c6edadadde290b9d5e05deb3ea16a847210fd2ca83669  docs/license.rst
diff --git a/board/xilinx/patches/linux-headers/linux-headers.hash b/board/xilinx/patches/linux-headers/linux-headers.hash
deleted file mode 120000
index 5808d92afe..0000000000
--- a/board/xilinx/patches/linux-headers/linux-headers.hash
+++ /dev/null
@@ -1 +0,0 @@
-../linux/linux.hash
\ No newline at end of file
diff --git a/board/xilinx/patches/linux/linux.hash b/board/xilinx/patches/linux/linux.hash
deleted file mode 100644
index bedb88c7ff..0000000000
--- a/board/xilinx/patches/linux/linux.hash
+++ /dev/null
@@ -1,7 +0,0 @@
-# Locally calculated
-sha256  002fa6c617d3d3eaf1e16219079f4e4303b84ea472b2b3c5d47f766a106a79c7  xlnx_rebase_v6.12_LTS_merge_6.12.70.tar.gz
-
-# Locally calculated
-sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
-sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  LICENSES/preferred/GPL-2.0
-sha256  8e378ab93586eb55135d3bc119cce787f7324f48394777d00c34fa3d0be3303f  LICENSES/exceptions/Linux-syscall-note
diff --git a/board/xilinx/patches/optee-os/optee-os.hash b/board/xilinx/patches/optee-os/optee-os.hash
deleted file mode 100644
index 69bca84314..0000000000
--- a/board/xilinx/patches/optee-os/optee-os.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally calculated
-sha256  3b8969a25815a0be84f34033827e5eb557e10f0f13ebabaee339461f8520ec72  xlnx_rebase_v4.5.0_2025.2.tar.gz
diff --git a/board/xilinx/patches/uboot/uboot.hash b/board/xilinx/patches/uboot/uboot.hash
deleted file mode 100644
index 6ef11ef02c..0000000000
--- a/board/xilinx/patches/uboot/uboot.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally calculated
-sha256  8819cbebda739436d5d2fbdef578ec3c9b902f7edbe0ce4ed6f0ddf254fcf2a7  xlnx_rebase_v2025.01_2025.2.tar.gz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
