From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Aug 2014 18:29:40 +0200
Subject: [Buildroot] [git commit] xbmc: add comment mmu depends
Message-ID: <20140804163002.E46AB9D1A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=21c24ae4336882d0cbe832626a898d880615d6bc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Otherwise it shows up indirectly when toolchain options aren't enough
and then vanishes when they are fulfilled.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xbmc/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/xbmc/Config.in b/package/xbmc/Config.in
index 6a00531..ebe0882 100644
--- a/package/xbmc/Config.in
+++ b/package/xbmc/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_XBMC_ARCH_SUPPORTS
 comment "xbmc needs a toolchain w/ C++, IPv6, largefile, threads, wchar"
 	depends on BR2_PACKAGE_XBMC_ARCH_SUPPORTS
 	depends on !BR2_INET_IPV6 || !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
+	depends on BR2_USE_MMU
 
 config BR2_PACKAGE_XBMC_EGL_GLES
 	bool
