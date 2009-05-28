From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 28 May 2009 14:31:20 +0200
Subject: [Buildroot] [git commit] dropbear: fix initscript install
Message-ID: <20090528123336.7515B77839@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4088a5294dfd326b77cde77d12a7f97af89500ad
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


The -D option to install only works portably when the destination is
a file. Specifying the filename avoids the following build error (at
least on some hosts):

"/usr/bin/install: cannot overwrite directory `/tmp/buildroot/
project_build_foobar/uclibc/root/etc/init.d' with non-directory"

Signed-off-by: Marc Gauthier <marc@tensilica.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/dropbear/dropbear.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index e84df87..63d3daa 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -28,7 +28,7 @@ $(DROPBEAR_TARGET_INSTALL_TARGET):
 	ln -snf ../sbin/dropbear $(TARGET_DIR)/usr/bin/scp
 	ln -snf ../sbin/dropbear $(TARGET_DIR)/usr/bin/ssh
 	if [ ! -f $(TARGET_DIR)/etc/init.d/S50dropbear ]; then \
-		$(INSTALL) -m 0755 -D package/dropbear/S50dropbear $(TARGET_DIR)/etc/init.d; \
+		$(INSTALL) -m 0755 -D package/dropbear/S50dropbear $(TARGET_DIR)/etc/init.d/S50dropbear; \
 	fi
 	touch $@
 
-- 
1.6.0.6
