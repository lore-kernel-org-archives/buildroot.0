From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Mon, 4 Jul 2016 18:16:22 +0530
Subject: [Buildroot] [PATCH 2/6] libuci: update legal info
In-Reply-To: <1467636386-6759-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1467636386-6759-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <1467636386-6759-2-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

CLI tool and lua bindings are released under GPLv2.

Reviewed-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
---
 package/libuci/libuci.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libuci/libuci.mk b/package/libuci/libuci.mk
index 8c060d5..b9bd0c7 100644
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
+LIBUCI_LICENSE += , GPLv2 (lua bindings)
 else
 LIBUCI_CONF_OPTS += -DBUILD_LUA=OFF
 endif
-- 
2.6.2
