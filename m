From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 May 2020 22:46:46 +0200
Subject: [Buildroot] [git commit] package/pigz: drop bogus select
 BR2_PACKAGE_HOST_ZLIB
Message-ID: <20200509203140.B6178912A6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cbdf7275da37223672d465c7ed260e217bcd7c1e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

BR2_PACKAGE_HOST_ZLIB does not exist, and should anyway not be
selected by the target pigz package.

Signed-off-by: Louis-Paul Cordier <lpdev@cordier.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pigz/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/pigz/Config.in b/package/pigz/Config.in
index a76146d8fc..af229060cf 100644
--- a/package/pigz/Config.in
+++ b/package/pigz/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_PIGZ
 	bool "pigz"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_ZLIB
-	select BR2_PACKAGE_HOST_ZLIB
 	help
 	  pigz, which stands for parallel implementation of gzip, is a
 	  fully functional replacement for gzip that exploits multiple
