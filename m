Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B75AEB64DC
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 19:44:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B6DF81C46;
	Sun, 25 Jun 2023 19:44:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B6DF81C46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wJe7zgjbLwk1; Sun, 25 Jun 2023 19:44:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 085FA81C6F;
	Sun, 25 Jun 2023 19:44:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 085FA81C6F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8DE071BF909
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 19:44:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7493D60F20
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 19:44:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7493D60F20
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MefaDrJvuXAs for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 19:44:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4BD6A60BCD
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 19:44:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BD6A60BCD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 381B0851A9; Sun, 25 Jun 2023 19:44:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Jun 2023 21:42:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1880a061e8a34b759a62da9ef0eed8ab566c88dd
X-Git-Newrev: 2fa8914bf1dad02e7110ba94a51796511151e7a4
X-Patchwork-Hint: ignore
Message-Id: <20230625194428.381B0851A9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/raptor: security bump version to
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2fa8914bf1dad02e7110ba94a51796511151e7a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This version included the patches removed by this commit, no new CVEs
were fixed.

Release notes: https://librdf.org/raptor/RELEASE.html#rel2_0_16

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .checkpackageignore                                |  2 -
 ...ax-nspace-declarations-correctly-for-XML-.patch | 47 ----------------------
 ...-compare-namespace-declarations-correctly.patch | 33 ---------------
 package/raptor/raptor.hash                         |  4 +-
 package/raptor/raptor.mk                           |  8 +---
 5 files changed, 3 insertions(+), 91 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index d0378929ee..2e5c833156 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1338,8 +1338,6 @@ package/quotatool/0001-fix-missing-__P-definition-for-musl-compile.patch Upstrea
 package/racehound/0001-Fix-module-install-path-lib-instead-of-usr-lib-prefi.patch Upstream
 package/ranger/0001-colorscheme-check-for-compiled-python-files.patch Upstream
 package/rapidxml/0001-ensure-internal-print-operations-are-declared-before.patch Upstream
-package/raptor/0002-Calcualte-max-nspace-declarations-correctly-for-XML-.patch Upstream
-package/raptor/0003-XML-Writer-compare-namespace-declarations-correctly.patch Upstream
 package/raspberrypi-usbboot/0001-Makefile-allow-passing-CFLAGS-LDFLAGS.patch Upstream
 package/rdesktop/0001-8bit-colors.patch Sob Upstream
 package/read-edid/0001-Fix-install-file-list.patch Upstream
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
