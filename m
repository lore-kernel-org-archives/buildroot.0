From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Mar 2019 12:20:19 +0100
Subject: [Buildroot] [git commit] package/network-manager: bump to version
 1.14.6
Message-ID: <20190317111721.1229F8EC5D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=02f436d2d5eaf5491484fdec226832a3955833b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop upstream patch (included in this release).

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...sure-we-have-enough-space-for-the-DHCP6-o.patch | 38 ----------------------
 package/network-manager/network-manager.hash       |  4 +--
 package/network-manager/network-manager.mk         |  4 +--
 3 files changed, 4 insertions(+), 42 deletions(-)

diff --git a/package/network-manager/0001-dhcp6-make-sure-we-have-enough-space-for-the-DHCP6-o.patch b/package/network-manager/0001-dhcp6-make-sure-we-have-enough-space-for-the-DHCP6-o.patch
deleted file mode 100644
index c6066abe28..0000000000
--- a/package/network-manager/0001-dhcp6-make-sure-we-have-enough-space-for-the-DHCP6-o.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 01ca2053bbea09f35b958c8cc7631e15469acb79 Mon Sep 17 00:00:00 2001
-From: Lennart Poettering <lennart@poettering.net>
-Date: Fri, 19 Oct 2018 12:12:33 +0200
-Subject: dhcp6: make sure we have enough space for the DHCP6 option header
-
-Fixes a vulnerability originally discovered by Felix Wilhelm from
-Google.
-
-CVE-2018-15688
-LP: #1795921
-https://bugzilla.redhat.com/show_bug.cgi?id=1639067
-
-(cherry picked from commit 4dac5eaba4e419b29c97da38a8b1f82336c2c892)
-
-Patch downloaded from upstream commit:
-https://cgit.freedesktop.org/NetworkManager/NetworkManager/commit/?id=01ca2053bbea09f35b958c8cc7631e15469acb79
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- src/systemd/src/libsystemd-network/dhcp6-option.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/systemd/src/libsystemd-network/dhcp6-option.c b/src/systemd/src/libsystemd-network/dhcp6-option.c
-index d178fe2..9027c14 100644
---- a/src/systemd/src/libsystemd-network/dhcp6-option.c
-+++ b/src/systemd/src/libsystemd-network/dhcp6-option.c
-@@ -108,7 +108,7 @@ int dhcp6_option_append_ia(uint8_t **buf, size_t *buflen, const DHCP6IA *ia) {
-                 return -EINVAL;
-         }
- 
--        if (*buflen < len)
-+        if (*buflen < offsetof(DHCP6Option, data) + len)
-                 return -ENOBUFS;
- 
-         ia_hdr = *buf;
--- 
-cgit v1.1
-
diff --git a/package/network-manager/network-manager.hash b/package/network-manager/network-manager.hash
index 3439439175..7c64e6505e 100644
--- a/package/network-manager/network-manager.hash
+++ b/package/network-manager/network-manager.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/NetworkManager/1.10/NetworkManager-1.10.8.sha256sum
-sha256 eb4ac8ce75fed5ec804f409caec7b54342d4e01512baf7d7fc119fd40ac8a938  NetworkManager-1.10.8.tar.xz
+# From http://ftp.gnome.org/pub/GNOME/sources/NetworkManager/1.14/NetworkManager-1.14.6.sha256sum
+sha256 693bcdad15eec7f07a06cbc6e43ddb3b1c13b2d2d23ec165fbb5adf4c3323a5d  NetworkManager-1.14.6.tar.xz
 # Locally computed
 sha256 49d9659a4f9a09747c320d51d3cf9dfde210de67b70862acf849890f6477b00d  COPYING
 sha256 3a2968e3abb4fea464cd8dc1146d71996f9544af91a5f687bc4f3a2932df49b4  libnm-util/COPYING
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 2b9f68a030..721533038c 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-NETWORK_MANAGER_VERSION_MAJOR = 1.10
-NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).8
+NETWORK_MANAGER_VERSION_MAJOR = 1.14
+NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).6
 NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
 NETWORK_MANAGER_SITE = http://ftp.gnome.org/pub/GNOME/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
 NETWORK_MANAGER_INSTALL_STAGING = YES
