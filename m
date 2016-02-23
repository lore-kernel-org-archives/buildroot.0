From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Feb 2016 23:45:04 +0100
Subject: [Buildroot] [git commit] libuci: correct lua path
Message-ID: <20160223224510.123377FD0D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=21af11cce07f60ed6bbc4a21d5247a5153cbfac0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

LUAPATH is used as the path for installing lua binding.
As buildroot specifies the install prefix, STAGING_DIR gets
appended to TARGET_DIR which is incorrect path for installation,
so use relative path.

Reviewed-by: Abhimanyu Vishwakarma <Abhimanyu.Vishwakarma@imgtec.com>
Reviewed-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>
Signed-off-by: Neha Bairathi <Neha.Bairathi@imgtec.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libuci/libuci.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libuci/libuci.mk b/package/libuci/libuci.mk
index a78048d..8c060d5 100644
--- a/package/libuci/libuci.mk
+++ b/package/libuci/libuci.mk
@@ -13,7 +13,7 @@ LIBUCI_DEPENDENCIES = libubox
 ifeq ($(BR2_PACKAGE_LUA_5_1),y)
 LIBUCI_DEPENDENCIES += lua
 LIBUCI_CONF_OPTS += -DBUILD_LUA=ON \
-	-DLUAPATH=$(STAGING_DIR)/usr/lib/lua/5.1 \
+	-DLUAPATH=/usr/lib/lua/5.1 \
 	-DLUA_CFLAGS=-I$(STAGING_DIR)/usr/include
 else
 LIBUCI_CONF_OPTS += -DBUILD_LUA=OFF
