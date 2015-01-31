From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 31 Jan 2015 23:36:38 +0100
Subject: [Buildroot] [PATCH] package/benejson: disable for static-only builds
Message-ID: <1422743798-18921-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

benejson does not know how to build static-only libraries. as well,
it is not able to build shared-only libs either.

But if shared libs are possible, we can built static ones, so we just
disable benejson for static-only.

Fixes:
    http://autobuild.buildroot.org/results/56a/56a721885c890f3d62bf9e13d712767e66937c51/
    http://autobuild.buildroot.org/results/7c5/7c54dce4801a53bec378b422edfa42dfa990eabe/
    [...]

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/benejson/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/benejson/Config.in b/package/benejson/Config.in
index cb86d67..dc0081c 100644
--- a/package/benejson/Config.in
+++ b/package/benejson/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_BENEJSON
 	bool "benejson"
+	# bnejson does not know how to only build static libs
+	depends on !BR2_STATIC_LIBS
 	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  benejson is a buffering SAX-style JSON parser library.
-- 
1.9.1
