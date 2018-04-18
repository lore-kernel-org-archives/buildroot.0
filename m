From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 18 Apr 2018 17:14:29 +0200
Subject: [Buildroot] [git commit] pixiewps: add missing dependency on threads
Message-ID: <20180418151509.98CC4826D8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=56823d613cb232d6f9413d98aa5fdf3477f4e9ed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.net/results/0c8d0eeb693ac29739845f489caffc2f9fa3b262/

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pixiewps/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/pixiewps/Config.in b/package/pixiewps/Config.in
index 97240f5c87..05719f4211 100644
--- a/package/pixiewps/Config.in
+++ b/package/pixiewps/Config.in
@@ -1,7 +1,11 @@
 config BR2_PACKAGE_PIXIEWPS
 	bool "pixiewps"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Pixie WPS is a C based tool to audit networks against the so
 	  called "Pixie Dust" attack.
 
 	  https://github.com/wiire-a/pixiewps/wiki
+
+comment "pixiewps needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
