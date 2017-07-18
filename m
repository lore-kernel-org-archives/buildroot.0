From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 18 Jul 2017 15:21:18 +0300
Subject: [Buildroot] [PATCH 1/2] git: use BR2_KERNEL_MIRROR as download site
Message-ID: <3e2f239c0be8ae7fb4ea970a00826e0ed621a685.1500380479.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/git/git.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/git/git.mk b/package/git/git.mk
index 52907a27b738..1d81955040c4 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -6,7 +6,7 @@
 
 GIT_VERSION = 2.13.0
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
-GIT_SITE = https://www.kernel.org/pub/software/scm/git
+GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
 GIT_LICENSE = GPL-2.0, LGPL-2.1+
 GIT_LICENSE_FILES = COPYING LGPL-2.1
 GIT_DEPENDENCIES = zlib $(TARGET_NLS_DEPENDENCIES)
-- 
2.13.2
