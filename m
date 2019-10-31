From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 31 Oct 2019 13:17:02 +0100
Subject: [Buildroot] [PATCH 2/3] package/sysrepo: needs NPTL
In-Reply-To: <20191031121703.7628-1-fontaine.fabrice@gmail.com>
References: <20191031121703.7628-1-fontaine.fabrice@gmail.com>
Message-ID: <20191031121703.7628-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

sysrepo needs pthread_rwlock_timedrdlock

Fixes:
 - http://autobuild.buildroot.org/results/f0e4368977f257d76aedff335af3068deafaf28f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sysrepo/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sysrepo/Config.in b/package/sysrepo/Config.in
index 3ad6040858..8dc4b74003 100644
--- a/package/sysrepo/Config.in
+++ b/package/sysrepo/Config.in
@@ -28,8 +28,8 @@ config BR2_PACKAGE_SYSREPO_EXAMPLES
 
 endif
 
-comment "sysrepo needs a toolchain w/ C++, threads, dynamic library, gcc >= 4.8"
+comment "sysrepo needs a toolchain w/ C++, NPTL, dynamic library, gcc >= 4.8"
 	depends on BR2_USE_MMU
 	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP \
-		|| !BR2_TOOLCHAIN_HAS_THREADS
+		|| !BR2_TOOLCHAIN_HAS_NPTL
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-- 
2.23.0
