From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 12 Oct 2020 22:23:06 +0200
Subject: [Buildroot] [git commit] package/zlib: update architectures for
 zlib-ng
Message-ID: <20201012201207.53B2B86F34@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2007b7928007dbf5cecad05d5bb7a4422ceef085
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- powerpc is supported since
  https://github.com/zlib-ng/zlib-ng/commit/b81f4ee96dcbdf1db34b00727b6f1829a2ba1edb
- s390x is supported since
  https://github.com/zlib-ng/zlib-ng/commit/8e30d1173699412c11880db10de2bc10893a2448

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/zlib/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/zlib/Config.in b/package/zlib/Config.in
index 4c41ea9fe9..550c2efa93 100644
--- a/package/zlib/Config.in
+++ b/package/zlib/Config.in
@@ -3,6 +3,8 @@ config BR2_PACKAGE_ZLIB_NG_ARCH_SUPPORTS
 	default y if BR2_arm
 	default y if BR2_aarch64
 	default y if BR2_i386
+	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
+	default y if BR2_s390x
 	default y if BR2_x86_64
 
 config BR2_PACKAGE_ZLIB
