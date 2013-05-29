From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 29 May 2013 15:41:13 +0200
Subject: [Buildroot] [git commit branch/next] network-manager: use a
	<pkg>_VERSION_MAJOR variable
Message-ID: <20130529141138.3F6479A65C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2db98f63b0140a7dc7e9d9715c072e79cc68c4a0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Just like we do for many other GNOME-hosted tarballs, use a
<pkg>_VERSION_MAJOR variable for network-manager.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/network-manager/network-manager.mk |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index b3715d8..261f2d3 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -3,9 +3,11 @@
 # NetworkManager
 #
 #############################################################
-NETWORK_MANAGER_VERSION = 0.9.2.0
+
+NETWORK_MANAGER_VERSION_MAJOR = 0.9
+NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).2.0
 NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.bz2
-NETWORK_MANAGER_SITE = http://ftp.gnome.org/pub/GNOME/sources/NetworkManager/0.9/
+NETWORK_MANAGER_SITE = http://ftp.gnome.org/pub/GNOME/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
 NETWORK_MANAGER_INSTALL_STAGING = YES
 NETWORK_MANAGER_DEPENDENCIES = host-pkgconf udev dbus-glib libnl gnutls \
 	libgcrypt wireless_tools util-linux host-intltool
