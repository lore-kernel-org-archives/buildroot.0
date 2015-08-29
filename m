From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Aug 2015 23:20:04 +0200
Subject: [Buildroot] [git commit] package/tvheadend: needs dynamic libraries
Message-ID: <20150829212009.CA9168075A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ec9fc5a2c0acef4c462375b98ffbfe9995442d38
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/f1c/f1c40ac9dda5ceeb5665d021333058eb29828d62/
http://autobuild.buildroot.net/results/bd0/bd0e8619df7cd8f21da96ae470691b1ebb2f156c/
http://autobuild.buildroot.net/results/f1c/f1c40ac9dda5ceeb5665d021333058eb29828d62/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tvheadend/Config.in |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/tvheadend/Config.in b/package/tvheadend/Config.in
index 4edf014..bfc156a 100644
--- a/package/tvheadend/Config.in
+++ b/package/tvheadend/Config.in
@@ -1,8 +1,10 @@
-comment "tvheadend needs a toolchain w/ NPTL, headers >= 3.2"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
+comment "tvheadend needs a toolchain w/ NPTL, headers >= 3.2, dynamic library"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2 || BR2_STATIC_LIBS
 
 config BR2_PACKAGE_TVHEADEND
 	bool "tvheadend"
+	depends on !BR2_STATIC_LIBS # dladdr()
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
 	select BR2_PACKAGE_DTV_SCAN_TABLES
