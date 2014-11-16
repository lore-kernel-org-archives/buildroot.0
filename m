From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 17 Nov 2014 00:22:47 +0100
Subject: [Buildroot] [git commit] libunwind: fix comment dependencies
Message-ID: <20141116232647.9E6ACB59B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5a99682127b02f0d792390311956e977a2718fa2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Comment should be shown when no threads OR not uclibc-snapshot / glibc, not
AND.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libunwind/Config.in |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/libunwind/Config.in b/package/libunwind/Config.in
index 1e0e192..85cb472 100644
--- a/package/libunwind/Config.in
+++ b/package/libunwind/Config.in
@@ -12,5 +12,4 @@ config BR2_PACKAGE_LIBUNWIND
 comment "libunwind needs a uclibc snapshot or (e)glibc toolchain w/ threads"
 	depends on BR2_arm || BR2_armeb || BR2_mips || BR2_mipsel || BR2_mips64 || \
 		BR2_mips64el || BR2_powerpc || BR2_sh || BR2_sh64 || BR2_i386 || BR2_x86_64
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
-	depends on !(BR2_UCLIBC_VERSION_SNAPSHOT || BR2_TOOLCHAIN_USES_GLIBC)
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !(BR2_UCLIBC_VERSION_SNAPSHOT || BR2_TOOLCHAIN_USES_GLIBC)
