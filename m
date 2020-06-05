From: Norbert Lange <nolange79@gmail.com>
Date: Sat,  6 Jun 2020 00:55:54 +0200
Subject: [Buildroot] [PATCH] package/iproute2: order after libcap and selinux
Message-ID: <20200605225555.13679-1-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

the configuration will automatically detect
if libcap / selinux is available.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/iproute2/iproute2.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 6d20f65f34..e5841cc460 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -16,6 +16,14 @@ ifeq ($(BR2_PACKAGE_ELFUTILS),y)
 IPROUTE2_DEPENDENCIES += elfutils
 endif
 
+ifeq ($(BR2_PACKAGE_LIBCAP),y)
+IPROUTE2_DEPENDENCIES += libcap
+endif
+
+ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
+IPROUTE2_DEPENDENCIES += libselinux
+endif
+
 ifeq ($(BR2_PACKAGE_IPTABLES)x$(BR2_STATIC_LIBS),yx)
 IPROUTE2_DEPENDENCIES += iptables
 else
-- 
2.26.2
