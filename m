From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Jul 2011 23:11:17 +0200
Subject: [Buildroot] [git commit] scons: new package
Message-ID: <20110724211847.C9E948AE9D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=cae6d2397bfb49cda38d5ba629e049a959eede8a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Only the host package is supported.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/scons/scons.mk |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)
 create mode 100644 package/scons/scons.mk

diff --git a/package/scons/scons.mk b/package/scons/scons.mk
new file mode 100644
index 0000000..f8fe84b
--- /dev/null
+++ b/package/scons/scons.mk
@@ -0,0 +1,13 @@
+SCONS_VERSION = 2.0.1
+SCONS_SOURCE = scons-$(SCONS_VERSION).tar.gz
+SCONS_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/scons
+
+define HOST_SCONS_BUILD_CMDS
+	(cd $(@D); python setup.py build)
+endef
+
+define HOST_SCONS_INSTALL_CMDS
+	(cd $(@D); python setup.py install --prefix=$(HOST_DIR)/usr)
+endef
+
+$(eval $(call GENTARGETS,package,scons,host))
-- 
1.7.3.4
