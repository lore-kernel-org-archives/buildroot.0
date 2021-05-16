From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 16 May 2021 11:34:22 +0200
Subject: [Buildroot] [PATCH 2/2] package/jquery-validation: security bump to
 version 1.19.3
In-Reply-To: <20210516093422.3768746-1-fontaine.fabrice@gmail.com>
References: <20210516093422.3768746-1-fontaine.fabrice@gmail.com>
Message-ID: <20210516093422.3768746-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix CVE-2021-21252: The jQuery Validation Plugin provides drop-in
validation for your existing forms. It is published as an npm package
"jquery-validation". jquery-validation before version 1.19.3 contains
one or more regular expressions that are vulnerable to ReDoS (Regular
Expression Denial of Service).

Update hash of README.md due to changes not related to license

https://github.com/jquery-validation/jquery-validation/releases/tag/1.19.3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/jquery-validation/jquery-validation.hash | 4 ++--
 package/jquery-validation/jquery-validation.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/jquery-validation/jquery-validation.hash b/package/jquery-validation/jquery-validation.hash
index af451a6c1a..4dbe07e218 100644
--- a/package/jquery-validation/jquery-validation.hash
+++ b/package/jquery-validation/jquery-validation.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  14efe6f1784ef6e97116b15c77b04b7e8f47ec07b1479bcd6fa0b081faa19440  jquery-validation-1.14.0.zip
-sha256  c2f9aa180de990ff16ca7e756c9af52ecc1b3536e3fb32649d7b2c510bccf9d0  README.md
+sha256  01ad2ef0a7f9cd413aeb51081651293916da47d20e5c0a59ec62587e58b03564  jquery-validation-1.19.3.zip
+sha256  3e5a99460077c16bf75f6821a30cdac9baa339119ebf63b2a6c49f4f50421ca4  README.md
diff --git a/package/jquery-validation/jquery-validation.mk b/package/jquery-validation/jquery-validation.mk
index 43e57a9fc9..920ed1cece 100644
--- a/package/jquery-validation/jquery-validation.mk
+++ b/package/jquery-validation/jquery-validation.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-JQUERY_VALIDATION_VERSION = 1.14.0
-JQUERY_VALIDATION_SITE = http://jqueryvalidation.org/files
+JQUERY_VALIDATION_VERSION = 1.19.3
+JQUERY_VALIDATION_SITE = https://github.com/jquery-validation/jquery-validation/releases/download/$(JQUERY_VALIDATION_VERSION)
 JQUERY_VALIDATION_SOURCE = jquery-validation-$(JQUERY_VALIDATION_VERSION).zip
 JQUERY_VALIDATION_LICENSE = MIT
 JQUERY_VALIDATION_LICENSE_FILES = README.md
-- 
2.30.2
