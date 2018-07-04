From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  4 Jul 2018 22:36:24 +0200
Subject: [Buildroot] [PATCH] systemd: Fix polkit build order
Message-ID: <20180704203624.12391-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Asgeir Bjarni Ingvarsson <asgeir@appdynamic.com>

We need to install polkit before systemd if we want to enable
polkit integration, because systemd will not install polkit
policy files unless it finds polkit-gobject-1.

Signed-off-by: Asgeir Bjarni Ingvarsson <asgeir@appdynamic.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
I've resent this, as Asgeir does not seem to be subscribed to the list.
Asgeir, if you want to send more patches (which we encourage you to
do!), you'll need to subscribe to the list first.

Thanks! :-)
---
 package/systemd/systemd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 10e11a9277..04775ee778 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -283,6 +283,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_POLKIT),y)
 SYSTEMD_CONF_OPTS += -Dpolkit=true
+SYSTEMD_DEPENDENCIES += polkit
 else
 SYSTEMD_CONF_OPTS += -Dpolkit=false
 endif
-- 
2.14.1
