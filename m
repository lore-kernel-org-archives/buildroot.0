From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2016 08:36:21 +0200
Subject: [Buildroot] [git commit] libuci: update legal info
Message-ID: <20160705063646.6B0EB7FDBB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=80a763af59f1385c9443dc5cf304e80d717c7003
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

CLI tool and lua bindings are released under GPLv2.

Reviewed-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
[Thomas: use proper construct to concatenate new licenses to
<pkg>_LICENSE, as suggested by Yann E. Morin.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libuci/libuci.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libuci/libuci.mk b/package/libuci/libuci.mk
index 8c060d5..6647045 100644
--- a/package/libuci/libuci.mk
+++ b/package/libuci/libuci.mk
@@ -6,7 +6,7 @@
 
 LIBUCI_VERSION = e339407372ffc70b1451e4eda218c01aa95a6a7f
 LIBUCI_SITE = git://nbd.name/uci.git
-LIBUCI_LICENSE = LGPLv2.1
+LIBUCI_LICENSE = LGPLv2.1, GPLv2 (tools)
 LIBUCI_INSTALL_STAGING = YES
 LIBUCI_DEPENDENCIES = libubox
 
@@ -15,6 +15,7 @@ LIBUCI_DEPENDENCIES += lua
 LIBUCI_CONF_OPTS += -DBUILD_LUA=ON \
 	-DLUAPATH=/usr/lib/lua/5.1 \
 	-DLUA_CFLAGS=-I$(STAGING_DIR)/usr/include
+LIBUCI_LICENSE := $(LIBUCI_LICENSE), GPLv2 (lua bindings)
 else
 LIBUCI_CONF_OPTS += -DBUILD_LUA=OFF
 endif
