From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 26 Dec 2020 18:17:45 +0100
Subject: [Buildroot] [PATCH 3/3] package/dhcpcd: add udev optional dependency
In-Reply-To: <20201226171745.2414764-1-fontaine.fabrice@gmail.com>
References: <20201226171745.2414764-1-fontaine.fabrice@gmail.com>
Message-ID: <20201226171745.2414764-3-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

udev is an optional dependency (enabled by default) since version 6.1.0:
https://github.com/rsmarples/dhcpcd/commit/12bbc8cb5c7507be15a7e0af4140c3d81125c46c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dhcpcd/dhcpcd.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
index 7b69602605..4900e0581f 100644
--- a/package/dhcpcd/dhcpcd.mk
+++ b/package/dhcpcd/dhcpcd.mk
@@ -16,6 +16,13 @@ DHCPCD_CONFIG_OPTS = \
 	--os=linux \
 	--privsepuser=dhcpcd
 
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+DHCPCD_CONFIG_OPTS += --with-udev
+DHCPCD_DEPENDENCIES += udev
+else
+DHCPCD_CONFIG_OPTS += --without-udev
+endif
+
 ifeq ($(BR2_STATIC_LIBS),y)
 DHCPCD_CONFIG_OPTS += --enable-static
 endif
-- 
2.29.2
