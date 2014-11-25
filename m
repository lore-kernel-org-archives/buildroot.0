From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 25 Nov 2014 15:57:11 +0100
Subject: [Buildroot] [git commit] gd: use pkg-config to figure out png
	linker flags
Message-ID: <20141125145743.A71CF7FEF6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ccec35e342a38537fba746a483eec063b5151d3e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

So gdlib-config --libs returns the full dependency chain (-lpng16 -lz -m)
when linking statically.

Fixes http://autobuild.buildroot.net/results/dac/dac3eb950c7c27b2f09f001f9db9936f897721f9/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gd/gd.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/gd/gd.mk b/package/gd/gd.mk
index d0fd572..1613464 100644
--- a/package/gd/gd.mk
+++ b/package/gd/gd.mk
@@ -40,7 +40,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
 GD_DEPENDENCIES += libpng
-GD_CONF_OPTS += --with-png=$(STAGING_DIR)/usr
+GD_CONF_OPTS += --with-png
 else
 GD_CONF_OPTS += --without-png
 endif
