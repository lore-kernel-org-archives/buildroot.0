From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 18 Jan 2021 18:41:50 +0100
Subject: [Buildroot] [PATCH v2,
 1/2] Revert "docs/manual: replace LIBFOO_CPE_ID_PRODUCT"
Message-ID: <20210118174151.420304-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This reverts commit ff13cb94144cf2db3d019a32b82cbfa2168e4712.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 docs/manual/adding-packages-generic.txt | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index e1d2a464de..21fedd8b6b 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -515,7 +515,7 @@ LIBFOO_IGNORE_CVES += CVE-2020-54321
    identifier. When not defined, the default value is
    +<pkgname>_project+.
 
-** +LIBFOO_CPE_ID_NAME+, specifies the product part of the CPE
+** +LIBFOO_CPE_ID_PRODUCT+, specifies the product part of the CPE
    identifier. When not defined, the default value is +<pkgname>+.
 
 ** +LIBFOO_CPE_ID_VERSION+, specifies the version part of the CPE
@@ -533,9 +533,9 @@ package infrastructure will define +LIBFOO_CPE_ID+.
 +
 Alternatively, a package can also explicitly set +LIBFOO_CPE_ID_VALID
 = YES+ if the default values for +LIBFOO_CPE_ID_PREFIX+,
-+LIBFOO_CPE_ID_VENDOR+, +LIBFOO_CPE_ID_NAME+, +LIBFOO_CPE_ID_VERSION+,
-+LIBFOO_CPE_ID_VERSION_MINOR+ are all correct for this package and
-don't need to be explicitly overridden.
++LIBFOO_CPE_ID_VENDOR+, +LIBFOO_CPE_ID_PRODUCT+,
++LIBFOO_CPE_ID_VERSION+, +LIBFOO_CPE_ID_VERSION_MINOR+ are all correct
+for this package and don't need to be explicitly overridden.
 +
 For a host package, if its +LIBFOO_CPE_ID_*+ variables are not
 defined, it inherits the value of those variables from the
-- 
2.29.2
