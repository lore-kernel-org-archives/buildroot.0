Return-Path: <SRS0=a1j9=PE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 310CDC4167B
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 07:40:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE4A561213
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 07:40:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BE4A561213
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 85E2F400BE;
	Sat, 16 Oct 2021 07:40:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k_iPnXb_eT3V; Sat, 16 Oct 2021 07:40:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 99BE7401DF;
	Sat, 16 Oct 2021 07:40:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DB32C1BF369
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 07:39:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D1687400BE
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 07:39:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ilta_Vri4wDN for <buildroot@lists.busybox.net>;
 Sat, 16 Oct 2021 07:39:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BCABD401D1
 for <buildroot@buildroot.org>; Sat, 16 Oct 2021 07:39:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 43BB089018; Sat, 16 Oct 2021 07:36:38 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 16 Oct 2021 09:39:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9b2d4a4211b8c8d9ece45b472c4f7cdbbb1ee526
X-Git-Newrev: 05d734e0b9fbfb23a2a6fdd1db75af03ebf3e9ac
X-Patchwork-Hint: ignore
Message-Id: <20211016073638.43BB089018@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-ujson: fix xtensa build
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=05d734e0b9fbfb23a2a6fdd1db75af03ebf3e9ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the follownig build failure on xtensa since bump to version 4.1.0 in
commit a47f332a20bf3f79ef4903c8ddd2b7917217e354 and
https://github.com/ultrajson/ultrajson/commit/eb7d894f225bb89d269188ba6ec559b914a71b8a:

In file included from ./deps/double-conversion/double-conversion/bignum-dtoa.h:31,
                 from ./deps/double-conversion/double-conversion/bignum-dtoa.cc:30:
./deps/double-conversion/double-conversion/utils.h:92:2: error: #error Target architecture was not detected as supported by Double-Conversion.
   92 | #error Target architecture was not detected as supported by Double-Conversion.
      |  ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/c75157538d7784809d935aefcb166e89c137c9b7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../0004-Pseiderer-add-nios2-and-xtensa-001.patch  | 95 ++++++++++++++++++++++
 1 file changed, 95 insertions(+)

diff --git a/package/python-ujson/0004-Pseiderer-add-nios2-and-xtensa-001.patch b/package/python-ujson/0004-Pseiderer-add-nios2-and-xtensa-001.patch
new file mode 100644
index 0000000000..8648f93c1a
--- /dev/null
+++ b/package/python-ujson/0004-Pseiderer-add-nios2-and-xtensa-001.patch
@@ -0,0 +1,95 @@
+From a54561be5588ac9b16d3c20760b9b554168bb8aa Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <pseiderer@users.noreply.github.com>
+Date: Thu, 31 Oct 2019 21:26:27 +0100
+Subject: [PATCH] Pseiderer/add nios2 and xtensa 001 (#119)
+
+* double-conversion: enable for nios2
+
+Nios2 supports double conversion, tested using qemu:
+
+./main || echo "correct"
+correct
+uname -a
+Linux buildroot 4.19.16 #4 Sat Aug 3 14:46:48 CEST 2019 nios2 GNU/Linux
+
+Solves build error
+
+In file included from double-conversion.h:42:0,
+                 from number_decimalquantity.cpp:19:
+double-conversion-utils.h:119:2: error: #error Target architecture was not detected as supported by Double-Conversion.
+ #error Target architecture was not detected as supported by Double-Conversion.
+
+detected by buildroot autobuilders:
+http://autobuild.buildroot.net/results/91e/91eaec34708d91f8a05af189243be0b7cabce31b/
+
+Patch sent upstream: https://github.com/unicode-org/icu/pull/725
+Bug report: https://unicode-org.atlassian.net/browse/ICU-20751
+
+[Bernd: Fixed path]
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[Added Changelog entry]
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+
+* double-conversion: enable for xtensa
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+
+[Retrieved (dand backported) from:
+https://github.com/google/double-conversion/commit/a54561be5588ac9b16d3c20760b9b554168bb8aa]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+Note:
+
+Double-conversion tested with:
+
+        $ cat div.c
+double Div_double(double x, double y) { return x / y; }
+
+        $ cat main.c
+double Div_double(double x, double y);
+
+int main(int argc, char** argv) {
+  double result = Div_double(89255.0, 1e22);
+  if (result == 89255e-22) {
+    printf("correct result %e\n", result);
+    return 1;
+  } else {
+    printf("wrong result %e\n", result);
+    return 0;
+  }
+}
+
+Tested for xtensa (using qemu_xtensa_lx60_defconfig plus BR2_PACKAGE_HOST_QEMU_LINUX_USER_MODE):
+
+        $ ./host/bin/xtensa-buildroot-linux-uclibc-gcc -c div.c
+        $ ./host/bin/xtensa-buildroot-linux-uclibc-gcc -c main.c
+        $ ./host/bin/xtensa-buildroot-linux-uclibc-gcc -o main main.o div.o
+
+        $ ./host/bin/qemu-xtensa -L staging main
+correct result 8.925500e-18
+---
+ Changelog                 | 4 ++++
+ double-conversion/utils.h | 3 ++-
+ 2 files changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/deps/double-conversion/double-conversion/utils.h b/deps/double-conversion/double-conversion/utils.h
+index 221467f..98ec28b 100644
+--- a/deps/double-conversion/double-conversion/utils.h
++++ b/deps/double-conversion/double-conversion/utils.h
+@@ -94,6 +94,7 @@ int main(int argc, char** argv) {
+     defined(__ARMEL__) || defined(__avr32__) || defined(_M_ARM) || defined(_M_ARM64) || \
+     defined(__hppa__) || defined(__ia64__) || \
+     defined(__mips__) || \
++    defined(__nios2__) || \
+     defined(__powerpc__) || defined(__ppc__) || defined(__ppc64__) || \
+     defined(_POWER) || defined(_ARCH_PPC) || defined(_ARCH_PPC64) || \
+     defined(__sparc__) || defined(__sparc) || defined(__s390__) || \
+@@ -102,7 +103,7 @@ int main(int argc, char** argv) {
+     defined(__AARCH64EL__) || defined(__aarch64__) || defined(__AARCH64EB__) || \
+     defined(__riscv) || defined(__e2k__) || \
+     defined(__or1k__) || defined(__arc__) || \
+-    defined(__microblaze__)
++    defined(__microblaze__) || defined(__XTENSA__)
+ #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS 1
+ #elif defined(__mc68000__)
+ #undef DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
