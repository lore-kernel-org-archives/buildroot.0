From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Sep 2015 21:58:37 +0200
Subject: [Buildroot] [git commit] znc: needs gcc >= 4.7
Message-ID: <20150901200659.4922F81E5A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=448cdcbbf9d74430581424b228fd239076e3866b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/aba/aba13674fb3624e0bd6a3b1e17f28883e298c8ca/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/znc/Config.in |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/znc/Config.in b/package/znc/Config.in
index 4328c8b..154d4b0 100644
--- a/package/znc/Config.in
+++ b/package/znc/Config.in
@@ -3,11 +3,13 @@ config BR2_PACKAGE_ZNC
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
 	help
 	  Advanced IRC bouncer
 
 	  http://www.znc.in
 
-comment "znc needs a toolchain w/ C++, dynamic library"
-	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS
+comment "znc needs a toolchain w/ C++, dynamic library, gcc >= 4.7"
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
 	depends on BR2_USE_MMU
