From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Apr 2015 00:18:34 +0200
Subject: [Buildroot] [git commit] wine: more hostarch
Message-ID: <20150403221841.912B881774@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=43e7aab08382e641c3197a0beed9cae375b52c78
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The tools from host-wine build on those architectures.

Signed-off-by: Andr?? Hentschel <nerv@dawncrow.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/wine/Config.in |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/wine/Config.in b/package/wine/Config.in
index 26de143..d1510e1 100644
--- a/package/wine/Config.in
+++ b/package/wine/Config.in
@@ -2,7 +2,9 @@ config BR2_PACKAGE_WINE
 	bool "wine"
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	# Wine only builds on certain architectures
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86" || \
+	           BR2_HOSTARCH = "powerpc" || BR2_HOSTARCH = "arm" || \
+	           BR2_HOSTARCH = "aarch64"
 	# Wine has much CPU specific code and mostly makes sense on x86
 	depends on BR2_i386
 	help
