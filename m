From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 16 Mar 2021 21:06:11 +0100
Subject: [Buildroot] [git commit] package/siproxd: needs threads
Message-ID: <20210316194241.25ADA88132@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4865cc2e4e3982424f3fac84fe752e23f094cd28
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

siproxd which has been added with commit
3efc5a250c1c98598ba4c91a7d71d11343d937ab unconditionally uses pthread

Fixes:
 - http://autobuild.buildroot.org/results/828448fff87772e1c34b3696284a44eb9fc692fb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Acked-by: Alexander Dahl <post@lespocky.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/siproxd/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/siproxd/Config.in b/package/siproxd/Config.in
index 0a471553e4..e73a33bf14 100644
--- a/package/siproxd/Config.in
+++ b/package/siproxd/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_SIPROXD
 	bool "siproxd"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LIBOSIP2
 	select BR2_PACKAGE_LIBTOOL
 	select BR2_PACKAGE_SQLITE
@@ -15,3 +16,6 @@ config BR2_PACKAGE_SIPROXD
 	  masquerading firewall or NAT router.
 
 	  http://siproxd.sourceforge.net/
+
+comment "siproxd needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
