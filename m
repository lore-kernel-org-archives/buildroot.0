From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Mar 2017 14:56:43 +0100
Subject: [Buildroot] [git commit] openvpn: bump version to 2.4.1
Message-ID: <20170325135646.D59588229C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9ecbe727aa2e5a47bf23687c82afad806d882bb2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

--disable-eurephia configure option doesn't exist, so remove it.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/openvpn/openvpn.hash | 2 +-
 package/openvpn/openvpn.mk   | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
index 600c250..a03345e 100644
--- a/package/openvpn/openvpn.hash
+++ b/package/openvpn/openvpn.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 6f23ba49a1dbeb658f49c7ae17d9ea979de6d92c7357de3d55cd4525e1b2f87e  openvpn-2.4.0.tar.xz
+sha256 fde9e22c6df7a335d2d58c6a4d5967be76df173c766a5c51ece57fd044c76ee5  openvpn-2.4.1.tar.xz
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 5e3df59..a2e21f9 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENVPN_VERSION = 2.4.0
+OPENVPN_VERSION = 2.4.1
 OPENVPN_SOURCE = openvpn-$(OPENVPN_VERSION).tar.xz
 OPENVPN_SITE = http://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf openssl
@@ -22,8 +22,7 @@ OPENVPN_CONF_ENV = IFCONFIG=/sbin/ifconfig \
 ifeq ($(BR2_PACKAGE_OPENVPN_SMALL),y)
 OPENVPN_CONF_OPTS += \
 	--enable-small \
-	--disable-plugins \
-	--disable-eurephia
+	--disable-plugins
 endif
 
 # BusyBox 1.21+ places the ip applet in the "correct" place
