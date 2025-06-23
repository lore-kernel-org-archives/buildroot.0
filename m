Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B4EC7115B
	for <buildroot@archiver.kernel.org>; Mon, 23 Jun 2025 16:46:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2DE940A7A;
	Mon, 23 Jun 2025 16:46:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m98-V7JfUSR1; Mon, 23 Jun 2025 16:46:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA9EC40A4E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA9EC40A4E;
	Mon, 23 Jun 2025 16:46:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 168C1154
 for <buildroot@buildroot.org>; Mon, 23 Jun 2025 16:46:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F1EE64024C
 for <buildroot@buildroot.org>; Mon, 23 Jun 2025 16:46:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ifbjRZua8R0Q for <buildroot@buildroot.org>;
 Mon, 23 Jun 2025 16:46:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 356304013F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 356304013F
 for <buildroot@buildroot.org>; Mon, 23 Jun 2025 16:46:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2B68783F63; Mon, 23 Jun 2025 16:46:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 23 Jun 2025 18:30:47 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: a9fd428c61818af415eae87e4d0d6ef908a08f25
X-Git-Newrev: a7eb8e598d617ba03ae756cf3bb6199bb52180b7
X-Patchwork-Hint: ignore
Message-Id: <20250623164650.2B68783F63@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] CHANGES: update for
 2025.02.4
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a7eb8e598d617ba03ae756cf3bb6199bb52180b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 CHANGES | 72 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/CHANGES b/CHANGES
index 83af598510..b8b88f8a6f 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,75 @@
+2025.02.4, released June 23th, 2025
+
+    Important / security related fixes:
+
+    - assimp: CVE-2025-3015, CVE-2025-3016
+    - binutils: CVE-2025-3198
+    - connman: CVE-2025-32366, CVE-2025-32743
+    - go: CVE-2025-0913, CVE-2025-4673, CVE-2025-22874
+    - iputils: CVE-2025-47268, CVE-2025-48964
+    - jq: CVE-2024-23337, CVE-2025-48060, CVE-2024-53427
+    - libcurl: CVE-2025-4947, CVE-2025-5025, CVE-2025-5399
+    - net-tools: CVE-2025-46836
+    - nodejs: CVE-2025-23165, CVE-2025-23166
+    - openvmtools: CVE-2025-22247
+    - python-django: CVE-2025-48432
+    - python-requests: CVE-2024-47081
+    - python-tornado: CVE-2025-47287
+    - redis: CVE-2025-21605, CVE-2025-27151
+    - samba4: CVE-2025-0620
+    - sox: CVE-2021-23159, CVE-2021-23172, CVE-2021-23210, CVE-2021-3643,
+        CVE-2021-40426, CVE-2022-31650, CVE-2022-31651, CVE-2023-26590,
+        CVE-2023-32627, CVE-2023-34318
+    - webkitgtk: CVE-2025-24223, CVE-2025-31204, CVE-2025-31205,
+        CVE-2025-31206, CVE-2025-31215, CVE-2025-31257
+
+    Updated / fixed packages: alsa-utils, atkmm, atmm2_28, audit,
+    bluez5_utils, busybox, catch2, connman, dbus-glib, dlib, dovecot,
+    esp-hosted, execline, firmware-ele-imx, flex, fluent-bit, freescale-imx,
+    ghostscript, gmrender-resurrect, grub2, gst1-plugins-bad, gtkmm3, iputils,
+    kmsxx, libcamera, libcurl, libglade, libical, libuv, llvm-project,
+    lm-sensors, m4, mesa3d, mongoose, openvmtools, php, protobuf-c,
+    python-django, python-fastapi, python-flit-core, python-jc,
+    python-requests, python-uvicorn, qt5 (declarative, webengine,
+    webengine-chromium), qt6 (base, multimedia, tools), rpm, samba4, spdlog,
+    systemd, uacme, uboot-tools, yasm
+
+    Removed package: libebur128
+
+    Infrastructure updates / fixes:
+
+    - pkg-cmake now forces CMake>=3.5
+    - pkg-meson now uses a dedicated buildroot build directory
+      see https://gitlab.com/buildroot.org/buildroot/-/issues/64
+    - include defconfigs in sub-directories in make list-defconfigs
+    - new manual section about private repositories
+    - pkg-autotools: handle libtool 2.5.x
+    - pkg-cmake: force check_language(CXX) to be false when building w/o C++
+    - pkg-stats: add support for reporting stale CVE entries
+    - add basic support for package file download over smb
+    - toolchain/wrapper: check unsafe paths earlier
+    - test_flutter: drop unneeded vga/vnc stanzas from QEMU invocation
+
+    Test improvements
+
+    - new python-pydantic runtime tests
+    - new dieharder runtime test
+    - test_xen: fix runtime test
+    - test_timezone: fix test by setting a fixed time
+    - new tree runtime test
+
+    Boards fixes
+
+    - imx6ulz-bsh-smm-m2: fix missing U-Boot
+    - freescale: fix cpu name in i.MX9 boards
+    - imx8mn-bsh-smm-s2: erase the entire NAND chip
+    - freescale_t1040d4rdb: fix kernel build
+
+    In addition, thanks to the new stale CVE reporting, reported
+    vulnerabilities have been fixed for the following packages:
+    busybox, dnsmasq, dovecot, exim, exim, freeradius-server, grub2,
+    libopenh264, libssh, netsnmp, ninja, qt5base, ripgrep, sox, tinyxml
+
 2025.02.3, released May 19th, 2025
 	Build issues and other problems solved for packages:
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
