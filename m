From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jul 2015 18:37:35 +0200
Subject: [Buildroot] [git commit] rpi-userland: pass -DALL_APPS=OFF when
	example apps are disabled
Message-ID: <20150726163856.8EB5C805F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2bb611a046afcc2b3546b6ca20099100b31ef229
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It should have been part of commit
d705809c7a32d6868a742b790648a65857f21197.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rpi-userland/rpi-userland.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/rpi-userland/rpi-userland.mk b/package/rpi-userland/rpi-userland.mk
index 3a31733..403409d 100644
--- a/package/rpi-userland/rpi-userland.mk
+++ b/package/rpi-userland/rpi-userland.mk
@@ -46,6 +46,10 @@ define RPI_USERLAND_EXTRA_LIBS_STAGING
 endef
 RPI_USERLAND_POST_INSTALL_STAGING_HOOKS += RPI_USERLAND_EXTRA_LIBS_STAGING
 
+else
+
+RPI_USERLAND_CONF_OPTS += -DALL_APPS=OFF
+
 endif # BR2_PACKAGE_RPI_USERLAND_HELLO
 
 define RPI_USERLAND_POST_TARGET_CLEANUP
