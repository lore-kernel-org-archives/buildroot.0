From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 1 Mar 2013 16:11:13 +0100
Subject: [Buildroot] [git commit] libeXosip2: needs mmu
Message-ID: <20130301151432.444229A526@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dd3abd75cb0a71152e457f4d6ec3ffe4e16f80f7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/24ecad26f908a74de8335f1852117d3eda0c2110/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libeXosip2/Config.in |    1 +
 package/linphone/Config.in   |    1 +
 2 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libeXosip2/Config.in b/package/libeXosip2/Config.in
index 755d284..3fe9c96 100644
--- a/package/libeXosip2/Config.in
+++ b/package/libeXosip2/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBEXOSIP2
 	bool "libeXosip2"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBOSIP2
 	help
 	  eXosip is a library that hides the complexity of using the
diff --git a/package/linphone/Config.in b/package/linphone/Config.in
index a2866a6..bd51412 100644
--- a/package/linphone/Config.in
+++ b/package/linphone/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_LINPHONE
 	select BR2_PACKAGE_MEDIASTREAMER
 	depends on BR2_INSTALL_LIBSTDCPP # mediastreamer
 	depends on BR2_TOOLCHAIN_HAS_THREADS # ortp
+	depends on BR2_USE_MMU # libeXosip2
 	help
 	  Linphone is an internet phone or Voice Over IP phone (VoIP).
 
