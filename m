Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB9DBCCD184
	for <buildroot@archiver.kernel.org>; Sat, 11 Oct 2025 21:21:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73C3860BD2;
	Sat, 11 Oct 2025 21:21:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bqdjgb8alUiP; Sat, 11 Oct 2025 21:21:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 775E860BD7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 775E860BD7;
	Sat, 11 Oct 2025 21:21:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D4C5B195
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 21:21:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BBC04812F6
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 21:21:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cGwnyodEj9fc for <buildroot@buildroot.org>;
 Sat, 11 Oct 2025 21:21:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA819812F2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DA819812F2
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 21:21:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D37E586EAF; Sat, 11 Oct 2025 21:21:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 11 Oct 2025 23:19:09 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 3ac7c958133d10e84a09161446432ea4c48d57f9
X-Git-Newrev: b5092e8343d2065a73818178772c9df78b9015df
X-Patchwork-Hint: ignore
Message-Id: <20251011212152.D37E586EAF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] CHANGES: update for
 2025.05.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=b5092e8343d2065a73818178772c9df78b9015df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 CHANGES | 67 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/CHANGES b/CHANGES
index 459072ca1a..a29d0f2dcd 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,70 @@
+2025.05.3, released October XX, 2025
+
+    This is the final release on the 2025.05.x branch.
+    Important / security related fixes:
+
+    - atop: CVE-2025-31160
+    - civetweb: CVE-2025-55763
+    - cjson: CVE-2025-57052
+    - connman: CVE-2025-32366, CVE-2025-32743
+    - cups: CVE-2025-58060, CVE-2025-58364
+    - exiv2: CVE-2023-44398, CVE-2024-24826, CVE-2024-25112, CVE-2024-39695,
+             CVE-2025-26623, CVE-2025-54080, CVE-2025-55304
+    - expat: CVE-2025-59375
+    - fastd: CVE-2025-24356
+    - fetchmail: CVE number pending
+    - ghostscript: CVE-2025-59798, CVE-2025-59799, CVE-2025-59800,
+                   CVE-2025-59801
+    - imagemagick: CVE-2023-5341, CVE-2025-55004, CVE-2025-55005,
+                   CVE-2025-55160
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
+    - python-flask-cors: CVE-2024-6839, CVE-2024-6844, CVE-2024-6866
+    - python-pip: CVE-2025-8869
+    - raptor: CVE-2024-57822, CVE-2024-57823
+    - sqlite: CVE-2025-6965
+    - syslog-ng: CVE-2024-47619
+    - tiff: CVE-2024-13978, CVE-2025-8961, CVE-2025-9165
+    - udisks: CVE-2025-8067
+    - wireshark: CVE-2025-5601
+
+    Updated / fixed packages: asterisk, avrdude, boinc, boot-wrapper-aarch64,
+    cjson, cpp-httplib, cutekeyboard, docker-engine, ecryptfs-utils, fatcat,
+    fetchmail, firewalld, gnupg2, gnuplot, htpdate, iputils, jose, kodi,
+    libfreeimage, libopenssl, libselinux, libsemanage, libxkbcommon,
+    libxmlrpc, linux-firmware, linuxptp, llvm, lua-utf8, luaossl, luvi,
+    mariadb, mbpfan, micropython, modsecurity2, mosquitto, opencv4, openjpeg,
+    pango, php-lua, policycoreutils, python-aiohttp-session, python-certifi,
+    python-cryptography, python-flask-cors, python-pytz, python3, rtl_433,
+    ruby, samba4, sysprof, ti-k3-boot-firmware, tiff, tor, uclibc, upx,
+    webkitgtk, wlroots, x11r7, xilinx-embeddedsw, xilinx-prebuilt, zziplib
+
+    Removed package: netstat-nat
+
+    Boards updated / fixed: versal, ti_am62x_sk, qemu/{x86, x86_64},
+    zedboard, beagleboneai
+
+    Boards removed: roseapplepi, at91sam9260eknf, atmel_sama5d3xek
+
+    Test Improvements:
+
+    - TestSWIPL: increase timeout value
+    - TestOpenJdk: remove stime() function call
+    - test_hardening: update toolchain to aarch64 for checksec tests
+    - test_docker_compose: update kernel & VM CPU
+    - TestZfsUclibc: use internal backend for uClibc-ng toolchain
+    - GitTestBase: remove git daemon due to Gitlab-CI security settings
+
 2025.05.2, released September 09, 2025
 
 	Important / security related fixes:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
