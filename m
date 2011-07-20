From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Jul 2011 06:43:07 +0200
Subject: [Buildroot] [PATCH 1/3] scons: new package
In-Reply-To: <cover.1311136895.git.thomas.petazzoni@free-electrons.com>
References: <cover.1311136895.git.thomas.petazzoni@free-electrons.com>
Message-ID: <c7952f680aac3925e849199f2a644dcf0ed3851f.1311136895.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Only the host package is supported.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
1.7.4.1
