From: Romain Naour <romain.naour@openwide.fr>
Date: Sat,  8 Aug 2015 00:47:19 +0200
Subject: [Buildroot] [PATCH 7/7] package/wvstreams: disable for musl
	toolchains
In-Reply-To: <1438987639-30593-1-git-send-email-romain.naour@openwide.fr>
References: <1438987639-30593-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1438987639-30593-7-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The project seems not maintained anymore since there
is no commit since 2011:
https://github.com/wlach/wvstreams

So, let's mark it as not available for musl toolchains,
until someone interested enough fixes it.

Fixes:
xplc/modulemgr.cc: In member function ?virtual IServiceHandler* ModuleManagerFactory::createModuleManager(const char*)?:
xplc/modulemgr.cc:90:14: error: ?PATH_MAX? was not declared in this scope
   char fname[PATH_MAX];

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/wvstreams/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/wvstreams/Config.in b/package/wvstreams/Config.in
index 0cbe60a..cc1481a 100644
--- a/package/wvstreams/Config.in
+++ b/package/wvstreams/Config.in
@@ -3,6 +3,8 @@ config BR2_PACKAGE_WVSTREAMS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_MMU # fork()
+        # musl not supported and no upstream activity since 2011.
+	depends on !BR2_TOOLCHAIN_USES_MUSL
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
 	help
-- 
2.4.3
