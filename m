From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 17 Jan 2021 12:56:12 +0100
Subject: [Buildroot] [PATCH 1/1] package/git: add GIT_CPE_ID_VENDOR
Message-ID: <20210117115612.314640-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:git-scm:git is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agit-scm%3Agit

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/git/git.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/git/git.mk b/package/git/git.mk
index 8121add711..55178de138 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -9,6 +9,7 @@ GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
 GIT_LICENSE = GPL-2.0, LGPL-2.1+
 GIT_LICENSE_FILES = COPYING LGPL-2.1
+GIT_CPE_ID_VENDOR = git-scm
 GIT_DEPENDENCIES = zlib $(TARGET_NLS_DEPENDENCIES)
 # We're patching configure.ac
 GIT_AUTORECONF = YES
-- 
2.29.2
