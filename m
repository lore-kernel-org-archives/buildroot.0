From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Dec 2018 15:51:25 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] package/libiscsi: fix
 build due to warnings
Message-ID: <20181216144722.1994C8D6F8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fe36685e074f9a832a9a15acce9fb2b40e3ab159
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Fixes:
    http://autobuild.buildroot.org/results/55b/55bf50fc7dcd465b71b5757434887dd3d0b25abc/
    http://autobuild.buildroot.org/results/98d/98dcfe5c9fc3babd5c8d3116d5128d437715c44e/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d2d81637ee6483aa23a2266154efd3d047bc0bb6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libiscsi/libiscsi.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libiscsi/libiscsi.mk b/package/libiscsi/libiscsi.mk
index 6c8600829c..c492865c51 100644
--- a/package/libiscsi/libiscsi.mk
+++ b/package/libiscsi/libiscsi.mk
@@ -11,6 +11,8 @@ LIBISCSI_LICENSE_FILES = COPYING LICENCE-GPL-2.txt LICENCE-LGPL-2.1.txt
 LIBISCSI_INSTALL_STAGING = YES
 LIBISCSI_AUTORECONF = YES
 
+LIBISCSI_CONF_OPTS = --disable-werror
+
 # We need to create the m4 directory to make autoreconf work properly.
 define LIBISCSI_CREATE_M4_DIR
 	mkdir -p $(@D)/m4
