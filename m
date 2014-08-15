From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 16 Aug 2014 00:30:52 +0200
Subject: [Buildroot] [git commit] package/webkit: select cairo,
	since we select one of its options
Message-ID: <20140815223131.A90579D462@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a110e0c10e4836e497ca27ee965ccf28115b216b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When selecting an option of a package, that package must also be
selected, otherwise the package is not built.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/webkit/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/webkit/Config.in b/package/webkit/Config.in
index b7f903c..8cd1a36 100644
--- a/package/webkit/Config.in
+++ b/package/webkit/Config.in
@@ -17,6 +17,7 @@ config BR2_PACKAGE_WEBKIT
 	depends on BR2_PACKAGE_LIBGTK2
 	depends on BR2_PACKAGE_WEBKIT_ARCH_SUPPORTS
 	depends on !BR2_BINFMT_FLAT # icu
+	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PNG
 	select BR2_PACKAGE_ENCHANT
 	select BR2_PACKAGE_HARFBUZZ
