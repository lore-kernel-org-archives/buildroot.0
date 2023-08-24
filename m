Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBF31C3DA6F
	for <buildroot@archiver.kernel.org>; Thu, 24 Aug 2023 18:56:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C895415B4;
	Thu, 24 Aug 2023 18:56:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C895415B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qIo5ix_-5NpT; Thu, 24 Aug 2023 18:56:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4EE14415AD;
	Thu, 24 Aug 2023 18:56:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4EE14415AD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 40A8A1BF853
 for <buildroot@lists.busybox.net>; Thu, 24 Aug 2023 18:56:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 19F0360F86
 for <buildroot@lists.busybox.net>; Thu, 24 Aug 2023 18:56:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19F0360F86
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CpX4AQCEzPVx for <buildroot@lists.busybox.net>;
 Thu, 24 Aug 2023 18:56:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E79F60F69
 for <buildroot@buildroot.org>; Thu, 24 Aug 2023 18:56:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E79F60F69
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EFCCC8622B; Thu, 24 Aug 2023 18:56:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 24 Aug 2023 20:55:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3f46db39e62a5b84ca4cd938d07ca7aa49edfc88
X-Git-Newrev: 670329f057b656be06b217fab411d90695988b41
X-Patchwork-Hint: ignore
Message-Id: <20230824185610.EFCCC8622B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libmodsecurity: security bump to
 version 3.0.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=670329f057b656be06b217fab411d90695988b41
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Fixes CVE-2023-38285 [1]
- Adapted 0001-configure.ac-drop-usage-of-git-at-configure-time.patch due to
  upstream moving to autoconf portable shell constructs.

Signed-off-by: Frank Vanbever <frank.vanbever@mind.be>

[1] https://www.trustwave.com/en-us/resources/blogs/spiderlabs-blog/modsecurity-v3-dos-vulnerability-in-four-transformations-cve-2023-38285/

Signed-off-by: Frank Vanbever <frank.vanbever@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...nfigure.ac-drop-usage-of-git-at-configure-time.patch | 17 +++++++++--------
 .../0002-modsecurity.pc.in-add-lstdc.patch              |  5 +++--
 package/libmodsecurity/libmodsecurity.hash              |  4 ++--
 package/libmodsecurity/libmodsecurity.mk                |  2 +-
 4 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/package/libmodsecurity/0001-configure.ac-drop-usage-of-git-at-configure-time.patch b/package/libmodsecurity/0001-configure.ac-drop-usage-of-git-at-configure-time.patch
index 14767fb28e..6853b19ccd 100644
--- a/package/libmodsecurity/0001-configure.ac-drop-usage-of-git-at-configure-time.patch
+++ b/package/libmodsecurity/0001-configure.ac-drop-usage-of-git-at-configure-time.patch
@@ -1,4 +1,4 @@
-From a2116312068b6b2c5732dfebde19b751cc81d4f3 Mon Sep 17 00:00:00 2001
+From d242b011a8f0d84781bbf7667a44a12646903ca4 Mon Sep 17 00:00:00 2001
 From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 Date: Sun, 1 Aug 2021 23:21:35 +0200
 Subject: [PATCH] configure.ac: drop usage of git at configure time
@@ -8,12 +8,13 @@ which is not very useful, and causes a significant number of warning
 when regenerating the configure script.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Signed-off-by: Frank Vanbever <frank.vanbever@mind.be>
 ---
  configure.ac | 23 -----------------------
  1 file changed, 23 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 20163e1e..14e5892a 100644
+index 66d6f4f2..746b1fb4 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -3,7 +3,6 @@
@@ -46,7 +47,7 @@ index 20163e1e..14e5892a 100644
  
  
  # Check for yajl
-@@ -217,10 +208,6 @@ AC_SUBST([MSC_VERSION_WITH_PATCHLEVEL])
+@@ -224,10 +215,6 @@ AC_SUBST([MSC_VERSION_WITH_PATCHLEVEL])
  MSC_VERSION=msc_version
  AC_SUBST([MSC_VERSION])
  
@@ -55,9 +56,9 @@ index 20163e1e..14e5892a 100644
 -
 -
  AC_ARG_ENABLE(debug-logs,
-     [AC_HELP_STRING([--disable-debug-logs],[Turn off the SecDebugLog feature])],
+     [AS_HELP_STRING([--disable-debug-logs],[Turn off the SecDebugLog feature])],
  
-@@ -412,16 +399,6 @@ AC_OUTPUT
+@@ -419,16 +406,6 @@ AC_OUTPUT
  
  
  # Print a fancy summary
@@ -66,14 +67,14 @@ index 20163e1e..14e5892a 100644
 -echo "ModSecurity - ${MSC_GIT_VERSION} for $PLATFORM"
 -echo " "
 -echo " Mandatory dependencies"
--echo -n "   + libInjection                                  ...."
+-AS_ECHO_N("   + libInjection                                  ....")
 -echo LIBINJECTION_VERSION
--echo -n "   + SecLang tests                                 ...."
+-AS_ECHO_N("   + SecLang tests                                 ....")
 -echo SECLANG_TEST_VERSION
 -
  echo " "
  echo " Optional dependencies"
  
 -- 
-2.31.1
+2.39.2
 
diff --git a/package/libmodsecurity/0002-modsecurity.pc.in-add-lstdc.patch b/package/libmodsecurity/0002-modsecurity.pc.in-add-lstdc.patch
index 6511e6f1e0..9e0b672c8d 100644
--- a/package/libmodsecurity/0002-modsecurity.pc.in-add-lstdc.patch
+++ b/package/libmodsecurity/0002-modsecurity.pc.in-add-lstdc.patch
@@ -1,4 +1,4 @@
-From 1a84881b280eb08852d5495c57e44351a40d3f91 Mon Sep 17 00:00:00 2001
+From 4129643d657b5d0cce83f9ec4ca27289fd69ec43 Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Date: Mon, 26 Jul 2021 00:24:57 +0200
 Subject: [PATCH] modsecurity.pc.in: add -lstdc++
@@ -13,6 +13,7 @@ Fixes:
  - http://autobuild.buildroot.org/results/e5a9eb8448980f1c5cafe97180b7d1f48ddf02ca
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Signed-off-by: Frank Vanbever <frank.vanbever@mind.be>
 ---
  modsecurity.pc.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
@@ -28,5 +29,5 @@ index 96cdf5ca..7c895ddc 100644
 -Libs.private: @CURL_LDADD@ @GEOIP_LDADD@ @MAXMIND_LDADD@ @GLOBAL_LDADD@ @LIBXML2_LDADD@ @LMDB_LDADD@ @LUA_LDADD@ @PCRE_LDADD@ @SSDEEP_LDADD@ @YAJL_LDADD@
 +Libs.private: @CURL_LDADD@ @GEOIP_LDADD@ @MAXMIND_LDADD@ @GLOBAL_LDADD@ @LIBXML2_LDADD@ @LMDB_LDADD@ @LUA_LDADD@ @PCRE_LDADD@ @SSDEEP_LDADD@ @YAJL_LDADD@ -lstdc++
 -- 
-2.30.2
+2.39.2
 
diff --git a/package/libmodsecurity/libmodsecurity.hash b/package/libmodsecurity/libmodsecurity.hash
index c79ae1cf45..7bcf99e167 100644
--- a/package/libmodsecurity/libmodsecurity.hash
+++ b/package/libmodsecurity/libmodsecurity.hash
@@ -1,4 +1,4 @@
-# From https://github.com/SpiderLabs/ModSecurity/releases/download/v3.0.9/modsecurity-v3.0.9.tar.gz.sha256
-sha256  a5111ecd23e332a1d7c9652dbdb18517a96b21573315cb887a8e86761b95d3d8  modsecurity-v3.0.9.tar.gz
+# From https://github.com/SpiderLabs/ModSecurity/releases/download/v3.0.10/modsecurity-v3.0.10.tar.gz.sha256
+sha256  d5d459f7c2e57a69a405f3222d8e285de419a594b0ea8829058709962227ead0  modsecurity-v3.0.10.tar.gz
 # Localy calculated
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/libmodsecurity/libmodsecurity.mk b/package/libmodsecurity/libmodsecurity.mk
index 335f3a41e5..257f0a56df 100644
--- a/package/libmodsecurity/libmodsecurity.mk
+++ b/package/libmodsecurity/libmodsecurity.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMODSECURITY_VERSION = 3.0.9
+LIBMODSECURITY_VERSION = 3.0.10
 LIBMODSECURITY_SOURCE = modsecurity-v$(LIBMODSECURITY_VERSION).tar.gz
 LIBMODSECURITY_SITE = https://github.com/SpiderLabs/ModSecurity/releases/download/v$(LIBMODSECURITY_VERSION)
 LIBMODSECURITY_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
