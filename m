From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Nov 2019 09:44:09 +0100
Subject: [Buildroot] [git commit] package/musl: add an upstream URL to
 Config.in
Message-ID: <20191129090525.502388219D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=53698c9f81f2c0672215f6f9cb3d851a4be2f5fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add an upstream URL to the help text in Config.in. This
addresses the 'Missing' URL status in the package stats
web page output.

[Peter: also add URL to BR2_TOOLCHAIN_BUILDROOT_MUSL help]
Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/musl/Config.in                  | 2 ++
 toolchain/toolchain-buildroot/Config.in | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/package/musl/Config.in b/package/musl/Config.in
index 67e9e78a14..69da615b63 100644
--- a/package/musl/Config.in
+++ b/package/musl/Config.in
@@ -8,3 +8,5 @@ config BR2_PACKAGE_MUSL
 		&& !(BR2_i386 || BR2_powerpc)
 	# Compatibility headers: cdefs.h, queue.h
 	select BR2_PACKAGE_MUSL_COMPAT_HEADERS
+	help
+	  https://www.musl-libc.org/
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index c0612bf041..95d513004a 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -94,6 +94,8 @@ config BR2_TOOLCHAIN_BUILDROOT_MUSL
 	  This option selects musl as the C library for the
 	  cross-compilation toolchain.
 
+	  https://www.musl-libc.org/
+
 endchoice
 
 config BR2_TOOLCHAIN_BUILDROOT_LIBC
