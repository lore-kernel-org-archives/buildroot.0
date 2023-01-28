Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B2DDC61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:46:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B93FA8406E;
	Mon, 20 Feb 2023 23:46:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B93FA8406E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5fQWvmzJFjT6; Mon, 20 Feb 2023 23:46:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B581284070;
	Mon, 20 Feb 2023 23:46:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B581284070
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ED2D81BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:58:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7D85C4177D
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D85C4177D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8hBp9rFeYyNQ for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 83A1B41777
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83A1B41777
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7F37086495; Mon, 20 Feb 2023 20:52:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 28 Jan 2023 22:46:11 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 08b680f6718746eeabf2b4a18111a0991744cda3
X-Git-Newrev: 760894b72ed465f426cf848f561200a4656eda4a
X-Patchwork-Hint: ignore
Message-Id: <20230220205242.7F37086495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 package/x11r7/xdriver_xf86-video-qxl: bump version to 0.1.6
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
Content-Type: multipart/mixed; boundary="===============3124021494185973455=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3124021494185973455==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=760894b72ed465f426cf848f561200a4656eda4a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release notes:
https://lists.x.org/archives/xorg-announce/2023-January/003316.html

Removed patch which was applied upstream.

Switched tarball to xz and _SITE to https, added sha512 hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-Fix-a-build-error-with-Xorg-master.patch  | 106 ---------------------
 .../xdriver_xf86-video-qxl.hash                    |   5 +-
 .../xdriver_xf86-video-qxl.mk                      |   6 +-
 3 files changed, 6 insertions(+), 111 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-qxl/0001-Fix-a-build-error-with-Xorg-master.patch b/package/x11r7/xdriver_xf86-video-qxl/0001-Fix-a-build-error-with-Xorg-master.patch
deleted file mode 100644
index d3257fba20..0000000000
--- a/package/x11r7/xdriver_xf86-video-qxl/0001-Fix-a-build-error-with-Xorg-master.patch
+++ /dev/null
@@ -1,106 +0,0 @@
-From 4e1963a812f2c1777ba5d56ea9e939a3e40a0496 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?=
- <zboszor@gmail.com>
-Date: Sat, 28 Aug 2021 15:38:40 +0200
-Subject: [PATCH] Fix a build  error with Xorg master
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Use xf86ReturnOptValBool() in get_bool_option() instead of
-options[option_index].value.bool to fix a compiler error with
-current Xorg xserver master branch.
-
-Also use xf86GetOptValInteger() in get_int_option() and
-xf86GetOptValString() in get_str_option() for consistency.
-
-The change causes a slight performance drop during option parsing
-because the passed-in index_value is no longer used as an index
-into the options array.
-
-Instead, it's used as a token now for the standard option getter
-functions which works since the index_value to the get_*_option()
-functions are identical to the value of options[n].token in the
-passed-in OptionInfoRec array.
-
-Also rename "int option_index" to "int token" for clarity in all
-three functions.
-
-Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
-
-Downloaded from upstream commit
-https://gitlab.freedesktop.org/xorg/driver/xf86-video-qxl/-/commit/4e1963a812f2c1777ba5d56ea9e939a3e40a0496
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- src/qxl_option_helpers.c | 13 +++++++------
- src/qxl_option_helpers.h |  6 +++---
- 2 files changed, 10 insertions(+), 9 deletions(-)
-
-diff --git a/src/qxl_option_helpers.c b/src/qxl_option_helpers.c
-index 2aba677..7707b7c 100644
---- a/src/qxl_option_helpers.c
-+++ b/src/qxl_option_helpers.c
-@@ -10,31 +10,32 @@
- 
- #include "qxl_option_helpers.h"
- 
--int get_int_option(OptionInfoPtr options, int option_index,
-+int get_int_option(OptionInfoPtr options, int token,
-                    const char *env_name)
- {
-+    int value;
-     if (env_name && getenv(env_name)) {
-         return atoi(getenv(env_name));
-     }
--    return options[option_index].value.num;
-+    return xf86GetOptValInteger(options, token, &value) ? value : 0;
- }
- 
--const char *get_str_option(OptionInfoPtr options, int option_index,
-+const char *get_str_option(OptionInfoPtr options, int token,
-                            const char *env_name)
- {
-     if (getenv(env_name)) {
-         return getenv(env_name);
-     }
--    return options[option_index].value.str;
-+    return xf86GetOptValString(options, token);
- }
- 
--int get_bool_option(OptionInfoPtr options, int option_index,
-+int get_bool_option(OptionInfoPtr options, int token,
-                      const char *env_name)
- {
-     const char* value = getenv(env_name);
- 
-     if (!value) {
--        return options[option_index].value.bool;
-+        return xf86ReturnOptValBool(options, token, FALSE);
-     }
-     if (strcmp(value, "0") == 0 ||
-         strcasecmp(value, "off") == 0 ||
-diff --git a/src/qxl_option_helpers.h b/src/qxl_option_helpers.h
-index 7c54c72..66d0a17 100644
---- a/src/qxl_option_helpers.h
-+++ b/src/qxl_option_helpers.h
-@@ -4,13 +4,13 @@
- #include <xf86Crtc.h>
- #include <xf86Opt.h>
- 
--int get_int_option(OptionInfoPtr options, int option_index,
-+int get_int_option(OptionInfoPtr options, int token,
-                    const char *env_name);
- 
--const char *get_str_option(OptionInfoPtr options, int option_index,
-+const char *get_str_option(OptionInfoPtr options, int token,
-                            const char *env_name);
- 
--int get_bool_option(OptionInfoPtr options, int option_index,
-+int get_bool_option(OptionInfoPtr options, int token,
-                      const char *env_name);
- 
- #endif // OPTION_HELPERS_H
--- 
-GitLab
-
diff --git a/package/x11r7/xdriver_xf86-video-qxl/xdriver_xf86-video-qxl.hash b/package/x11r7/xdriver_xf86-video-qxl/xdriver_xf86-video-qxl.hash
index fdf0cc434d..2d728a7c03 100644
--- a/package/x11r7/xdriver_xf86-video-qxl/xdriver_xf86-video-qxl.hash
+++ b/package/x11r7/xdriver_xf86-video-qxl/xdriver_xf86-video-qxl.hash
@@ -1,4 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2016-December/002753.html
-sha256  b18682e04503c6326f7bf7190f3ee50a3d4d69758a2a3cc9af102a6b3f114c92  xf86-video-qxl-0.1.5.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2023-January/003316.html
+sha256  2ad39558db47a8fcc036e290e0b084671e58d43344a57b279abd870c4c67965f  xf86-video-qxl-0.1.6.tar.xz
+sha512  f6a42355915d2e8f8a842dc24fe6d012d123aa6d23eedea1a4771fb08f88e0298d76741755b88304d76c66b3aae15f9fca74d062be395e499a82ee8f4507c7e0  xf86-video-qxl-0.1.6.tar.xz
 # Locally calculated
 sha256  83f3bf7be3fbf5e66174b8184bd837a6b44264f8e340126ea4d9e9ce956a1866  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-qxl/xdriver_xf86-video-qxl.mk b/package/x11r7/xdriver_xf86-video-qxl/xdriver_xf86-video-qxl.mk
index ffbac05ec1..db0bbbaf65 100644
--- a/package/x11r7/xdriver_xf86-video-qxl/xdriver_xf86-video-qxl.mk
+++ b/package/x11r7/xdriver_xf86-video-qxl/xdriver_xf86-video-qxl.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_QXL_VERSION = 0.1.5
-XDRIVER_XF86_VIDEO_QXL_SOURCE = xf86-video-qxl-$(XDRIVER_XF86_VIDEO_QXL_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_QXL_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_QXL_VERSION = 0.1.6
+XDRIVER_XF86_VIDEO_QXL_SOURCE = xf86-video-qxl-$(XDRIVER_XF86_VIDEO_QXL_VERSION).tar.xz
+XDRIVER_XF86_VIDEO_QXL_SITE = https://xorg.freedesktop.org/archive/individual/driver
 XDRIVER_XF86_VIDEO_QXL_LICENSE = MIT
 XDRIVER_XF86_VIDEO_QXL_LICENSE_FILES = COPYING
 

--===============3124021494185973455==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3124021494185973455==--
