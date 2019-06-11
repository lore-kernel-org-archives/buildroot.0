From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 11 Jun 2019 22:45:03 +0200
Subject: [Buildroot] [git commit] package/freeswitch: add optional support
 for libopenh264
Message-ID: <20190611204943.EF4F588F8D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f969712a988c70522e336675b3d0f6ce0412ca73
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freeswitch/freeswitch.hash | 1 +
 package/freeswitch/freeswitch.mk   | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/package/freeswitch/freeswitch.hash b/package/freeswitch/freeswitch.hash
index 1c5de7bcc5..d80934d436 100644
--- a/package/freeswitch/freeswitch.hash
+++ b/package/freeswitch/freeswitch.hash
@@ -6,6 +6,7 @@ sha1 c6eb7de942a61604774ca08ac8070244b7c3167a freeswitch-1.8.6.tar.xz
 sha256 b87f47e57d13de2b901bd1e4eb85491178e59a159a2831d7430abe7947f0d3a4 freeswitch-1.8.6.tar.xz
 # Locally computed
 sha256 75c933202f40939cdc3827fce20a1efdaa38291e2b5a65d234eb16e2cffda66a  COPYING
+sha256 c3e3388768dae8bf4edcc4108f95be815b8a05c0b0aef6e4c3d8df81affdfa34  docs/OPENH264_BINARY_LICENSE.txt
 sha256 e8e26b16da14aa3e6ed5c22c705fdc1f45d6225fca461ea9f7314bcdfdc414c4  libs/apr/LICENSE
 sha256 1eefb2ea1db0af7729a9d8a27d7c65d8a37ab185393f935b029aac6828ce315a  libs/apr-util/LICENSE
 sha256 8267348d5af1262c11d1a08de2f5afc77457755f1ac658627dd9acf71011d615  libs/libvpx/LICENSE
diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index 8c0c7fb118..1c49b8d814 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -220,6 +220,13 @@ FREESWITCH_DEPENDENCIES += libmemcached
 FREESWITCH_ENABLED_MODULES += applications/mod_memcache
 endif
 
+ifeq ($(BR2_PACKAGE_LIBOPENH264),y)
+FREESWITCH_LICENSE := $(FREESWITCH_LICENSE), BSD-2-Clause (libopenh264)
+FREESWITCH_LICENSE_FILES += docs/OPENH264_BINARY_LICENSE.txt
+FREESWITCH_DEPENDENCIES += libopenh264
+FREESWITCH_ENABLED_MODULES += codecs/mod_openh264
+endif
+
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
 FREESWITCH_DEPENDENCIES += libpng
 FREESWITCH_ENABLED_MODULES += formats/mod_png
