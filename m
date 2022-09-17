Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DEA8C54EE9
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 13:58:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEFDF61125;
	Sat, 17 Sep 2022 13:58:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CEFDF61125
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rT2QacC7hbTk; Sat, 17 Sep 2022 13:58:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E815F6111E;
	Sat, 17 Sep 2022 13:58:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E815F6111E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B81AF1BF405
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 13:58:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 93E546111E
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 13:58:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93E546111E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wd59PWsNV322 for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 13:58:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8836461113
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 13:58:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8836461113
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 7403E84344; Sat, 17 Sep 2022 13:58:00 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 15:53:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 76d29419a7b17276755b7f75ef60d0a5110be95c
X-Git-Newrev: d776c65fe9f64b1c27b47fc49b8674515807acea
X-Patchwork-Hint: ignore
Message-Id: <20220917135800.7403E84344@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cracklib: bump to version 2.9.8
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
Content-Type: multipart/mixed; boundary="===============1835262443360375249=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1835262443360375249==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=d776c65fe9f64b1c27b47fc49b8674515807acea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch (already in version)

https://github.com/cracklib/cracklib/blob/v2.9.8/src/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...to-treat-the-input-as-text-when-formattin.patch | 30 ----------------------
 package/cracklib/cracklib.hash                     |  4 +--
 package/cracklib/cracklib.mk                       |  7 ++---
 3 files changed, 6 insertions(+), 35 deletions(-)

diff --git a/package/cracklib/0001-Force-grep-to-treat-the-input-as-text-when-formattin.patch b/package/cracklib/0001-Force-grep-to-treat-the-input-as-text-when-formattin.patch
deleted file mode 100644
index b05a69caa2..0000000000
--- a/package/cracklib/0001-Force-grep-to-treat-the-input-as-text-when-formattin.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From d27062fe7a520d5791f7a56d175a5cb6a39bae61 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Stefan=20S=C3=B8rensen?= <stefan.sorensen@spectralink.com>
-Date: Tue, 18 Apr 2017 12:00:39 +0200
-Subject: [PATCH] Force grep to treat the input as text when formatting word
- files.
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Signed-off-by: Stefan Sørensen <stefan.sorensen@spectralink.com>
----
- util/cracklib-format | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/util/cracklib-format b/util/cracklib-format
-index 1d7be5b..b1de8e8 100644
---- a/util/cracklib-format
-+++ b/util/cracklib-format
-@@ -4,7 +4,7 @@
- # into cracklib-packer
- #
- gzip -cdf "$@" |
--    grep -v '^\(#\|$\)' |
-+    grep -a -v '^\(#\|$\)' |
-     tr '[A-Z]' '[a-z]' |
-     tr -cd '\012[a-z][0-9]' |
-     env LC_ALL=C sort -u
--- 
-2.9.3
-
diff --git a/package/cracklib/cracklib.hash b/package/cracklib/cracklib.hash
index 735bcfedd2..ff527d517a 100644
--- a/package/cracklib/cracklib.hash
+++ b/package/cracklib/cracklib.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  8b6fd202f3f1d8fa395d3b7a5d821227cfd8bb4a9a584a7ae30cf62cea6287dd  cracklib-2.9.7.tar.gz
-sha256  7f0c45faf84a2494f15d1e2720394aca4a379163a70c4acad948186c0047d389  cracklib-words-2.9.7.gz
+sha256  1f9d34385ea3aa7cd7c07fa388dc25810aea9d3c33e260c713a3a5873d70e386  cracklib-2.9.8.tar.bz2
+sha256  ec25ac4a474588c58d901715512d8902b276542b27b8dd197e9c2ad373739ec4  cracklib-words-2.9.8.bz2
 sha256  f18a0811fa0e220ccbc42f661545e77f0388631e209585ed582a1c693029c6aa  COPYING.LIB
diff --git a/package/cracklib/cracklib.mk b/package/cracklib/cracklib.mk
index 46917b7926..bb7c18d5be 100644
--- a/package/cracklib/cracklib.mk
+++ b/package/cracklib/cracklib.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-CRACKLIB_VERSION = 2.9.7
+CRACKLIB_VERSION = 2.9.8
+CRACKLIB_SOURCE = cracklib-$(CRACKLIB_VERSION).tar.bz2
 CRACKLIB_SITE = https://github.com/cracklib/cracklib/releases/download/v$(CRACKLIB_VERSION)
 CRACKLIB_LICENSE = LGPL-2.1
 CRACKLIB_LICENSE_FILES = COPYING.LIB
@@ -33,8 +34,8 @@ endif
 HOST_CRACKLIB_CONF_OPTS += --without-python --without-zlib
 
 ifeq ($(BR2_PACKAGE_CRACKLIB_FULL_DICT),y)
-CRACKLIB_EXTRA_DOWNLOADS = cracklib-words-$(CRACKLIB_VERSION).gz
-CRACKLIB_DICT_SOURCE = $(CRACKLIB_DL_DIR)/cracklib-words-$(CRACKLIB_VERSION).gz
+CRACKLIB_EXTRA_DOWNLOADS = cracklib-words-$(CRACKLIB_VERSION).bz2
+CRACKLIB_DICT_SOURCE = $(CRACKLIB_DL_DIR)/cracklib-words-$(CRACKLIB_VERSION).bz2
 else
 CRACKLIB_DICT_SOURCE = $(@D)/dicts/cracklib-small
 endif

--===============1835262443360375249==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1835262443360375249==--
