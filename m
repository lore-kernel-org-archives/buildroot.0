Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8208ECAAA1
	for <buildroot@archiver.kernel.org>; Tue, 30 Aug 2022 16:19:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8216C8124F;
	Tue, 30 Aug 2022 16:19:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8216C8124F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vf4n2B_uwOJu; Tue, 30 Aug 2022 16:19:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D09481493;
	Tue, 30 Aug 2022 16:19:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D09481493
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DEF401BF3A8
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 16:15:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC97140BBE
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 16:15:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC97140BBE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AW27f2XexOdQ for <buildroot@lists.busybox.net>;
 Tue, 30 Aug 2022 16:15:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D87FF40BA5
 for <buildroot@buildroot.org>; Tue, 30 Aug 2022 16:15:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D87FF40BA5
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1E78A88100; Tue, 30 Aug 2022 16:00:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 30 Aug 2022 17:57:59 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: c5210469c94554e1b491f5552794190ee96097cd
X-Git-Newrev: 71ffdf2d737cdf9a13a65dcc28c3156ee141b87d
X-Patchwork-Hint: ignore
Message-Id: <20220830160007.1E78A88100@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/jszip: security
 bump to version 3.10.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=71ffdf2d737cdf9a13a65dcc28c3156ee141b87d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

- Santize filenames when files are loaded with loadAsync, to avoid "zip
  slip" attacks. The original filename is available on each zip entry as
  unsafeOriginalName. See the documentation.
- Drop patch (already in version)
- Update hash of license file (dual licensing clarification with
  https://github.com/Stuk/jszip/commit/f81c2d700d8e5fec4ed89fb565e4a266bb4dd26e)
- Update indentation in hash file (two spaces)

https://github.com/Stuk/jszip/blob/v3.10.0/CHANGES.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit fe522b9c17f2579a3c698354aa326962311053f2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...se-a-null-prototype-object-for-this-files.patch | 56 ----------------------
 package/jszip/jszip.hash                           |  4 +-
 package/jszip/jszip.mk                             |  5 +-
 3 files changed, 3 insertions(+), 62 deletions(-)

diff --git a/package/jszip/0001-fix-Use-a-null-prototype-object-for-this-files.patch b/package/jszip/0001-fix-Use-a-null-prototype-object-for-this-files.patch
deleted file mode 100644
index 969db5b403..0000000000
--- a/package/jszip/0001-fix-Use-a-null-prototype-object-for-this-files.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 22357494f424178cb416cdb7d93b26dd4f824b36 Mon Sep 17 00:00:00 2001
-From: Michael Aquilina <michaelaquilina@gmail.com>
-Date: Mon, 14 Jun 2021 12:28:46 +0100
-Subject: [PATCH] fix: Use a null prototype object for this.files
-
-This approach is taken to prevent overriding object methods that would
-exist on a normal object Object.create({})
-
-[Retrieved from:
-https://github.com/Stuk/jszip/commit/22357494f424178cb416cdb7d93b26dd4f824b36]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- lib/index.js  | 5 ++++-
- lib/object.js | 6 +++---
- 2 files changed, 7 insertions(+), 4 deletions(-)
-
-diff --git a/lib/index.js b/lib/index.js
-index b449877..b4c95ba 100644
---- a/lib/index.js
-+++ b/lib/index.js
-@@ -19,7 +19,10 @@ function JSZip() {
-     //   "folder/" : {...},
-     //   "folder/data.txt" : {...}
-     // }
--    this.files = {};
-+    // NOTE: we use a null prototype because we do not
-+    // want filenames like "toString" coming from a zip file
-+    // to overwrite methods and attributes in a normal Object.
-+    this.files = Object.create(null);
- 
-     this.comment = null;
- 
-diff --git a/lib/object.js b/lib/object.js
-index 1c9d8e8..aec3db7 100644
---- a/lib/object.js
-+++ b/lib/object.js
-@@ -179,16 +179,16 @@ var out = {
-      */
-     forEach: function(cb) {
-         var filename, relativePath, file;
-+        /* jshint ignore:start */
-+        // ignore warning about unwanted properties because this.files is a null prototype object
-         for (filename in this.files) {
--            if (!this.files.hasOwnProperty(filename)) {
--                continue;
--            }
-             file = this.files[filename];
-             relativePath = filename.slice(this.root.length, filename.length);
-             if (relativePath && filename.slice(0, this.root.length) === this.root) { // the file is in the current root
-                 cb(relativePath, file); // TODO reverse the parameters ? need to be clean AND consistent with the filter search fn...
-             }
-         }
-+        /* jshint ignore:end */
-     },
- 
-     /**
diff --git a/package/jszip/jszip.hash b/package/jszip/jszip.hash
index 13a2076ade..d0c56a44ab 100644
--- a/package/jszip/jszip.hash
+++ b/package/jszip/jszip.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	e5343decfb781b15c54c0df9ddedd6c8518c800a4667a0a95741c694a4f38d34  jszip-3.2.2.tar.gz
-sha256	14450c78405ad2a2173e25740b56406556779149df9c4c83523a8c63d0686210  LICENSE.markdown
+sha256  aa3033c6bb5357a0b0965c92fbdb6d6abe64676e70ffa7933b63c573ab79ee45  jszip-3.10.0.tar.gz
+sha256  566c953c6090b1218ca6217dd7359d45dde46581968586dc607d59a78af6a9c4  LICENSE.markdown
diff --git a/package/jszip/jszip.mk b/package/jszip/jszip.mk
index a93766be11..3504368675 100644
--- a/package/jszip/jszip.mk
+++ b/package/jszip/jszip.mk
@@ -4,15 +4,12 @@
 #
 ################################################################################
 
-JSZIP_VERSION = 3.2.2
+JSZIP_VERSION = 3.10.0
 JSZIP_SITE = $(call github,Stuk,jszip,v$(JSZIP_VERSION))
 JSZIP_LICENSE = MIT or GPL-3.0
 JSZIP_LICENSE_FILES = LICENSE.markdown
 JSZIP_CPE_ID_VENDOR = jszip_project
 
-# 0001-fix-Use-a-null-prototype-object-for-this-files.patch
-JSZIP_IGNORE_CVES += CVE-2021-23413
-
 define JSZIP_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0644 -D $(@D)/dist/jszip.min.js \
 		$(TARGET_DIR)/var/www/jszip/js/jszip.min.js
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
