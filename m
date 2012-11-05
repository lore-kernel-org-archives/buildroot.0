From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 5 Nov 2012 09:07:26 +0100
Subject: [Buildroot] [git commit] auto{conf,
	make}: only make available on archs supported by qemu
Message-ID: <20121105081345.83CB799BE5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c65d92e8e2767b09aaee6b717cbd9b66f88ea39c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that we're using full perl (which needs qemu), only make auto{conf,make}
available on the supported archs.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/autoconf/Config.in |    4 ++++
 package/automake/Config.in |    4 ++++
 2 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/package/autoconf/Config.in b/package/autoconf/Config.in
index 5f2f148..c304572 100644
--- a/package/autoconf/Config.in
+++ b/package/autoconf/Config.in
@@ -1,8 +1,12 @@
 config BR2_PACKAGE_AUTOCONF
 	bool "autoconf"
+	depends on !(BR2_avr32 || BR2_bfin || BR2_sh2 || BR2_sh2a || BR2_sh3 || BR2_sh3eb || BR2_sh64)
 	select BR2_PACKAGE_PERL
 	help
 	  Extensible program for developing configure scripts.  These
 	  scripts handle all the mundane system/feature detection.
 
 	  http://www.gnu.org/software/autoconf/
+
+comment "autoconf requires an architecture supported by qemu"
+	depends on BR2_avr32 || BR2_bfin || BR2_sh2 || BR2_sh2a || BR2_sh3 || BR2_sh3eb || BR2_sh64
diff --git a/package/automake/Config.in b/package/automake/Config.in
index 9a9673a..f8d74ef 100644
--- a/package/automake/Config.in
+++ b/package/automake/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_AUTOMAKE
 	bool "automake"
+	depends on !(BR2_avr32 || BR2_bfin || BR2_sh2 || BR2_sh2a || BR2_sh3 || BR2_sh3eb || BR2_sh64)
 	select BR2_PACKAGE_AUTOCONF
 	select BR2_PACKAGE_PERL
 	help
@@ -7,3 +8,6 @@ config BR2_PACKAGE_AUTOMAKE
 	  configure scripts (made by autoconf).
 
 	  http://www.gnu.org/software/automake/
+
+comment "automake requires an architecture supported by qemu"
+	depends on BR2_avr32 || BR2_bfin || BR2_sh2 || BR2_sh2a || BR2_sh3 || BR2_sh3eb || BR2_sh64
