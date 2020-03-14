From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Mar 2020 18:18:25 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/linknx:
 host-pkgconf is mandatory
Message-ID: <20200314170810.42FB8815B3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=74008592b3b46c8e5f7036d8c0f63a7d65251f79
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

host-pkgconf is a mandatory dependency, this will fix per-package build

Fixes:
 - http://autobuild.buildroot.org/results/cfda0ce53165bb22b691b5b6510f0ab096a41e17

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 16d3e1734e165a415652e9482f5ff34ff5ce518a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linknx/linknx.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/linknx/linknx.mk b/package/linknx/linknx.mk
index 15d4b5a109..c75f0655d6 100644
--- a/package/linknx/linknx.mk
+++ b/package/linknx/linknx.mk
@@ -17,7 +17,9 @@ LINKNX_CONF_OPTS = \
 	--with-pth=$(STAGING_DIR)/usr \
 	--disable-smtp
 
-LINKNX_DEPENDENCIES = libpthsem \
+LINKNX_DEPENDENCIES = \
+	host-pkgconf \
+	libpthsem \
 	$(if $(BR2_PACKAGE_ARGP_STANDALONE),argp-standalone) \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
 
@@ -30,7 +32,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_LOG4CPP),y)
 LINKNX_CONF_OPTS += --with-log4cpp
-LINKNX_DEPENDENCIES += host-pkgconf log4cpp
+LINKNX_DEPENDENCIES += log4cpp
 else
 LINKNX_CONF_OPTS += --without-log4cpp
 endif
