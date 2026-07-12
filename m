Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 907A1C43458
	for <buildroot@archiver.kernel.org>; Sun, 12 Jul 2026 14:19:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 546F58122A;
	Sun, 12 Jul 2026 14:19:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fp7gDret8FY0; Sun, 12 Jul 2026 14:19:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65E328126C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783865962;
	bh=l1xYs5BzmMvK4PQjq3Evi5dtLGOL/ahZIvMRO5uPfxY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=edabBs3gRwXJOyu6RhJ1UIvKotAxG+4HUUKTZ6CWjFnpILEoUzijo9/U3UE5T6ogw
	 MkbMYeeAWPHt+kn5d79B6QYIGOpwS3xWlVVtO1me6aNSwRTCyUPawoPeHRODZNauiI
	 fMlRtAi1FgqvrKWCjb4UP2fohARQO8F6lWpNU3OxQpNz8aOZxUrI+4k9gotQTq99Sy
	 fWcs3Nc+zQK4tUuMEO1GS++D8GBLNH9a1raY2qlHLnr71ivZZ88dKIU/1hGNUGzTRv
	 kXPq5NN6FwdAKwnrPq1X8lkRFJoSZqmJbehKarl76Aw3Ra9djzVZD9q2tTslkZCxJw
	 NvnZmolkZAbBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65E328126C;
	Sun, 12 Jul 2026 14:19:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 425AB442
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 14:19:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2914740108
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 14:19:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pKWUI5eGfSxP for <buildroot@buildroot.org>;
 Sun, 12 Jul 2026 14:19:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 342344019E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 342344019E
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 14:19:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 60D3288737; Sun, 12 Jul 2026 14:18:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 12 Jul 2026 16:18:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9116fab8af8436c02f72b2307df305a444dfdc7a
X-Git-Newrev: 802fb107e3c86b9e993c3ed55de609df887a45e5
X-Patchwork-Hint: ignore
Message-Id: <20260712141842.60D3288737@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/xilinx: add xilinx_v2026.1 hashes
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/802fb107e3c86b9e993c3ed55de609df887a45e5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Add hashes for the Xilinx vendor repo xilinx_v2026.1 release tag.

Create a new sub-dir including the version name because the legal-info hashes
change between versions for linux and the arm-trusted-firmware. This way, any
time there is a version bump, the new version hashes can be added before the
old version hashes are removed and the legal-info can always be verified.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../patches/arm-trusted-firmware/arm-trusted-firmware.hash         | 5 +++++
 .../xilinx/xilinx_v2026.1/patches/linux-headers/linux-headers.hash | 1 +
 board/xilinx/xilinx_v2026.1/patches/linux/linux.hash               | 7 +++++++
 board/xilinx/xilinx_v2026.1/patches/optee-os/optee-os.hash         | 2 ++
 board/xilinx/xilinx_v2026.1/patches/uboot/uboot.hash               | 2 ++
 5 files changed, 17 insertions(+)

diff --git a/board/xilinx/xilinx_v2026.1/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/xilinx/xilinx_v2026.1/patches/arm-trusted-firmware/arm-trusted-firmware.hash
new file mode 100644
index 0000000000..d40bcad589
--- /dev/null
+++ b/board/xilinx/xilinx_v2026.1/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -0,0 +1,5 @@
+# Locally calculated
+sha256  6047af5f352fa7aaacd988a3fe0d018627dcc200dfdf93de0c0dc8072adef828  xlnx-rebase-v2.14_2026.1.tar.gz
+
+# Locally calculated
+sha256  dbc8c4c1042f833ac961730cda41f87b6845068d9b5be2c90726504cfc82382e  docs/license.rst
diff --git a/board/xilinx/xilinx_v2026.1/patches/linux-headers/linux-headers.hash b/board/xilinx/xilinx_v2026.1/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/xilinx/xilinx_v2026.1/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/xilinx/xilinx_v2026.1/patches/linux/linux.hash b/board/xilinx/xilinx_v2026.1/patches/linux/linux.hash
new file mode 100644
index 0000000000..6bfa4d2408
--- /dev/null
+++ b/board/xilinx/xilinx_v2026.1/patches/linux/linux.hash
@@ -0,0 +1,7 @@
+# Locally calculated
+sha256  23c9cf18f5f419dfaafe5c3d3eda4812eb71bf1f2fbf3b35470478bbaa3d96bb  xlnx_rebase_v6.18_LTS_2026.1.tar.gz
+
+# Locally calculated
+sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
+sha256  8780e78a1a737e127f25a65f6d95269bffd36158dc261114de7859b490bfc5aa  LICENSES/preferred/GPL-2.0
+sha256  8e378ab93586eb55135d3bc119cce787f7324f48394777d00c34fa3d0be3303f  LICENSES/exceptions/Linux-syscall-note
diff --git a/board/xilinx/xilinx_v2026.1/patches/optee-os/optee-os.hash b/board/xilinx/xilinx_v2026.1/patches/optee-os/optee-os.hash
new file mode 100644
index 0000000000..8dde8c24ea
--- /dev/null
+++ b/board/xilinx/xilinx_v2026.1/patches/optee-os/optee-os.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  0d33919008db24241580ac54c355d5c7efb18b089c2a7248704676a769790380  xlnx-rebase-v4.9.0_2026.1.tar.gz
diff --git a/board/xilinx/xilinx_v2026.1/patches/uboot/uboot.hash b/board/xilinx/xilinx_v2026.1/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..52fcaf846f
--- /dev/null
+++ b/board/xilinx/xilinx_v2026.1/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  bc42689fffa878f9852120b167b871d8294697441cdd9f8347506a30d4024e8c  xlnx-rebase-v2026.01_2026.1.tar.gz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
