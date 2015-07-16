From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Fri, 17 Jul 2015 00:45:06 +0200
Subject: [Buildroot] [PATCH 1/1] package/upmpdcli: disable for PowerPC CS
	toolchains
Message-ID: <1437086706-20437-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Those toolchains use gcc <= 4.5, which is too old as they are missing to
construct an empty std::shared_ptr with a nullptr (0) as an argument. This
is only introduced with gcc-4.6.

Fixes:
http://autobuild.buildroot.net/results/faf/faf1b071c0a5bd8395d79abf2e6a32169ad7f136
http://autobuild.buildroot.net/results/247/247b3f1ac3d3a9712e9410eef298fce8d885f92c
http://autobuild.buildroot.net/results/de6/de601c4d4dd7922895892d78d3a37902fb98c7be
http://autobuild.buildroot.net/results/a4d/a4d7bf9863c134f59d285616b9c1f78201bd1a3e

and many more.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/upmpdcli/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/upmpdcli/Config.in b/package/upmpdcli/Config.in
index 6464d06..0fe3d10 100644
--- a/package/upmpdcli/Config.in
+++ b/package/upmpdcli/Config.in
@@ -7,6 +7,8 @@ config BR2_PACKAGE_UPMPDCLI
 	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1 # Too old gcc
 	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1 # Ditto
 	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 # Ditto
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103 # Ditto
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009 # Ditto
 	# libupnpp triggers the _gp link issue
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
@@ -21,6 +23,8 @@ comment "upmpdcli needs a toolchain w/ C++, threads"
 	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1 # Too old gcc
 	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1 # Ditto
 	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 # Ditto
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103 # Ditto
+	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009 # Ditto
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
 	depends on !BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201405
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.4.6
