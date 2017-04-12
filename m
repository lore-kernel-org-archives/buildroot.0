From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Apr 2017 21:02:30 +0200
Subject: [Buildroot] [git commit] irssi: fix attributes ordering in Config.in
Message-ID: <20170412190236.2F68E7FF24@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=deafcccdd41094b92a5e20550ac187d9b691920f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

According to the Buildroot convention, 'depends on' attributes shall
come before 'select' ones in Kconfig files.

Detected by check-package.

Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/irssi/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/irssi/Config.in b/package/irssi/Config.in
index 2cdd06c..6361cff 100644
--- a/package/irssi/Config.in
+++ b/package/irssi/Config.in
@@ -1,11 +1,11 @@
 config BR2_PACKAGE_IRSSI
 	bool "irssi"
-	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_NCURSES
-	select BR2_PACKAGE_OPENSSL
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_OPENSSL
 	help
 	  Irssi is a terminal based IRC client for UNIX systems.
 
