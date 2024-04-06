Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90FBDC67861
	for <buildroot@archiver.kernel.org>; Sat,  6 Apr 2024 07:43:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 61A2F4196E;
	Sat,  6 Apr 2024 07:43:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id REnkHWI5Us7m; Sat,  6 Apr 2024 07:43:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 397C040484
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 397C040484;
	Sat,  6 Apr 2024 07:43:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6E0191BF390
 for <buildroot@lists.busybox.net>; Sat,  6 Apr 2024 07:43:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A1DE607D8
 for <buildroot@lists.busybox.net>; Sat,  6 Apr 2024 07:43:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rcVqP-twOupd for <buildroot@lists.busybox.net>;
 Sat,  6 Apr 2024 07:43:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 838266080E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 838266080E
 for <buildroot@buildroot.org>; Sat,  6 Apr 2024 07:43:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 604C28458E; Sat,  6 Apr 2024 07:43:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 6 Apr 2024 09:42:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1a015540278ba742b5a77e90e80e2f858af14f04
X-Git-Newrev: e0bbfaea0e983c1ce42a9c3085f3ca3dd796852f
X-Patchwork-Hint: ignore
Message-Id: <20240406074344.604C28458E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/apache: security bump version to
 2.4.59
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

commit: https://git.buildroot.net/buildroot/commit/?id=e0bbfaea0e983c1ce42a9c3085f3ca3dd796852f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: https://dlcdn.apache.org/httpd/CHANGES_2.4.59

Fixes CVE-2023-38709, CVE-2024-27316 & CVE-2024-24795.

Removed patch which is included in this release.

Updated _SITE and hash file URLs according to
https://httpd.apache.org/download.cgi#apache24

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...enc-remove-dependency-on-xmlstring-header.patch | 47 ----------------------
 package/apache/apache.hash                         |  6 +--
 package/apache/apache.mk                           |  4 +-
 3 files changed, 5 insertions(+), 52 deletions(-)

diff --git a/package/apache/0004-mod_xml2enc-remove-dependency-on-xmlstring-header.patch b/package/apache/0004-mod_xml2enc-remove-dependency-on-xmlstring-header.patch
deleted file mode 100644
index 8ff7076589..0000000000
--- a/package/apache/0004-mod_xml2enc-remove-dependency-on-xmlstring-header.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 27a68e54b7c6d2ae80dca396fd2727852897dab1 Mon Sep 17 00:00:00 2001
-From: Eric Covener <covener@apache.org>
-Date: Tue, 21 Nov 2023 12:58:47 +0000
-Subject: [PATCH] mod_xml2enc: remove dependency on xmlstring header
-
-Submitted by: ttachi <tachihara@hotmail.com>
-
-Github: closes #393
-
-git-svn-id: https://svn.apache.org/repos/asf/httpd/httpd/trunk@1914013 13f79535-47bb-0310-9956-ffa450edef68
-
-Upstream: https://github.com/apache/httpd/commit/27a68e54b7c6d2ae80dca396fd2727852897dab1
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- changes-entries/xmlchar.txt   | 2 ++
- modules/filters/mod_xml2enc.c | 6 +++---
- 2 files changed, 5 insertions(+), 3 deletions(-)
- create mode 100644 changes-entries/xmlchar.txt
-
-diff --git a/changes-entries/xmlchar.txt b/changes-entries/xmlchar.txt
-new file mode 100644
-index 00000000000..d0e06300411
---- /dev/null
-+++ b/changes-entries/xmlchar.txt
-@@ -0,0 +1,2 @@
-+ *) mod_xml2enc: Tolerate libxml2 2.12.0 and later.
-+    [ttachi <tachihara AT hotmail.com>]
-diff --git a/modules/filters/mod_xml2enc.c b/modules/filters/mod_xml2enc.c
-index 34f8e8ee090..e8ee2647955 100644
---- a/modules/filters/mod_xml2enc.c
-+++ b/modules/filters/mod_xml2enc.c
-@@ -206,11 +206,11 @@ static void sniff_encoding(request_rec* r, xml2ctx* ctx)
-             }
-         }
-     }
--  
-+
-     /* to sniff, first we look for BOM */
-     if (ctx->xml2enc == XML_CHAR_ENCODING_NONE) {
--        ctx->xml2enc = xmlDetectCharEncoding((const xmlChar*)ctx->buf,
--                                             ctx->bytes); 
-+        ctx->xml2enc = xmlDetectCharEncoding((const unsigned char*)ctx->buf,
-+                                             ctx->bytes);
-         if (HAVE_ENCODING(ctx->xml2enc)) {
-             ap_log_rerror(APLOG_MARK, APLOG_INFO, 0, r, APLOGNO(01432)
-                           "Got charset from XML rules.") ;
diff --git a/package/apache/apache.hash b/package/apache/apache.hash
index 854bc85dcc..84248761b9 100644
--- a/package/apache/apache.hash
+++ b/package/apache/apache.hash
@@ -1,5 +1,5 @@
-# From https://archive.apache.org/dist/httpd/httpd-2.4.58.tar.bz2.{sha256,sha512}
-sha256  fa16d72a078210a54c47dd5bef2f8b9b8a01d94909a51453956b3ec6442ea4c5  httpd-2.4.58.tar.bz2
-sha512  d6e73bf413a507ec16b621ff635e178206207a9e9810ce3944b3dc98d39cde8f225307110167fc9da5822175796c8cb66f98be5b9f0d8b76dcd83a401d39b2c1  httpd-2.4.58.tar.bz2
+# From https://downloads.apache.org/httpd/httpd-2.4.59.tar.bz2.{sha256,sha512}
+sha256  ec51501ec480284ff52f637258135d333230a7d229c3afa6f6c2f9040e321323  httpd-2.4.59.tar.bz2
+sha512  209da0bbac5e2564d4590302515b35495be6402273ff4024aa93e85e44554c95e053201d606383936425a41e1b5b97e6b40055dcbb385eb691a5029a6f3158c2  httpd-2.4.59.tar.bz2
 # Locally computed
 sha256  47b8c2b6c3309282a99d4a3001575c790fead690cc14734628c4667d2bbffc43  LICENSE
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index 3efa6b0ac1..1b095c5eb1 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-APACHE_VERSION = 2.4.58
+APACHE_VERSION = 2.4.59
 APACHE_SOURCE = httpd-$(APACHE_VERSION).tar.bz2
-APACHE_SITE = https://downloads.apache.org/httpd
+APACHE_SITE = https://dlcdn.apache.org/httpd
 APACHE_LICENSE = Apache-2.0
 APACHE_LICENSE_FILES = LICENSE
 APACHE_CPE_ID_VENDOR = apache
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
