Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0990ECCA476
	for <buildroot@archiver.kernel.org>; Sat, 11 Oct 2025 21:13:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A03BD40D37;
	Sat, 11 Oct 2025 21:13:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XiIvoNB4ifVp; Sat, 11 Oct 2025 21:13:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A75DB40D32
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A75DB40D32;
	Sat, 11 Oct 2025 21:13:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3FE72119
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 21:13:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3113240D32
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 21:13:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L76JTSMyFz9h for <buildroot@buildroot.org>;
 Sat, 11 Oct 2025 21:13:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C6AA40D31
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5C6AA40D31
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 21:13:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4B11D86E6C; Sat, 11 Oct 2025 21:13:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 11 Oct 2025 23:12:08 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: cd6d8b9b251de4324298a9e4959e4f5e447a3f42
X-Git-Newrev: b65f78267e518df8fa8a5e970943f81573b7a9fa
X-Patchwork-Hint: ignore
Message-Id: <20251011211314.4B11D86E6C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] CHANGES: update for
 2025.02.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=b65f78267e518df8fa8a5e970943f81573b7a9fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 CHANGES | 69 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/CHANGES b/CHANGES
index b9708eb5e0..77bfbd18d4 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,3 +1,72 @@
+2025.02.7, released October 11, 2025
+
+    Important / security related fixes:
+
+    - asterisk: CVE-2024-42491
+    - atop: CVE-2025-31160
+    - civetweb: CVE-2025-55763
+    - cjson: CVE-2025-57052
+    - connman: CVE-2025-32366, CVE-2025-32743
+    - cups: CVE-2025-58060, CVE-2025-58364
+    - exiv2: CVE-2023-44398, CVE-2024-24826, CVE-2024-25112, CVE-2024-39695,
+             CVE-2025-26623, CVE-2025-54080, CVE-2025-55304
+    - expat: CVE-2025-59375
+    - fastd: CVE-2025-24356
+    - fetchmail: CVE-2025-61962
+    - ghostscript: CVE-2025-59798, CVE-2025-59799, CVE-2025-59800, CVE-2025-59801
+    - imagemagick: CVE-2023-5341, CVE-2025-55004, CVE-2025-55005, CVE-2025-55160
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
+    - webkitgtk: CVE-2025-24189, CVE-2025-31273, CVE-2025-31278, CVE-2025-43211,
+      CVE-2025-43212, CVE-2025-43216, CVE-2025-43227, CVE-2025-43228,
+      CVE-2025-43240, CVE-2025-43265, CVE-2025-6558
+    - wireshark: CVE-2025-5601
+
+    Updated / fixed packages: asterisk, atop, boinc, civetweb, cjson,
+    connman, cpp-httplib, cups, cutekeyboard, ecryptfs-utils, exiv2, expat,
+    fastd, fetchmail, ghostscript, gnupg2, gnuplot, htpdate, imagemagick,
+    intel-microcode, iputils, jasper, jose, kodi, libcurl, libopenssl,
+    libssh, libxkbcommon, libxmlrpc, linux-firmware, linux-headers,
+    linuxptp, llvm-project, lua, luaossl, luvi, mariadb, micropython,
+    modsecurity2, opencv4, opencv4-contrib, openjpeg, pango, pcre2, poco,
+    postgresql, python-certifi, python-cryptography, python-django,
+    python-flask-cors, python-pip, python-pyopenssl, python-pytz, raptor,
+    rtl_433, ruby, samba4, sqlite, syslog-ng, sysprof, tiff, tor, uclibc,
+    udisks, upx, webkitgtk, wireshark, wlroots, x11r7, zziplib
+
+    Removed package: netstat-nat
+
+    Boards updated / fixed: beagleboneai, qemu/{x86, x86_64}, ti_am62x_sk
+    versal, zedboard
+
+    Boards removed: roseapplepi, atmel_sama5d3xek, at91sam9260eknf
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
 2025.02.6, released September 09, 2025
 
 	Important / security related fixes:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
