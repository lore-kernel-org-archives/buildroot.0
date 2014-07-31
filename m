From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Aug 2014 00:11:17 +0200
Subject: [Buildroot] [git commit] libdrm/intel: Explain dependency on xorg
	in Kconfig only for BR2_i386/BR2_x86_64
Message-ID: <20140731221130.11DE79D333@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2526d2f0d12bc77c67853a48ec6c381a3827d9c6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Suggested by Yann: http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/82731

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libdrm/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/libdrm/Config.in b/package/libdrm/Config.in
index 9acc908..a9c9171 100644
--- a/package/libdrm/Config.in
+++ b/package/libdrm/Config.in
@@ -27,6 +27,7 @@ config BR2_PACKAGE_LIBDRM_INTEL
 	  installs intel graphics driver
 
 comment "libdrm intel driver depends on X.org"
+	depends on BR2_i386 || BR2_x86_64
 	depends on !BR2_PACKAGE_XORG7
 
 config BR2_PACKAGE_LIBDRM_RADEON
