Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 929DAC4707B
	for <buildroot@archiver.kernel.org>; Sat, 13 Jan 2024 21:32:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50C28605AE;
	Sat, 13 Jan 2024 21:32:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 50C28605AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nXWgv7uBWIwr; Sat, 13 Jan 2024 21:32:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7CA6C60F8D;
	Sat, 13 Jan 2024 21:32:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CA6C60F8D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 474451BF3D4
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 21:30:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DED77606E6
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 21:30:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DED77606E6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9j4sSIKSw3oG for <buildroot@lists.busybox.net>;
 Sat, 13 Jan 2024 21:30:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8E00C606EB
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 21:30:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E00C606EB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7C394813EC; Sat, 13 Jan 2024 21:30:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 13 Jan 2024 22:22:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0d615aa138036ccf3fbba8351c5123a9d825ae37
X-Git-Newrev: f79658fbb5337fbe6cf8f735d5e1a851c7e28ad3
X-Patchwork-Hint: ignore
Message-Id: <20240113213034.7C394813EC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zbar: bump to version 0.23.93
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
Content-Type: multipart/mixed; boundary="===============7756779650013040685=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7756779650013040685==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=f79658fbb5337fbe6cf8f735d5e1a851c7e28ad3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch which is now upstream.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[Peter: drop patch from .checkpackageignore]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                |  1 -
 ...001-python-enum-fix-build-for-Python-3.11.patch | 62 ----------------------
 package/zbar/zbar.hash                             |  2 +-
 package/zbar/zbar.mk                               |  2 +-
 4 files changed, 2 insertions(+), 65 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index bbbf35c102..020caa754d 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1465,7 +1465,6 @@ package/ympd/0001-only-c-language.patch Upstream
 package/ympd/0002-added-forward-declarations.patch Upstream
 package/zabbix/0001-m4-netsnmp.m4-fix-shared-netsnmp-build.patch Upstream
 package/zabbix/0002-fix-build-with-libressl-3.5.0.patch Upstream
-package/zbar/0001-python-enum-fix-build-for-Python-3.11.patch Upstream
 package/zic/0001-remove-dependency-check-on-version-file.patch Upstream
 package/zip/0001-configure-Remove-Check-C-compiler-type-optimization-.patch Upstream
 package/zip/0002-configure-Don-t-use-host-CPP.patch Upstream
diff --git a/package/zbar/0001-python-enum-fix-build-for-Python-3.11.patch b/package/zbar/0001-python-enum-fix-build-for-Python-3.11.patch
deleted file mode 100644
index f525b62184..0000000000
--- a/package/zbar/0001-python-enum-fix-build-for-Python-3.11.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From fbaec4b4e6fe735efe6916fe5b92805a0d96bf8a Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?=C4=90o=C3=A0n=20Tr=E1=BA=A7n=20C=C3=B4ng=20Danh?=
- <congdanhqx@gmail.com>
-Date: Wed, 21 Sep 2022 10:32:11 +0700
-Subject: [PATCH] python: enum: fix build for Python 3.11
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Python 3.9 introduced Py_SET_SIZE function to set size instead of
-relying on Py_SIZE() as a macro [3.9].
-
-Python 3.10 started to encourage to use Py_SET_SIZE instead of
-assigning into return value of Py_SIZE [3.10].
-
-Python 3.11 flips the switch, turn Py_SIZE into a function [3.11],
-thus Py_SIZE(obj) will be a rvalue. We need to use Py_SET_SIZE
-to set size now.
-
-[3.9]: https://docs.python.org/3.9/c-api/structures.html#c.Py_SET_SIZE
-[3.10]: https://docs.python.org/3.10/c-api/structures.html#c.Py_SIZE
-[3.11]: https://docs.python.org/3.11/c-api/structures.html#c.Py_SIZE
-
-Signed-off-by: Đoàn Trần Công Danh <congdanhqx@gmail.com>
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-[Upstream status:
-https://github.com/mchehab/zbar/pull/231]
----
- python/enum.c | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/python/enum.c b/python/enum.c
-index dfe1b1e..946344f 100644
---- a/python/enum.c
-+++ b/python/enum.c
-@@ -52,7 +52,11 @@ enumitem_new (PyTypeObject *type,
- 
-     /* we assume the "fast path" for a single-digit ints (see longobject.c) */
-     /* this also holds if we get a small_int preallocated long */
-+#if PY_VERSION_HEX >= 0x03090000
-+    Py_SET_SIZE(&self->val, Py_SIZE(longval));
-+#else
-     Py_SIZE(&self->val) = Py_SIZE(longval);
-+#endif
-     self->val.ob_digit[0] = longval->ob_digit[0];
-     Py_DECREF(longval);
- #else
-@@ -143,7 +147,11 @@ zbarEnumItem_New (PyObject *byname,
- 
-     /* we assume the "fast path" for a single-digit ints (see longobject.c) */
-     /* this also holds if we get a small_int preallocated long */
-+#if PY_VERSION_HEX >= 0x03090000
-+    Py_SET_SIZE(&self->val, Py_SIZE(longval));
-+#else
-     Py_SIZE(&self->val) = Py_SIZE(longval);
-+#endif
-     self->val.ob_digit[0] = longval->ob_digit[0];
-     Py_DECREF(longval);
- 
--- 
-2.34.1
-
diff --git a/package/zbar/zbar.hash b/package/zbar/zbar.hash
index a4303266db..0136b1d1f3 100644
--- a/package/zbar/zbar.hash
+++ b/package/zbar/zbar.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  9152c8fb302b3891e1cb9cc719883d2f4ccd2483e3430783a2cf2d93bd5901ad  zbar-0.23.90.tar.bz2
+sha256  83be8f85fc7c288fd91f98d52fc55db7eedbddcf10a83d9221d7034636683fa0  zbar-0.23.93.tar.bz2
 sha256  44260f9252c7fe38ba8dfb645330504f4a375e3a5e9dd7d5d6b9f04adb4952f1  LICENSE.md
diff --git a/package/zbar/zbar.mk b/package/zbar/zbar.mk
index 2c933929cf..1a1e4eb24b 100644
--- a/package/zbar/zbar.mk
+++ b/package/zbar/zbar.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZBAR_VERSION = 0.23.90
+ZBAR_VERSION = 0.23.93
 ZBAR_SOURCE = zbar-$(ZBAR_VERSION).tar.bz2
 ZBAR_SITE = https://www.linuxtv.org/downloads/zbar
 ZBAR_LICENSE = LGPL-2.1+

--===============7756779650013040685==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7756779650013040685==--
