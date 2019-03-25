From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 25 Mar 2019 18:59:32 +0100
Subject: [Buildroot] [PATCH 1/2] package/odhcp6c: bump to version
 d2e247d8d87ecf8c60fcf0acdad05667bd379521
Message-ID: <20190325175933.16531-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Remove patch (already in version)
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-dhcpv6-fix-strncpy-bounds.patch      | 28 -------------------
 package/odhcp6c/odhcp6c.hash                  |  3 +-
 package/odhcp6c/odhcp6c.mk                    |  2 +-
 3 files changed, 3 insertions(+), 30 deletions(-)
 delete mode 100644 package/odhcp6c/0001-dhcpv6-fix-strncpy-bounds.patch

diff --git a/package/odhcp6c/0001-dhcpv6-fix-strncpy-bounds.patch b/package/odhcp6c/0001-dhcpv6-fix-strncpy-bounds.patch
deleted file mode 100644
index abf5191522..0000000000
--- a/package/odhcp6c/0001-dhcpv6-fix-strncpy-bounds.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 327f73dd7093d04c2dbea13ee30fc3dfafc5e944 Mon Sep 17 00:00:00 2001
-From: Hans Dedecker <dedeckeh@gmail.com>
-Date: Sat, 21 Apr 2018 13:40:29 +0200
-Subject: [PATCH] dhcpv6: fix strncpy bounds
-
-Fixes dhcpv6.c:138:2: error: 'strncpy' specified bound 16 equals destination size [-Werror=stringop-truncation]                                                                                                        strncpy(ifr.ifr_name, ifname, sizeof(ifr.ifr_name));
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Hans Dedecker <dedeckeh@gmail.com>
-[Retrieved (and backported) from:
-https://github.com/openwrt/odhcp6c/commit/327f73dd7093d04c2dbea13ee30fc3dfafc5e944]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/dhcpv6.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/dhcpv6.c b/src/dhcpv6.c
-index 0b3585c..d70d533 100644
---- a/src/dhcpv6.c
-+++ b/src/dhcpv6.c
-@@ -135,7 +135,7 @@ int init_dhcpv6(const char *ifname, unsigned int options, int sol_timeout)
- 	// Detect interface
- 	struct ifreq ifr;
--	strncpy(ifr.ifr_name, ifname, sizeof(ifr.ifr_name));
-+	strncpy(ifr.ifr_name, ifname, sizeof(ifr.ifr_name) - 1);
- 	if (ioctl(sock, SIOCGIFINDEX, &ifr) < 0)
- 		return -1;
- 
diff --git a/package/odhcp6c/odhcp6c.hash b/package/odhcp6c/odhcp6c.hash
index 688d77dc62..8b16fa98bb 100644
--- a/package/odhcp6c/odhcp6c.hash
+++ b/package/odhcp6c/odhcp6c.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256 d84a713010865215301b4186c7b5368c9f006e6d3b9b52b99bd25e2d9e7a1dfc odhcp6c-7533a6243dc3ac5a747cf6ccbc4d0539dafd3e07.tar.gz
+sha256 6d472320ccfa2e57197596869507f2a4bf9900a502939404bf0c033dceeadf5f odhcp6c-d2e247d8d87ecf8c60fcf0acdad05667bd379521.tar.gz
+sha256 e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4 COPYING
diff --git a/package/odhcp6c/odhcp6c.mk b/package/odhcp6c/odhcp6c.mk
index 31867d7217..735b47420f 100644
--- a/package/odhcp6c/odhcp6c.mk
+++ b/package/odhcp6c/odhcp6c.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ODHCP6C_VERSION = 7533a6243dc3ac5a747cf6ccbc4d0539dafd3e07
+ODHCP6C_VERSION = d2e247d8d87ecf8c60fcf0acdad05667bd379521
 ODHCP6C_SITE = $(call github,sbyx,odhcp6c,$(ODHCP6C_VERSION))
 ODHCP6C_LICENSE = GPL-2.0
 ODHCP6C_LICENSE_FILES = COPYING
-- 
2.20.1
