From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  4 Dec 2018 10:31:52 +0100
Subject: [Buildroot] [PATCH] package/libiscsi: fix build due to warnings
Message-ID: <20181204093152.10692-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
    http://autobuild.buildroot.org/results/55b/55bf50fc7dcd465b71b5757434887dd3d0b25abc/
    http://autobuild.buildroot.org/results/98d/98dcfe5c9fc3babd5c8d3116d5128d437715c44e/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
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
-- 
2.14.1
