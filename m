Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80051C4829B
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 15:54:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 20FA441573;
	Tue,  6 Feb 2024 15:54:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 20FA441573
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yzyJK_nbgW-2; Tue,  6 Feb 2024 15:54:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5369041579;
	Tue,  6 Feb 2024 15:54:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5369041579
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BD22E1BF215
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 15:54:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A2B74404A6
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 15:54:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2B74404A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uyaa-gzYMvLC for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 15:54:18 +0000 (UTC)
Received: from smtpcmd0986.aruba.it (smtpcmd0986.aruba.it [62.149.156.86])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E628C40499
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 15:54:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E628C40499
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id XNm1rKbVZoTDCXNm1r0nti; Tue, 06 Feb 2024 16:54:14 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue,  6 Feb 2024 16:54:13 +0100
Message-Id: <20240206155413.1349720-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240206161152.0e178414@windsurf>
References: <20240206161152.0e178414@windsurf>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfJVka2vnGOHVi6aBvzs79joV0x5TEkoty93Mrr0xowF0LK8IovC9LcTbWOSRjMtIxaDfFf+170k58iOoSEgOaVeUIpDzwWhWc0NjMhTWvWI3luEyimm3
 3YZAduTcFHB0tK/rXH+jJpmOWOqd5Wwkw9rn3VsxMakvrKVlNjyLiNlUqRdo8e89+1Wurx0mAVakFOT9MVg7+iZDR5q7lBn3ExSHw4DMwJIjx2STXFOVsBH/
 m7fy8jU9/QViOp112BBt/YHohgAdUK9TgMoVFk/HhpLA+9w3GwRoyuoouLQm1IP0pXMX3iZxmHRygNYh5WU7W+yO15XCqxjlmWtQRlTevIvJusXKUUpZRnqt
 qqMP9mXYMbblMGVd/SzHkAbBVOnVsMc+vw89lTkuF9fMo6vTgYc=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1707234854; bh=jIU2rVxBDltNbWx3VHHCbScqvuP0+LaBZ/dzewu32Yw=;
 h=From:To:Subject:Date:MIME-Version;
 b=cdGlYdrV6M7eyJEVt7VjHCHFEPJ5P3B+3iAc2pnDd+9Qp7Kenw7O1bDv1o93Qn8nL
 hD/IOmJ2rq6njrC1KneIcPLRJjBZFHnh8qlWH0pDlb5mcfm3QJFIvrO13pQMidzLf2
 ZGKAEASjHlKIQKju4BL5z+3hTUWuixCVsYz85rf4yD96DFfZtKJgXOp9U7qihzIb0N
 PAmTlbzqpZe7BLjzbj1d+doXgYhdBGstvWSXCub5fjR3hOEbjlmeYZN0o7ZDXb91F6
 jYSry8KcwcQLuIM0s/IiWMEpEXOPyyQN+fsmn3YL+Vpq3A2OysLsnOx7VBJG2PQMwu
 +ulceot/rho2Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=cdGlYdrV
Subject: [Buildroot] [PATCH] package/attr: fix build failure on Microblaze
 architecture
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
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Microblaze architecture __has_attribute(__symver__) support is broken
and always return true even if symver is not supported so let's add a local
patch pending upstream to detect if symver is supported during autoreconf.

Fixes:
http://autobuild.buildroot.org/results/29c76e02becedf922bd7dc0533338c078bf77d2a

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...dd-detection-of-symver-gcc-attribute.patch | 56 +++++++++++++++++++
 package/attr/attr.mk                          |  3 +
 2 files changed, 59 insertions(+)
 create mode 100644 package/attr/0002-configure.ac-add-detection-of-symver-gcc-attribute.patch

diff --git a/package/attr/0002-configure.ac-add-detection-of-symver-gcc-attribute.patch b/package/attr/0002-configure.ac-add-detection-of-symver-gcc-attribute.patch
new file mode 100644
index 0000000000..15bd266d7b
--- /dev/null
+++ b/package/attr/0002-configure.ac-add-detection-of-symver-gcc-attribute.patch
@@ -0,0 +1,56 @@
+From 1be7c2251040f1152de9ceb5263e6e96fa5c3d75 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Date: Tue, 6 Feb 2024 15:33:15 +0100
+Subject: [PATCH] configure.ac: add detection of symver gcc attribute
+
+Upstream: https://lists.gnu.org/archive/html/savannah-hackers-public/2024-02/msg00009.html
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
index 6ecf5c53f4..f4f911333a 100644
--- a/package/attr/attr.mk
+++ b/package/attr/attr.mk
@@ -11,6 +11,9 @@ ATTR_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
 ATTR_LICENSE_FILES = doc/COPYING doc/COPYING.LGPL
 ATTR_CPE_ID_VENDOR = attr_project
 
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
