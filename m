From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 Jul 2012 23:23:27 +0200
Subject: [Buildroot] [git commit] scons: expose SCONS variable,
	pointing to host scons
Message-ID: <20120723212357.A1D4196DC8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3083ea8922949613efb6ac9443422eccff3ee551
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Just like we have AUTOMAKE, AUTOCONF or QT_QMAKE, let the scons
package provide a SCONS variable that points to the scons host binary.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/scons/scons.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/scons/scons.mk b/package/scons/scons.mk
index 85dbfaf..b81c4f4 100644
--- a/package/scons/scons.mk
+++ b/package/scons/scons.mk
@@ -11,3 +11,6 @@ define HOST_SCONS_INSTALL_CMDS
 endef
 
 $(eval $(host-generic-package))
+
+# variables used by other packages
+SCONS = $(HOST_DIR)/usr/bin/scons
