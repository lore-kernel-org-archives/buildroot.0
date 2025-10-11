Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 985D6CCD184
	for <buildroot@archiver.kernel.org>; Sat, 11 Oct 2025 21:47:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 622E740D11;
	Sat, 11 Oct 2025 21:47:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mGbCotG6QLs9; Sat, 11 Oct 2025 21:47:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7A2840A1E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7A2840A1E;
	Sat, 11 Oct 2025 21:47:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F789BC
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 21:47:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 346FE60A89
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 21:47:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WXzQihyqei9Y for <buildroot@buildroot.org>;
 Sat, 11 Oct 2025 21:47:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 78D6360BE1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 78D6360BE1
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 21:47:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 50D1387064; Sat, 11 Oct 2025 21:47:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 11 Oct 2025 23:46:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7e43f888595bc20ce4b59334b5fb406473173f57
X-Git-Newrev: acecedc001185b0258f6c8d84f8827a3ebe382f4
X-Patchwork-Hint: ignore
Message-Id: <20251011214721.50D1387064@busybox.osuosl.org>
Subject: [Buildroot] [git commit] CHANGES: update for 2025.08.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=acecedc001185b0258f6c8d84f8827a3ebe382f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 8d941a2f5513f4aa1e4bfa431927488119eb5736)
---
 CHANGES | 56 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/CHANGES b/CHANGES
index 97fd0b3db8..ce58f96059 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,59 @@
+2025.08.1, released October 11, 2025
+
+    Important / security related fixes:
+
+    - atop: CVE-2025-31160
+    - civetweb: CVE-2025-55763
+    - cjson: CVE-2025-57052
+    - connman: CVE-2025-32366, CVE-2025-32743
+    - cups: CVE-2025-58060, CVE-2025-58364
+    - expat: CVE-2025-59375
+    - fastd: CVE-2025-24356
+    - fetchmail: CVE number pending
+    - ghostscript: CVE-2025-59798, CVE-2025-59799, CVE-2025-59800,
+                   CVE-2025-59801
+    - intel-microcode: CVE-2025-20053, CVE-2025-20109, CVE-2025-22839,
+                       CVE-2025-22840, CVE-2025-22889, CVE-2025-26403
+    - jasper: CVE-2023-51257, CVE-2025-8835
+    - libcurl: CVE-2025-10148, CVE-2025-9086
+    - libopenssl: CVE-2025-9230, CVE-2025-9231, CVE-2025-9232
+    - libssh: CVE-2025-8114, CVE-2025-8277
+    - lua: CVE-2014-5461
+    - opencv4: CVE-2025-53644
+    - pcre2: CVE-2025-58050
+    - poco: CVE-2025-6375
+    - postgresql: CVE-2025-8713, CVE-2025-8714, CVE-2025-8715
+    - python-django: CVE-2025-57833, CVE-2025-59681, CVE-2025-59682
+    - python-pip: CVE-2025-8869
+    - raptor: CVE-2024-57822, CVE-2024-57823
+    - syslog-ng: CVE-2024-47619
+    - tiff: CVE-2024-13978, CVE-2025-8961, CVE-2025-9165
+
+
+    Updated / fixed packages: asterisk, boinc, boot-wrapper-aarch64, c-icap,
+    chocolate-doom, cjson, cpp-httplib, cutekeyboard, docker-engine, fatcat,
+    fluent-bit, gnupg2, gnuplot, htpdate, iputils, kodi, libfreeimage,
+    libopenssl, libselinux, libsemanage, libxkbcommon, libxmlrpc,
+    linux-firmware, linuxptp, llvm, luaossl, luvi, mariadb, mdio-tools,
+    modsecurity2, openjpeg, pango, php-lua, policycoreutils,
+    python-aiohttp-session, python-certifi, python-cryptography,
+    python-flask-cors, python-pytz, python-trove-classifiers,
+    python-typing-extensions, rtl8723bu, rtl8723ds, rtl8821cu, rtl8822cs,
+    rtl_433, ruby, samba4, sysprof, ti-k3-boot-firmware, tiff, tor, uboot,
+    uclibc, upx, vulkan-headers, webkitgtk, wilc-driver, wlroots, x11r7,
+    xilinx-embeddedsw, xilinx-prebuilt, xlib_xtrans, xr819-xradio, zziplib
+
+    Boards updated / fixed: beagleboneai, loongarch64-efi, qemu (all),
+    versal, zedboard
+
+    Boards removed: at91sam9260eknf, atmel_sama5d3xek, roseapplepi
+
+    Test Improvements:
+
+    - test_docker_compose: update kernel & VM CPU
+    - TestZfsUclibc: use internal backend for uClibc-ng toolchain
+    - GitTestBase: remove git daemon due to Gitlab-CI security settings
+
 2025.08, released September 7th, 2025
 
 	Fixes all over the tree.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
