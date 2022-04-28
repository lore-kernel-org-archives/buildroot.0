Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3DC7C433EF
	for <buildroot@archiver.kernel.org>; Thu, 28 Apr 2022 21:09:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A4A0340C65;
	Thu, 28 Apr 2022 21:09:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BTtGAMV2qUkn; Thu, 28 Apr 2022 21:09:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F1DD40C4E;
	Thu, 28 Apr 2022 21:09:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DF6EA1BF2E4
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 21:09:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C76D16119F
 for <buildroot@lists.busybox.net>; Thu, 28 Apr 2022 21:09:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gLtbHJcBSIGK for <buildroot@lists.busybox.net>;
 Thu, 28 Apr 2022 21:09:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 60E36611A4
 for <buildroot@buildroot.org>; Thu, 28 Apr 2022 21:09:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 58D878469F; Thu, 28 Apr 2022 20:58:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 28 Apr 2022 23:00:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 61e525780d2b684799c48aeb3455c6394d3a7fb6
X-Git-Newrev: 24d82e69bc045cabee70af30951694a0007eb51f
X-Patchwork-Hint: ignore
Message-Id: <20220428205845.58D878469F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-ujson: bump to version 5.2.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=24d82e69bc045cabee70af30951694a0007eb51f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patches that are now upstream.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...port-for-aarch64_be-or1k-and-microblazebe.patch | 30 -------
 .../0002-Add-support-of-ARC-architecture.patch     | 36 --------
 .../0003-Add-support-for-microblaze.patch          | 27 ------
 .../0004-Pseiderer-add-nios2-and-xtensa-001.patch  | 95 ----------------------
 package/python-ujson/python-ujson.hash             |  4 +-
 package/python-ujson/python-ujson.mk               |  4 +-
 6 files changed, 4 insertions(+), 192 deletions(-)

diff --git a/package/python-ujson/0001-Add-support-for-aarch64_be-or1k-and-microblazebe.patch b/package/python-ujson/0001-Add-support-for-aarch64_be-or1k-and-microblazebe.patch
deleted file mode 100644
index b43eb54dcd..0000000000
--- a/package/python-ujson/0001-Add-support-for-aarch64_be-or1k-and-microblazebe.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 768a445f0c28311bf88685bf0bb990505c12fd4c Mon Sep 17 00:00:00 2001
-From: Florian Loitsch <florian@loitsch.com>
-Date: Sat, 8 Sep 2018 18:18:15 +0200
-Subject: [PATCH] Add support for aarch64_be, or1k and microblazebe.
-
-Fixes #73.
-
-[Retrieved from:
-https://github.com/google/double-conversion/commit/768a445f0c28311bf88685bf0bb990505c12fd4c]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- double-conversion/utils.h | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/deps/double-conversion/ouble-conversion/utils.h b/deps/double-conversion/double-conversion/utils.h
-index 98a2a11..492bc97 100644
---- a/deps/double-conversion/double-conversion/utils.h
-+++ b/deps/double-conversion/double-conversion/utils.h
-@@ -76,8 +76,9 @@ inline void abort_noreturn() { abort(); }
-     defined(__sparc__) || defined(__sparc) || defined(__s390__) || \
-     defined(__SH4__) || defined(__alpha__) || \
-     defined(_MIPS_ARCH_MIPS32R2) || \
--    defined(__AARCH64EL__) || defined(__aarch64__) || \
--    defined(__riscv)
-+    defined(__AARCH64EL__) || defined(__aarch64__) || defined(__AARCH64EB__) || \
-+    defined(__riscv) || \
-+    defined(__or1k__)
- #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS 1
- #elif defined(__mc68000__) || \
-     defined(__pnacl__) || defined(__native_client__)
diff --git a/package/python-ujson/0002-Add-support-of-ARC-architecture.patch b/package/python-ujson/0002-Add-support-of-ARC-architecture.patch
deleted file mode 100644
index d38b24f5fc..0000000000
--- a/package/python-ujson/0002-Add-support-of-ARC-architecture.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From eafa625a34fd5d8bec18eddfccbca55ce77b4849 Mon Sep 17 00:00:00 2001
-From: Alexey Brodkin <abrodkin@synopsys.com>
-Date: Thu, 1 Nov 2018 17:36:17 +0200
-Subject: [PATCH] Add support of ARC architecture (#82)
-
-More info about ARC architecture is here: [1] & [2].
-We need ARC supported here for many things like:
- - ICU (see [3])
- - Qt5 etc
-
-[1] https://www.synopsys.com/designware-ip/processor-solutions/arc-processors.html
-[2] https://en.wikipedia.org/wiki/ARC_(processor)
-[3] https://unicode-org.atlassian.net/browse/ICU-20155
-
-Fixes #81
-
-[Retrieved from:
-https://github.com/google/double-conversion/commit/eafa625a34fd5d8bec18eddfccbca55ce77b4849]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- double-conversion/utils.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/deps/double-conversion/double-conversion/utils.h b/deps/double-conversion/double-conversion/utils.h
-index 41c5b02..2e1be0d 100644
---- a/deps/double-conversion/double-conversion/utils.h
-+++ b/deps/double-conversion/double-conversion/utils.h
-@@ -94,7 +94,7 @@ int main(int argc, char** argv) {
-     defined(_MIPS_ARCH_MIPS32R2) || \
-     defined(__AARCH64EL__) || defined(__aarch64__) || defined(__AARCH64EB__) || \
-     defined(__riscv) || \
--    defined(__or1k__)
-+    defined(__or1k__) || defined(__arc__)
- #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS 1
- #elif defined(__mc68000__) || \
-     defined(__pnacl__) || defined(__native_client__)
diff --git a/package/python-ujson/0003-Add-support-for-microblaze.patch b/package/python-ujson/0003-Add-support-for-microblaze.patch
deleted file mode 100644
index 14fd52eb98..0000000000
--- a/package/python-ujson/0003-Add-support-for-microblaze.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 5cc233e98b74c5c370de888198a2b35200d55468 Mon Sep 17 00:00:00 2001
-From: Florian Loitsch <florian@toitware.com>
-Date: Sat, 12 Oct 2019 14:35:52 +0200
-Subject: [PATCH] Add support for microblaze.
-
-Really fixes #73.
-[Retrieved (and backported) from:
-https://github.com/google/double-conversion/commit/5cc233e98b74c5c370de888198a2b35200d55468]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- Changelog                 | 4 ++++
- double-conversion/utils.h | 1 +
- 2 files changed, 5 insertions(+)
-
-diff --git a/deps/idouble-conversion/double-conversion/utils.h b/deps/double-conversion/double-conversion/utils.h
-index 1a71df0..221467f 100644
---- a/deps/doyble-conversion/double-conversion/utils.h
-+++ b/deps/double-conversion/double-conversion/utils.h
-@@ -102,6 +102,7 @@ int main(int argc, char** argv) {
-     defined(__AARCH64EL__) || defined(__aarch64__) || defined(__AARCH64EB__) || \
-     defined(__riscv) || \
--    defined(__or1k__) || defined(__arc__)
-+    defined(__or1k__) || defined(__arc__) || \
-+    defined(__microblaze__)
- #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS 1
- #elif defined(__mc68000__)
- #undef DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS
diff --git a/package/python-ujson/0004-Pseiderer-add-nios2-and-xtensa-001.patch b/package/python-ujson/0004-Pseiderer-add-nios2-and-xtensa-001.patch
deleted file mode 100644
index 8648f93c1a..0000000000
--- a/package/python-ujson/0004-Pseiderer-add-nios2-and-xtensa-001.patch
+++ /dev/null
@@ -1,95 +0,0 @@
-From a54561be5588ac9b16d3c20760b9b554168bb8aa Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <pseiderer@users.noreply.github.com>
-Date: Thu, 31 Oct 2019 21:26:27 +0100
-Subject: [PATCH] Pseiderer/add nios2 and xtensa 001 (#119)
-
-* double-conversion: enable for nios2
-
-Nios2 supports double conversion, tested using qemu:
-
-./main || echo "correct"
-correct
-uname -a
-Linux buildroot 4.19.16 #4 Sat Aug 3 14:46:48 CEST 2019 nios2 GNU/Linux
-
-Solves build error
-
-In file included from double-conversion.h:42:0,
-                 from number_decimalquantity.cpp:19:
-double-conversion-utils.h:119:2: error: #error Target architecture was not detected as supported by Double-Conversion.
- #error Target architecture was not detected as supported by Double-Conversion.
-
-detected by buildroot autobuilders:
-http://autobuild.buildroot.net/results/91e/91eaec34708d91f8a05af189243be0b7cabce31b/
-
-Patch sent upstream: https://github.com/unicode-org/icu/pull/725
-Bug report: https://unicode-org.atlassian.net/browse/ICU-20751
-
-[Bernd: Fixed path]
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-[Added Changelog entry]
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
-
-* double-conversion: enable for xtensa
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
-
-[Retrieved (dand backported) from:
-https://github.com/google/double-conversion/commit/a54561be5588ac9b16d3c20760b9b554168bb8aa]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
-Note:
-
-Double-conversion tested with:
-
-        $ cat div.c
-double Div_double(double x, double y) { return x / y; }
-
-        $ cat main.c
-double Div_double(double x, double y);
-
-int main(int argc, char** argv) {
-  double result = Div_double(89255.0, 1e22);
-  if (result == 89255e-22) {
-    printf("correct result %e\n", result);
-    return 1;
-  } else {
-    printf("wrong result %e\n", result);
-    return 0;
-  }
-}
-
-Tested for xtensa (using qemu_xtensa_lx60_defconfig plus BR2_PACKAGE_HOST_QEMU_LINUX_USER_MODE):
-
-        $ ./host/bin/xtensa-buildroot-linux-uclibc-gcc -c div.c
-        $ ./host/bin/xtensa-buildroot-linux-uclibc-gcc -c main.c
-        $ ./host/bin/xtensa-buildroot-linux-uclibc-gcc -o main main.o div.o
-
-        $ ./host/bin/qemu-xtensa -L staging main
-correct result 8.925500e-18
----
- Changelog                 | 4 ++++
- double-conversion/utils.h | 3 ++-
- 2 files changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/deps/double-conversion/double-conversion/utils.h b/deps/double-conversion/double-conversion/utils.h
-index 221467f..98ec28b 100644
---- a/deps/double-conversion/double-conversion/utils.h
-+++ b/deps/double-conversion/double-conversion/utils.h
-@@ -94,6 +94,7 @@ int main(int argc, char** argv) {
-     defined(__ARMEL__) || defined(__avr32__) || defined(_M_ARM) || defined(_M_ARM64) || \
-     defined(__hppa__) || defined(__ia64__) || \
-     defined(__mips__) || \
-+    defined(__nios2__) || \
-     defined(__powerpc__) || defined(__ppc__) || defined(__ppc64__) || \
-     defined(_POWER) || defined(_ARCH_PPC) || defined(_ARCH_PPC64) || \
-     defined(__sparc__) || defined(__sparc) || defined(__s390__) || \
-@@ -102,7 +103,7 @@ int main(int argc, char** argv) {
-     defined(__AARCH64EL__) || defined(__aarch64__) || defined(__AARCH64EB__) || \
-     defined(__riscv) || defined(__e2k__) || \
-     defined(__or1k__) || defined(__arc__) || \
--    defined(__microblaze__)
-+    defined(__microblaze__) || defined(__XTENSA__)
- #define DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS 1
- #elif defined(__mc68000__)
- #undef DOUBLE_CONVERSION_CORRECT_DOUBLE_OPERATIONS
diff --git a/package/python-ujson/python-ujson.hash b/package/python-ujson/python-ujson.hash
index fc897c381b..e88e273145 100644
--- a/package/python-ujson/python-ujson.hash
+++ b/package/python-ujson/python-ujson.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/ujson/json
-md5  9a90e2e9f1d465c2121b8d10f837f53a  ujson-4.2.0.tar.gz
-sha256  fffe509f556861c7343c6cba57ed05fe7bcf4b48a934a5b946ccb45428cf8883  ujson-4.2.0.tar.gz
+md5  2c7ffd2bf23f6f07da3a0cbf5ff5c2f0  ujson-5.2.0.tar.gz
+sha256  163191b88842d874e081707d35de2e205e0e396e70fd068d1038879bca8b17ad  ujson-5.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  6a00a8f8b4050303368b694147bde1aed9c96bdff869c181dbbf3ccb784a1501  LICENSE.txt
diff --git a/package/python-ujson/python-ujson.mk b/package/python-ujson/python-ujson.mk
index 68781c6170..8eb5f6a0a7 100644
--- a/package/python-ujson/python-ujson.mk
+++ b/package/python-ujson/python-ujson.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_UJSON_VERSION = 4.2.0
+PYTHON_UJSON_VERSION = 5.2.0
 PYTHON_UJSON_SOURCE = ujson-$(PYTHON_UJSON_VERSION).tar.gz
-PYTHON_UJSON_SITE = https://files.pythonhosted.org/packages/df/69/e8f615e1a779e2d2d23d29d56dc55bbb1db2a828f0ef36d10bc697d63968
+PYTHON_UJSON_SITE = https://files.pythonhosted.org/packages/e4/fc/2dee0e78162aa1ad03dadde9a9b5c281d6f8bb0eed6810a270486d8fc041
 PYTHON_UJSON_SETUP_TYPE = setuptools
 PYTHON_UJSON_LICENSE = BSD-3-Clause
 PYTHON_UJSON_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
