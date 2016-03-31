From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Mar 2016 03:49:10 +0200
Subject: [Buildroot] [git commit] libwebsockets: add patch to fix musl build
Message-ID: <20160331015641.94A8B81D84@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=745b591d7e6a2d294ba32644d43f31ce3f570b70
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add patch from upstream [1] to fix musl build:
fatal error: sys/cdefs.h: No such file or directory

Fixes:
http://autobuild.buildroot.net/results/564/564675be0d4fbfa113a0f2e52874e0dce2d5ba5e/
http://autobuild.buildroot.net/results/c41/c41d87c0cf22f3b88e5f80ad6bf5e81900603c1d/

Backported from: 9eec5e4470397632af035c429295a41b74bd0585

[1] https://github.com/warmcat/libwebsockets/commit/9eec5e4470397632af035c429295a41b74bd0585

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libwebsockets/libwebsockets.hash | 1 +
 package/libwebsockets/libwebsockets.mk   | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/libwebsockets/libwebsockets.hash b/package/libwebsockets/libwebsockets.hash
index 7727ac5..745bc49 100644
--- a/package/libwebsockets/libwebsockets.hash
+++ b/package/libwebsockets/libwebsockets.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256  c6f3272d7e0234a9ef92b38622f36c4166eede4225e36fe4f78dd2ade03e9c52  libwebsockets-v1.7.3.tar.gz
+sha256  c7627d8e3d9d695b965a6c5fe30f4b4c04666984b384acd9e24c3b59cef13816  9eec5e4470397632af035c429295a41b74bd0585.patch
diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index 72bb280..395a2ed 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -11,6 +11,7 @@ LIBWEBSOCKETS_LICENSE_FILES = LICENSE
 LIBWEBSOCKETS_DEPENDENCIES = zlib
 LIBWEBSOCKETS_INSTALL_STAGING = YES
 LIBWEBSOCKETS_CONF_OPTS = -DLWS_WITHOUT_TESTAPPS=ON -DLWS_IPV6=ON
+LIBWEBSOCKETS_PATCH = https://github.com/warmcat/libwebsockets/commit/9eec5e4470397632af035c429295a41b74bd0585.patch
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIBWEBSOCKETS_DEPENDENCIES += openssl host-openssl
