From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Sep 2019 10:46:03 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/expat: security
 bump to version 2.2.8
Message-ID: <20190926084052.02BFF8F7CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b3e39a75436188de2a734db8a9cf3753470e5a92
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes the following security vulnerability:

CVE-2019-15903: In libexpat before 2.2.8, crafted XML input could fool the
parser into changing from DTD parsing to document parsing too early; a
consecutive call to XML_GetCurrentLineNumber (or XML_GetCurrentColumnNumber)
then resulted in a heap-based buffer over-read.

While we're at it, also change to use .tar.xz rather than the bigger
.tar.bz2.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 386794d02ef030e14adfabc5056b54a338bd717f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/expat/expat.hash | 8 ++++----
 package/expat/expat.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/expat/expat.hash b/package/expat/expat.hash
index 91f70f36ed..07faca5e61 100644
--- a/package/expat/expat.hash
+++ b/package/expat/expat.hash
@@ -1,7 +1,7 @@
-# From https://sourceforge.net/projects/expat/files/expat/2.2.7/
-md5	72f36b87cdb478aba1e78473393766aa		expat-2.2.7.tar.bz2
-sha1	9c8a268211e3f1ae31c4d550e5be7708973ec6a6	expat-2.2.7.tar.bz2
+# From https://sourceforge.net/projects/expat/files/expat/2.2.8/
+md5	cdf54239f892fc7914957f10de1e1c70		expat-2.2.8.tar.xz
+sha1	500a848d7085df06020a86bf64c5f71c0052a080	expat-2.2.8.tar.xz
 
 # Locally calculated
-sha256	cbc9102f4a31a8dafd42d642e9a3aa31e79a0aedaa1f6efd2795ebc83174ec18	expat-2.2.7.tar.bz2
+sha256	61caa81a49d858afb2031c7b1a25c97174e7f2009aa1ec4e1ffad2316b91779b	expat-2.2.8.tar.xz
 sha256	46336ab2fec900803e2f1a4253e325ac01d998efb09bc6906651f7259e636f76	COPYING
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index 1b49a12c49..20d0add831 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-EXPAT_VERSION = 2.2.7
+EXPAT_VERSION = 2.2.8
 EXPAT_SITE = http://downloads.sourceforge.net/project/expat/expat/$(EXPAT_VERSION)
-EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.bz2
+EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.xz
 EXPAT_INSTALL_STAGING = YES
 EXPAT_DEPENDENCIES = host-pkgconf
 HOST_EXPAT_DEPENDENCIES = host-pkgconf
