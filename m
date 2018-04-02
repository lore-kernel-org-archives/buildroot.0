From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 2 Apr 2018 11:27:41 +0200
Subject: [Buildroot] [git commit] package/openvpn: bump version to 2.4.5
Message-ID: <20180402093400.14AA481354@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7e7caee21ef08c98c0e4acd8b720a1545f474a69
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: https://community.openvpn.net/openvpn/wiki/ChangesInOpenvpn24

This bump depends on libressl 2.7.2 to avoid a build error with this
defconfig:

BR2_PACKAGE_LIBRESSL=y
BR2_PACKAGE_OPENVPN=y

Added license hash.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openvpn/openvpn.hash | 3 ++-
 package/openvpn/openvpn.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/openvpn/openvpn.hash b/package/openvpn/openvpn.hash
index 318f9edb88..079595d440 100644
--- a/package/openvpn/openvpn.hash
+++ b/package/openvpn/openvpn.hash
@@ -1,2 +1,3 @@
 # Locally calculated after checking signature
-sha256 96cd1b8fe1e8cb2920f07c3fd3985faea756e16fdeebd11d3e146d5bd2b04a80  openvpn-2.4.4.tar.xz
+sha256 43c0a363a332350f620d1cd93bb431e082bedbc93d4fb872f758650d53c1d29e  openvpn-2.4.5.tar.xz
+sha256 1fcb78d7e478bb8a9408010bdc91b36e213b1facfad093df3f7ce7e28af19043  COPYRIGHT.GPL
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index 086f99bf4d..fbe65ad863 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENVPN_VERSION = 2.4.4
+OPENVPN_VERSION = 2.4.5
 OPENVPN_SOURCE = openvpn-$(OPENVPN_VERSION).tar.xz
 OPENVPN_SITE = http://swupdate.openvpn.net/community/releases
 OPENVPN_DEPENDENCIES = host-pkgconf openssl
