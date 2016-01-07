From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  7 Jan 2016 15:43:34 -0300
Subject: [Buildroot] [PATCH] dhcpcd: security bump to version 6.10.0
Message-ID: <1452192214-29918-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
CVE-2016-1503 - heap overflow via malformed dhcp responses later in
print_option (via dhcp_envoption1) due to incorrect option length
values.
CVE-2016-1504 - invalid read/crash via malformed dhcp responses.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dhcpcd/dhcpcd.hash | 2 +-
 package/dhcpcd/dhcpcd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dhcpcd/dhcpcd.hash b/package/dhcpcd/dhcpcd.hash
index 94ab89e..18ffaed 100644
--- a/package/dhcpcd/dhcpcd.hash
+++ b/package/dhcpcd/dhcpcd.hash
@@ -1,2 +1,2 @@
 # Locally calculated from download (no sig, hash)
-sha256	c3f3ff7473ef158a1e71db9aea7424df2c3477ad064e2b542f27948a5abc9ba0	dhcpcd-6.9.4.tar.xz
+sha256	ab56af9b2e86913c55a965cb0f835e87749df78318564acf90d5d698f413ad35	dhcpcd-6.10.0.tar.xz
diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
index 2d0cb0c..27e0666 100644
--- a/package/dhcpcd/dhcpcd.mk
+++ b/package/dhcpcd/dhcpcd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DHCPCD_VERSION = 6.9.4
+DHCPCD_VERSION = 6.10.0
 DHCPCD_SOURCE = dhcpcd-$(DHCPCD_VERSION).tar.xz
 DHCPCD_SITE = http://roy.marples.name/downloads/dhcpcd
 DHCPCD_DEPENDENCIES = host-pkgconf
-- 
2.4.10
