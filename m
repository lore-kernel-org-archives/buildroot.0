Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E187EB64D8
	for <buildroot@archiver.kernel.org>; Wed, 21 Jun 2023 16:18:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B392A40879;
	Wed, 21 Jun 2023 16:18:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B392A40879
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q7XRjEZ9dCYS; Wed, 21 Jun 2023 16:18:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26AFB408E4;
	Wed, 21 Jun 2023 16:18:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26AFB408E4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 797691BF3B5
 for <buildroot@lists.busybox.net>; Wed, 21 Jun 2023 16:18:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 532F5402BC
 for <buildroot@lists.busybox.net>; Wed, 21 Jun 2023 16:18:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 532F5402BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZxknX1tmCYsq for <buildroot@lists.busybox.net>;
 Wed, 21 Jun 2023 16:18:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7E2840184
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E7E2840184
 for <buildroot@buildroot.org>; Wed, 21 Jun 2023 16:18:22 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0f96.dip0.t-ipconnect.de [91.58.15.150])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 96186A4C00F4
 for <buildroot@buildroot.org>; Wed, 21 Jun 2023 18:18:07 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59968)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qC0X1-0007VY-0v
 for buildroot@buildroot.org; Wed, 21 Jun 2023 18:18:07 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 21 Jun 2023 18:18:06 +0200
Message-Id: <20230621161807.634101-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1687364287;
 bh=/IDXIifyc6PiEU6xp3G+CX6PK52NL3AFwgOSI4f9bx8=;
 h=From:To:Subject:Date:From;
 b=p7cNJOmD5517IaiB2ec3+z9ftAamhJ35aQ/7ccfPLpO0je0Y0pkXOXE7gV8kxiBPd
 M0ZAJWtBpJilwZUM4dMg0nu5kIkcmDrbGa1Y1x0poo08QiR2SEoOzaXkRHU3u3IGNd
 qiHmTCog9qilTrd4ruD3rKdQbe0F7dIHBllfrj/1vJyZNQ2DnBHlEBebuwBpWXZkRQ
 /RYKlIyXIdSmymfncRfptOtIWCGPKy9pFnLmjGi2rZq0EUdL43/5p+1275CNYFTVhz
 MZLPUKamyv0qdWmaqv4Zjuf88QJjWoXhl2rF01MHORZqbSEz8RYKs6RegB4lOzKOeA
 K3eWXit6mqUyA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=p7cNJOmD
Subject: [Buildroot] [PATCH 1/2] package/raptor: security bump version to
 2.0.16
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This version includes the patches removed by this commit, no new CVEs
were fixed.

Release notes: https://librdf.org/raptor/RELEASE.html#rel2_0_16

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
I am unsure whether such a bump is seen security-relevant, if not,
please adjust the subject line accordingly, thanks!

 ...pace-declarations-correctly-for-XML-.patch | 47 -------------------
 ...are-namespace-declarations-correctly.patch | 33 -------------
 package/raptor/raptor.hash                    |  4 +-
 package/raptor/raptor.mk                      |  8 +---
 4 files changed, 3 insertions(+), 89 deletions(-)
 delete mode 100644 package/raptor/0002-Calcualte-max-nspace-declarations-correctly-for-XML-.patch
 delete mode 100644 package/raptor/0003-XML-Writer-compare-namespace-declarations-correctly.patch

diff --git a/package/raptor/0002-Calcualte-max-nspace-declarations-correctly-for-XML-.patch b/package/raptor/0002-Calcualte-max-nspace-declarations-correctly-for-XML-.patch
deleted file mode 100644
index 406e265cf3..0000000000
--- a/package/raptor/0002-Calcualte-max-nspace-declarations-correctly-for-XML-.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 590681e546cd9aa18d57dc2ea1858cb734a3863f Mon Sep 17 00:00:00 2001
-From: Dave Beckett <dave@dajobe.org>
-Date: Sun, 16 Apr 2017 23:15:12 +0100
-Subject: [PATCH] Calcualte max nspace declarations correctly for XML writer
-
-(raptor_xml_writer_start_element_common): Calculate max including for
-each attribute a potential name and value.
-
-Fixes Issues #0000617 http://bugs.librdf.org/mantis/view.php?id=617
-and #0000618 http://bugs.librdf.org/mantis/view.php?id=618
-
-[Peter: fixes CVE-2017-18926, upstream:
- https://github.com/dajobe/raptor/commit/590681e546cd9aa18d57dc2ea1858cb734a3863f]
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- src/raptor_xml_writer.c | 7 ++++---
- 1 file changed, 4 insertions(+), 3 deletions(-)
-
-diff --git a/src/raptor_xml_writer.c b/src/raptor_xml_writer.c
-index 693b9468..0d3a36a5 100644
---- a/src/raptor_xml_writer.c
-+++ b/src/raptor_xml_writer.c
-@@ -181,9 +181,10 @@ raptor_xml_writer_start_element_common(raptor_xml_writer* xml_writer,
-   size_t nspace_declarations_count = 0;  
-   unsigned int i;
- 
--  /* max is 1 per element and 1 for each attribute + size of declared */
-   if(nstack) {
--    int nspace_max_count = element->attribute_count+1;
-+    int nspace_max_count = element->attribute_count * 2; /* attr and value */
-+    if(element->name->nspace)
-+      nspace_max_count++;
-     if(element->declared_nspaces)
-       nspace_max_count += raptor_sequence_size(element->declared_nspaces);
-     if(element->xml_language)
-@@ -237,7 +238,7 @@ raptor_xml_writer_start_element_common(raptor_xml_writer* xml_writer,
-         }
-       }
- 
--      /* Add the attribute + value */
-+      /* Add the attribute's value */
-       nspace_declarations[nspace_declarations_count].declaration=
-         raptor_qname_format_as_xml(element->attributes[i],
-                                    &nspace_declarations[nspace_declarations_count].length);
--- 
-2.20.1
-
diff --git a/package/raptor/0003-XML-Writer-compare-namespace-declarations-correctly.patch b/package/raptor/0003-XML-Writer-compare-namespace-declarations-correctly.patch
deleted file mode 100644
index a48a583cb1..0000000000
--- a/package/raptor/0003-XML-Writer-compare-namespace-declarations-correctly.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 4f5dbbffcc1c6cf0398bd03450453289a0979dea Mon Sep 17 00:00:00 2001
-From: Dave Beckett <dave@dajobe.org>
-Date: Sat, 18 Sep 2021 17:40:00 -0700
-Subject: [PATCH] XML Writer : compare namespace declarations correctly
-
-Apply patch from
-0001-CVE-2020-25713-raptor2-malformed-input-file-can-lead.patch.1
-that fixes Issue#0000650 https://bugs.librdf.org/mantis/view.php?id=650
-which overwrote heap during XML writing in parse type literal
-content.  This was detected with clang asan.
-
-Thanks to Michael Stahl / mst2 for the fix.
-
-[Retrieved from:
-https://github.com/dajobe/raptor/commit/4f5dbbffcc1c6cf0398bd03450453289a0979dea]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/raptor_xml_writer.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/raptor_xml_writer.c b/src/raptor_xml_writer.c
-index 56993dc3..4426d38c 100644
---- a/src/raptor_xml_writer.c
-+++ b/src/raptor_xml_writer.c
-@@ -227,7 +227,7 @@ raptor_xml_writer_start_element_common(raptor_xml_writer* xml_writer,
-           
-           /* check it wasn't an earlier declaration too */
-           for(j = 0; j < nspace_declarations_count; j++)
--            if(nspace_declarations[j].nspace == element->attributes[j]->nspace) {
-+            if(nspace_declarations[j].nspace == element->attributes[i]->nspace) {
-               declare_me = 0;
-               break;
-             }
diff --git a/package/raptor/raptor.hash b/package/raptor/raptor.hash
index 2a54bf270d..05e9c53902 100644
--- a/package/raptor/raptor.hash
+++ b/package/raptor/raptor.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  ada7f0ba54787b33485d090d3d2680533520cd4426d2f7fb4782dd4a6a1480ed  raptor2-2.0.15.tar.gz
-sha256  6b926a47abfb87451c436fbd4a868defec963d0232c70b806ac02d4a2a6e1968  LICENSE.txt
+sha256  089db78d7ac982354bdbf39d973baf09581e6904ac4c92a98c5caadb3de44680  raptor2-2.0.16.tar.gz
+sha256  0f0c719a05c9f7a0be2051ab83c1470837f595ed23e34989f46fd8eb45cfc251  LICENSE.txt
diff --git a/package/raptor/raptor.mk b/package/raptor/raptor.mk
index 69ac121300..ec7643ce3d 100644
--- a/package/raptor/raptor.mk
+++ b/package/raptor/raptor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RAPTOR_VERSION = 2.0.15
+RAPTOR_VERSION = 2.0.16
 RAPTOR_SOURCE = raptor2-$(RAPTOR_VERSION).tar.gz
 RAPTOR_SITE = http://download.librdf.org/source
 RAPTOR_DEPENDENCIES = libxml2 libxslt
@@ -17,12 +17,6 @@ RAPTOR_INSTALL_STAGING = YES
 # Flag is added to make sure the patch is applied for the configure.ac of raptor.
 RAPTOR_AUTORECONF = YES
 
-# 0002-Calcualte-max-nspace-declarations-correctly-for-XML-.patch
-RAPTOR_IGNORE_CVES += CVE-2017-18926
-
-# 0003-XML-Writer-compare-namespace-declarations-correctly.patch
-RAPTOR_IGNORE_CVES += CVE-2020-25713
-
 RAPTOR_CONF_OPTS =\
 	--with-xml2-config=$(STAGING_DIR)/usr/bin/xml2-config \
 	--with-xslt-config=$(STAGING_DIR)/usr/bin/xslt-config
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
