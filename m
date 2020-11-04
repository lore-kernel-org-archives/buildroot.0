From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed,  4 Nov 2020 15:51:38 +0100
Subject: [Buildroot] [PATCH 04/10] docs/manual: document <pkg>_CPE_ID
 variables
In-Reply-To: <20201104145145.1316167-1-thomas.petazzoni@bootlin.com>
References: <20201104145145.1316167-1-thomas.petazzoni@bootlin.com>
Message-ID: <20201104145145.1316167-5-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/manual/adding-packages-generic.txt | 39 +++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index b8bfcb4aff..3fcf741a1a 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -502,6 +502,45 @@ LIBFOO_IGNORE_CVES += CVE-2020-12345
 LIBFOO_IGNORE_CVES += CVE-2020-54321
 ----------------------
 
+* +LIBFOO_CPE_ID_*+ variables is a set of variables that allows the
+  package to define its https://nvd.nist.gov/products/cpe[CPE
+  identifier]. The available variables are:
++
+--
+** +LIBFOO_CPE_ID_PREFIX+, specifies the prefix of the CPE identifier,
+   i.e the first three fields. When not defined, the default value is
+   +cpe:2.3:a+.
+
+** +LIBFOO_CPE_ID_VENDOR+, specifies the vendor part of the CPE
+   identifier. When not defined, the default value is
+   +<pkgname>_project+.
+
+** +LIBFOO_CPE_ID_PRODUCT+, specifies the product part of the CPE
+   identifier. When not defined, the default value is +<pkgname>+.
+
+** +LIBFOO_CPE_ID_VERSION+, specifies the version part of the CPE
+   identifier. When not defined the default value is
+   +$(LIBFOO_VERSION)+.
+
+** +LIBFOO_CPE_ID_VERSION_MINOR+ specifies the _update_ part of the
+   CPE identifier. When not defined the default value is +*+.
+--
++
+If any of those variables is defined, then the generic package
+infrastructure assumes the package provides valid CPE information. In
+this case, +LIBFOO_CPE_ID_VALID = YES+ will be sent, and the generic
+package infrastructure will define +LIBFOO_CPE_ID+.
++
+Alternatively, a package can also explicitly set +LIBFOO_CPE_ID_VALID
+= YES+ if the default values for +LIBFOO_CPE_ID_PREFIX+,
++LIBFOO_CPE_ID_VENDOR+, +LIBFOO_CPE_ID_PRODUCT+,
++LIBFOO_CPE_ID_VERSION+, +LIBFOO_CPE_ID_VERSION_MINOR+ are all correct
+for this package and don't need to be explicitly overridden.
++
+For a host package, if its +LIBFOO_CPE_ID_*+ variables are not
+defined, it inherits the value of those variables from the
+corresponding target package.
+
 The recommended way to define these variables is to use the following
 syntax:
 
-- 
2.26.2
