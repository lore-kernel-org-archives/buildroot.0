From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 May 2017 15:57:45 +0200
Subject: [Buildroot] [git commit] libseccomp: enable on ARM
Message-ID: <20170507140348.11635818C0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bd2c2329c534dd45d2b269c26fb630aaa761b1d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libseccomp can now be used on ARM, so allow it to be selected.

Fixes bug #9806.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libseccomp/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libseccomp/Config.in b/package/libseccomp/Config.in
index 35317ad..559beda 100644
--- a/package/libseccomp/Config.in
+++ b/package/libseccomp/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS
 	bool
 	default y if BR2_aarch64
+	default y if BR2_arm || BR2_armeb
 	default y if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	default y if BR2_i386 || BR2_x86_64
 	default y if BR2_powerpc64 || BR2_powerpc
