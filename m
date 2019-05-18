From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 May 2019 23:07:09 +0200
Subject: [Buildroot] [git commit] package/openrc: add missing mmu and
 !static dependencies
Message-ID: <20190602201234.8540C81354@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a7314d842e4ea0610d313bbefe07c85af525cd61
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openrc/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/openrc/Config.in b/package/openrc/Config.in
index ec536c8692..84c58b20c3 100644
--- a/package/openrc/Config.in
+++ b/package/openrc/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_OPENRC
 	bool "openrc"
+	depends on BR2_USE_MMU # fork()
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_NCURSES
 	help
 	  Init that works on top of pid 1 (for example
@@ -16,3 +18,7 @@ config BR2_PACKAGE_OPENRC
 	  use them.
 
 	  https://github.com/OpenRC/openrc
+
+comment "openrc needs a toolchain w/ dynamic library"
+	depends on BR2_USE_MMU
+	depends on BR2_STATIC_LIBS
