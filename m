From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 20 Mar 2017 22:52:41 +0200
Subject: [Buildroot] [PATCH 1/2] keepalived: fix libnl optional dependnecy
Message-ID: <15be326b7457179e1789109c706479ec13e7c8ad.1490043162.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

List libnl as a dependency when it is enabled. Make sure that libnfnetlink is
actually enabled when listing it as a dependency.

Cc: Ilias Apalodimas <apalos@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
v2: Drop the libnfnetlink select; update commit log (Thomas P)
---
 package/keepalived/keepalived.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/keepalived/keepalived.mk b/package/keepalived/keepalived.mk
index 97a4daa8b670..95757ff68130 100644
--- a/package/keepalived/keepalived.mk
+++ b/package/keepalived/keepalived.mk
@@ -13,8 +13,8 @@ KEEPALIVED_CONF_OPTS += --disable-dbus
 
 KEEPALIVED_PATCH = https://github.com/acassen/keepalived/commit/5d98b7b69fcbba84fa69e5b5e9a019bfbcb76e8b.patch
 
-ifeq ($(BR2_PACKAGE_LIBNL),y)
-KEEPALIVED_DEPENDENCIES += libnfnetlink
+ifeq ($(BR2_PACKAGE_LIBNL)$(BR2_PACKAGE_LIBNFNETLINK),yy)
+KEEPALIVED_DEPENDENCIES += libnl libnfnetlink
 endif
 
 ifeq ($(BR2_PACKAGE_IPSET),y)
-- 
2.11.0
