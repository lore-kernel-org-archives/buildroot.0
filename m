From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Jan 2015 13:03:21 +0100
Subject: [Buildroot] [git commit] netsurf-buildsystem: new package
Message-ID: <20150110121528.581318002A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=adeb2f117cee0cc3f72097c2d6bbe6169a098dde
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is the NetSurf project shared build system, used by various NetSurf
sub-projects like the libsvgtiny project.

[Thomas: use cp -dpfr instead of just cp -r, to match what we do in
other Buildroot packages.]

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/netsurf-buildsystem/netsurf-buildsystem.mk |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+), 0 deletions(-)

diff --git a/package/netsurf-buildsystem/netsurf-buildsystem.mk b/package/netsurf-buildsystem/netsurf-buildsystem.mk
new file mode 100644
index 0000000..3478850
--- /dev/null
+++ b/package/netsurf-buildsystem/netsurf-buildsystem.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# netsurf-buildsystem
+#
+################################################################################
+
+NETSURF_BUILDSYSTEM_VERSION = 7574b41345968b5f7e9ca5875faccb1478ce0555
+NETSURF_BUILDSYSTEM_SITE = http://git.netsurf-browser.org/buildsystem.git
+NETSURF_BUILDSYSTEM_SITE_METHOD = git
+NETSURF_BUILDSYSTEM_LICENSE = MIT, BSD-3c (for llvm/* files)
+NETSURF_BUILDSYSTEM_LICENSE_FILES = llvm/LICENSE.TXT
+
+NETSURF_BUILDSYSTEM_INSTALL_DIR = $(HOST_DIR)/usr/share/netsurf-buildsystem
+
+define HOST_NETSURF_BUILDSYSTEM_INSTALL_CMDS
+	mkdir -p $(NETSURF_BUILDSYSTEM_INSTALL_DIR)
+	cp -dpfr $(@D)/* $(NETSURF_BUILDSYSTEM_INSTALL_DIR)
+endef
+
+$(eval $(host-generic-package))
