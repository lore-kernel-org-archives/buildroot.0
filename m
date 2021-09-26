Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01F71C433EF
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 21:45:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B30861041
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 21:45:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9B30861041
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7399782438;
	Sun, 26 Sep 2021 21:45:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TiFIPMubgggl; Sun, 26 Sep 2021 21:45:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9EB9A82457;
	Sun, 26 Sep 2021 21:45:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4F29B1BF97A
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 21:44:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 30CCE403B4
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 21:44:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ehtRZ0o0OHBZ for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 21:44:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DCF05403B3
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 21:44:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 4061C8D308; Sun, 26 Sep 2021 21:42:29 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 26 Sep 2021 23:06:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 32b2a03745785afeb496979aa3c0f654bc6063ce
X-Git-Newrev: cfc80eeeb4f3cb8e59b56bedd5bd49761764671f
X-Patchwork-Hint: ignore
Message-Id: <20210926214229.4061C8D308@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zbar: bump to version 0.23.90
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

commit: https://git.buildroot.net/buildroot/commit/?id=cfc80eeeb4f3cb8e59b56bedd5bd49761764671f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patches that are now upstream.

Enable python module when available as it should now work with
python3.9 as of this release.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...0001-zbarcam-zbarimg-get-rid-of-gettext-h.patch | 45 ------------------
 ...arcam-zbar-cam-img-.c-fix-build-with-musl.patch | 55 ----------------------
 package/zbar/zbar.hash                             |  2 +-
 package/zbar/zbar.mk                               | 10 +++-
 4 files changed, 9 insertions(+), 103 deletions(-)

diff --git a/package/zbar/0001-zbarcam-zbarimg-get-rid-of-gettext-h.patch b/package/zbar/0001-zbarcam-zbarimg-get-rid-of-gettext-h.patch
deleted file mode 100644
index 009fd5f96f..0000000000
--- a/package/zbar/0001-zbarcam-zbarimg-get-rid-of-gettext-h.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From a133aea7880bbb56d75535e534716d0e16a3b61a Mon Sep 17 00:00:00 2001
-From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
-Date: Tue, 28 Jul 2020 09:47:03 +0200
-Subject: [PATCH] zbarcam, zbarimg: get rid of gettext.h
-
-This doesn't seem to be needed at all for translations to
-work. Also, gettext.h uses a different license. So, let's get
-rid of it.
-
-Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
-[Retrieved (and updated to remove gettext.h which is not in the
-tarball):
-https://github.com/mchehab/zbar/commit/a133aea7880bbb56d75535e534716d0e16a3b61a]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- zbar/gettext.h    | 294 ----------------------------------------------
- zbarcam/zbarcam.c |   1 -
- zbarimg/zbarimg.c |   1 -
- 3 files changed, 296 deletions(-)
- delete mode 100644 zbar/gettext.h
-
-diff --git a/zbarcam/zbarcam.c b/zbarcam/zbarcam.c
-index f7ea281..ad30101 100644
---- a/zbarcam/zbarcam.c
-+++ b/zbarcam/zbarcam.c
-@@ -35,7 +35,6 @@
- #include <zbar.h>
- 
- #ifdef ENABLE_NLS
--#include "../zbar/gettext.h"
- # include <libintl.h>
- # define _(string) gettext(string)
- #else
-diff --git a/zbarimg/zbarimg.c b/zbarimg/zbarimg.c
-index 0796fd8..d05d832 100644
---- a/zbarimg/zbarimg.c
-+++ b/zbarimg/zbarimg.c
-@@ -40,7 +40,6 @@
- #include <zbar.h>
- 
- #ifdef ENABLE_NLS
--#include "../zbar/gettext.h"
- # include <libintl.h>
- # define _(string) gettext(string)
- #else
diff --git a/package/zbar/0002-zbarcam-zbar-cam-img-.c-fix-build-with-musl.patch b/package/zbar/0002-zbarcam-zbar-cam-img-.c-fix-build-with-musl.patch
deleted file mode 100644
index fe62c1649c..0000000000
--- a/package/zbar/0002-zbarcam-zbar-cam-img-.c-fix-build-with-musl.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From ecf90fcff066c06eda1fb931d08fadf5989ecb36 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 29 Aug 2020 14:23:04 +0200
-Subject: [PATCH] zbarcam/zbar{cam,img}.c: fix build with musl
-
-setlocale is used since version 0.23.1 and
-https://git.linuxtv.org/zbar.git/commit/id=d05911f8d5fb8c1e064bd93ed9ec9f038c5da096
-
-Include locale.h to avoid the following build failure on musl:
-
-zbarcam/zbarcam.c:168:5: warning: implicit declaration of function 'setlocale'; did you mean 'setstate'? [-Wimplicit-function-declaration]
-     setlocale (LC_ALL, "");
-     ^~~~~~~~~
-     setstate
-zbarcam/zbarcam.c:168:16: error: 'LC_ALL' undeclared (first use in this function)
-     setlocale (LC_ALL, "");
-                ^~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/b93ce5430bf22ddda94ee30882a883348617f5b1
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/mchehab/zbar/pull/115]
----
- zbarcam/zbarcam.c | 1 +
- zbarimg/zbarimg.c | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/zbarcam/zbarcam.c b/zbarcam/zbarcam.c
-index 6e13c8c..b8bc732 100644
---- a/zbarcam/zbarcam.c
-+++ b/zbarcam/zbarcam.c
-@@ -36,6 +36,7 @@
- 
- #ifdef ENABLE_NLS
- # include <libintl.h>
-+# include <locale.h>
- # define _(string) gettext(string)
- #else
- # define _(string) string
-diff --git a/zbarimg/zbarimg.c b/zbarimg/zbarimg.c
-index d05d832..52502b2 100644
---- a/zbarimg/zbarimg.c
-+++ b/zbarimg/zbarimg.c
-@@ -41,6 +41,7 @@
- 
- #ifdef ENABLE_NLS
- # include <libintl.h>
-+# include <locale.h>
- # define _(string) gettext(string)
- #else
- # define _(string) string
--- 
-2.28.0
-
diff --git a/package/zbar/zbar.hash b/package/zbar/zbar.hash
index 4277091892..a4303266db 100644
--- a/package/zbar/zbar.hash
+++ b/package/zbar/zbar.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  dad260b47ef887a639e840a89e5e6e132217b6bba2a8473565d1f459bcb97c1f  zbar-0.23.1.tar.bz2
+sha256  9152c8fb302b3891e1cb9cc719883d2f4ccd2483e3430783a2cf2d93bd5901ad  zbar-0.23.90.tar.bz2
 sha256  44260f9252c7fe38ba8dfb645330504f4a375e3a5e9dd7d5d6b9f04adb4952f1  LICENSE.md
diff --git a/package/zbar/zbar.mk b/package/zbar/zbar.mk
index f75741ded9..5554dca6a1 100644
--- a/package/zbar/zbar.mk
+++ b/package/zbar/zbar.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZBAR_VERSION = 0.23.1
+ZBAR_VERSION = 0.23.90
 ZBAR_SOURCE = zbar-$(ZBAR_VERSION).tar.bz2
 ZBAR_SITE = https://www.linuxtv.org/downloads/zbar
 ZBAR_LICENSE = LGPL-2.1+
@@ -21,7 +21,6 @@ ZBAR_CONF_OPTS = \
 	--without-qt \
 	--without-qt5 \
 	--without-gtk \
-	--without-python \
 	--without-x \
 	--without-java
 
@@ -32,4 +31,11 @@ else
 ZBAR_CONF_OPTS += --without-dbus
 endif
 
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
+ZBAR_DEPENDENCIES += host-python3 python3
+ZBAR_CONF_OPTS += --with-python=python3
+else
+ZBAR_CONF_OPTS += --with-python=no
+endif
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
