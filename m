From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 7 Aug 2013 17:50:21 +0200
Subject: [Buildroot] [git commit] gcc: fix !BR2_LARGEFILE builds
Message-ID: <20130807155005.E9AD89B230@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7fc685c9e0c9479365ca44158c1e928e57e391a4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

see http://lists.busybox.net/pipermail/buildroot/2013-August/076278.html

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Tested-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/gcc-final/gcc-final.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index 0d9d581..9f54c68 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -41,6 +41,7 @@ GCC_FINAL_CROSS_LANGUAGES = $(subst $(space),$(comma),$(GCC_FINAL_CROSS_LANGUAGE
 HOST_GCC_FINAL_CONF_OPT = \
 	$(HOST_GCC_COMMON_CONF_OPT) \
 	--enable-languages=$(GCC_FINAL_CROSS_LANGUAGES) \
+	$(DISABLE_LARGEFILE) \
 	--with-build-time-tools=$(HOST_DIR)/usr/$(GNU_TARGET_NAME)/bin
 
 ifeq ($(BR2_GCC_ENABLE_OPENMP),y)
