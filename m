From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 May 2013 00:08:29 +0200
Subject: [Buildroot] [PATCH 19/20] network-manager: use a
	<pkg>_VERSION_MAJOR variable
In-Reply-To: <1369606110-8088-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1369606110-8088-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1369606110-8088-20-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Just like we do for many other GNOME-hosted tarballs, use a
<pkg>_VERSION_MAJOR variable for network-manager.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/network-manager/network-manager.mk |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

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
-- 
1.7.9.5
