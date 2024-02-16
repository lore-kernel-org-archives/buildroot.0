Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9041C48260
	for <buildroot@archiver.kernel.org>; Fri, 16 Feb 2024 21:25:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64E6842095;
	Fri, 16 Feb 2024 21:25:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6g8uo1agBIMF; Fri, 16 Feb 2024 21:25:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4619C4208F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4619C4208F;
	Fri, 16 Feb 2024 21:25:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4830F1BF2C7
 for <buildroot@lists.busybox.net>; Fri, 16 Feb 2024 21:25:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 358BD4208F
 for <buildroot@lists.busybox.net>; Fri, 16 Feb 2024 21:25:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id orI_s0p6d9jO for <buildroot@lists.busybox.net>;
 Fri, 16 Feb 2024 21:25:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.87;
 helo=smtpcmd0987.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D17BB42049
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D17BB42049
Received: from smtpcmd0987.aruba.it (smtpcmd0987.aruba.it [62.149.156.87])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D17BB42049
 for <buildroot@buildroot.org>; Fri, 16 Feb 2024 21:25:47 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id b5iLrQoMVuLAqb5iLrmcIM; Fri, 16 Feb 2024 22:25:45 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Fri, 16 Feb 2024 22:25:43 +0100
Message-Id: <20240216212543.474327-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfMu12pzmxNOhQC3lhFC3qVLNJGSaaPWXZ07JoewSzuPy2fe+p/sFUIye82NSpSHWCiScKR2wNjEP6q3dRaaRfTeZoBcQ5pSbZKVGfMjJzISq/SXFKNO8
 SBB70rvR3KpBcvZV198jxRarV5SPUXa/dyHQumgMJEPDEFj+hOfERDvMjv0O5vK+HGklmsjmptmYangSGzSslLRKOBFTTiMa9BI98tlP7q8jb9+n2ZKt2b/A
 /h+QtSmdXeXCjN6Qn0JZvEkXq5u79Tz3QQZ6YaKyZ8VFPz+8Zbuen2N3sDQozk9WQwzeoNog2PnEm2m/zHOJ90F4pSZiKiYM7TJ5IA19pEexvbajS/BGUqIt
 FMLMQjZy
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1708118745; bh=A4MdIOWfD4CuaeURvpo5JAR75w+VJr4fQXAabgTDikE=;
 h=From:To:Subject:Date:MIME-Version;
 b=lnIJpWtwq1zef1dHh9WQeAPc4+eBgXSAExmRJN0qRizWq/+46TyAp5VZ7EbynmwwI
 2jbG0KvxfvLzBdmir/1hROjt+gfmo7r+8Ubwlg48u5Zn7eQxJfHLYhj/XFAK3qoHB6
 DBr3i2cOMK+4T7R9o/KnGUephUC0BxfgpQM0uCz1n+rDbC2mC+/LJH2YR9WGieKuDk
 CpjcRSFBHkkN5VKVzek3X7CI/MMMvvW/BPOjFN6eE507Rnlk99FKqk2lk4YfWJrICR
 saKENKtL1KK+upL+RyJvk73jEtnG1cdUrr+irwmDiQZpDPQzghLaaqJKuJcKPc4Sv8
 8bh8fZiTcOj+Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=lnIJpWtw
Subject: [Buildroot] [PATCH v2] package/attr: fix build failure on
 Microblaze architecture
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Microblaze architecture __has_attribute(__symver__) support is broken
and always return true even if symver is not supported so let's add a local
patch pending upstream to detect if symver is supported during autoreconf.
Let's also add ATTR_AUTORECONF = YES to let patch to affect building.

Fixes:
http://autobuild.buildroot.org/results/29c76e02becedf922bd7dc0533338c078bf77d2a

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* written commit log as suggested by Thomas(there was no commit log at all
  since this patch has been pointed during Buildroot Dev Days in IRC to me)
* re-sent local patch to the correct maililng list and updated Upstream:
  URL
---
 ...dd-detection-of-symver-gcc-attribute.patch | 68 +++++++++++++++++++
 package/attr/attr.mk                          |  3 +
 2 files changed, 71 insertions(+)
 create mode 100644 package/attr/0002-configure.ac-add-detection-of-symver-gcc-attribute.patch

diff --git a/package/attr/0002-configure.ac-add-detection-of-symver-gcc-attribute.patch b/package/attr/0002-configure.ac-add-detection-of-symver-gcc-attribute.patch
new file mode 100644
index 0000000000..ca773cf0fc
--- /dev/null
+++ b/package/attr/0002-configure.ac-add-detection-of-symver-gcc-attribute.patch
@@ -0,0 +1,68 @@
+From 1be7c2251040f1152de9ceb5263e6e96fa5c3d75 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Tue, 6 Feb 2024 15:33:15 +0100
+Subject: [PATCH] configure.ac: add detection of symver gcc attribute
+
+On non-ELF platforms, such as microblaze, builds will fail when trying
+to add symver information because  __attribute__((symver ..)) is not
+supported even though __has_attribute(__symver__) returns true.
+
+Support for symver needs to be detected via a compile test since
+__has_attribute can report false positives [0].
+
+Add a configure compile check for __attribute__((symver ..)) to ensure
+it is supported and define a variable to advertise support.
+
+[0] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101766#c1
+
+Upstream: https://lists.nongnu.org/archive/html/acl-devel/2024-02/msg00003.html
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ configure.ac       | 15 +++++++++++++++
+ libattr/syscalls.c |  2 +-
+ 2 files changed, 16 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 7e362e9..98477b5 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -57,6 +57,21 @@ AS_CASE([$host_os],
+ 	[linux*], [os_linux=yes])
+ AM_CONDITIONAL([OS_LINUX], [test "x$os_linux" = "xyes"])
+ 
++AC_CACHE_CHECK(whether __attribute__((__symver__())) is supported,
++	gcc_cv_symver_attribute,
++	[cat > conftest.c <<EOF
++void foo (void) {}
++__typeof(foo) foo __attribute__ ((__symver__("foo@foo")));
++EOF
++	gcc_cv_symver_attribute=no
++	if ${CC-cc} -Werror -S conftest.c -o conftest.s >/dev/null 2>&1; then \
++	    gcc_cv_symver_attribute=yes
++	fi
++	rm -f conftest.[cs]
++])
++AS_IF([test $gcc_cv_symver_attribute = yes],
++      [AC_DEFINE(HAVE_SYMVER_ATTRIBUTE, [], [GCC supports symver attribute])])
++
+ AC_CONFIG_COMMANDS([include/attr],
+ 	[dnl
+ 	rm -rf include/attr
+diff --git a/libattr/syscalls.c b/libattr/syscalls.c
+index 907560a..caa70bc 100644
+--- a/libattr/syscalls.c
++++ b/libattr/syscalls.c
+@@ -32,7 +32,7 @@
+  * fall back to traditional .symver asm directive otherwise.
+  */
+ #ifdef __has_attribute
+-# if __has_attribute(__symver__)
++# if defined(HAVE_SYMVER_ATTRIBUTE)
+ #  define SYMVER(cn, vn) __typeof(cn) cn __attribute__((__symver__(vn)))
+ # elif __has_attribute(__no_reorder__)
+    /*
+-- 
+2.43.0
+
diff --git a/package/attr/attr.mk b/package/attr/attr.mk
index d1397921ff..1d24144f46 100644
--- a/package/attr/attr.mk
+++ b/package/attr/attr.mk
@@ -11,6 +11,9 @@ ATTR_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
 ATTR_LICENSE_FILES = doc/COPYING doc/COPYING.LGPL
 ATTR_CPE_ID_VALID = YES
 
+# Flag added for patch dealing with symver in configure.ac
+ATTR_AUTORECONF = YES
+
 ATTR_INSTALL_STAGING = YES
 
 ATTR_CONF_OPTS = --disable-nls
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
