From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Mar 2017 21:55:29 +0100
Subject: [Buildroot] [git commit] keepalived: fix libnl optional dependency
Message-ID: <20170320205548.4AF5C82257@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e64f876bab5eadab55805557963a0745289b3749
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

List libnl as a dependency when it is enabled. Make sure that
libnfnetlink is actually enabled when listing it as a dependency.

Cc: Ilias Apalodimas <apalos@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/keepalived/keepalived.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/keepalived/keepalived.mk b/package/keepalived/keepalived.mk
index 97a4daa..95757ff 100644
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
