From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 16 Jul 2018 20:35:52 +0200
Subject: [Buildroot] [PATCH 1/1] package/pulseaudio: bump version to 12.2
Message-ID: <20180716183552.5755-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes:
https://lists.freedesktop.org/archives/pulseaudio-discuss/2018-July/030280.html

Removed md5 and sha1 hashes, not provided by upstream anymore.
Added sha256 hash provided by upstream, removed locally computed sha256
hash.

Fixes
http://autobuild.buildroot.net/results/c8d/c8d3822ee34d0bbcba14eecc8524c8c865c85c1b/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/pulseaudio/pulseaudio.hash | 6 ++----
 package/pulseaudio/pulseaudio.mk   | 2 +-
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/pulseaudio/pulseaudio.hash b/package/pulseaudio/pulseaudio.hash
index 948f3aa684..7e1ea1606e 100644
--- a/package/pulseaudio/pulseaudio.hash
+++ b/package/pulseaudio/pulseaudio.hash
@@ -1,8 +1,6 @@
-# From https://lists.freedesktop.org/archives/pulseaudio-discuss/2018-July/030259.html
-md5 2511b7ce7193eecf029c91de96eee547  pulseaudio-12.1.tar.xz
-sha1 3d8ecff70b7b47d82fd8a262755ce24dd956bef1  pulseaudio-12.1.tar.xz
+# From https://lists.freedesktop.org/archives/pulseaudio-discuss/2018-July/030280.html
+sha256 809668ffc296043779c984f53461c2b3987a45b7a25eb2f0a1d11d9f23ba4055  pulseaudio-12.2.tar.xz
 # Locally computed
-sha256 5f5dfb5e2c376e8c974b80f93b983ed77088ade7fb8b9325a575c45aa35977f3  pulseaudio-12.1.tar.xz
 sha256 c38aee9e3c8c4d5d594ff548a1be05453023016d6286931f6512db215ec1fd42  GPL
 sha256 a9bdde5616ecdd1e980b44f360600ee8783b1f99b8cc83a2beb163a0a390e861  LGPL
 sha256 a1064b9838b6b4feee61eaeb0925da4b4834c984b77716558860c4294ed6c015  LICENSE
diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index 2b8f5724bc..d1c35654cf 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PULSEAUDIO_VERSION = 12.1
+PULSEAUDIO_VERSION = 12.2
 PULSEAUDIO_SOURCE = pulseaudio-$(PULSEAUDIO_VERSION).tar.xz
 PULSEAUDIO_SITE = http://freedesktop.org/software/pulseaudio/releases
 PULSEAUDIO_INSTALL_STAGING = YES
-- 
2.18.0
