From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 16 Dec 2012 10:49:01 +0100
Subject: [Buildroot] [git commit] openssl: fix static build
Message-ID: <20121216095023.9F79A9A1B0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a3671a3f2583c71871a2ac4fdf36b02c5bbdc558
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Just use the default target instead of hardcoding shared library support.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/openssl/openssl.mk |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index 160df2e..ed52577 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -76,8 +76,7 @@ define OPENSSL_CONFIGURE_CMDS
 endef
 
 define OPENSSL_BUILD_CMDS
-	$(MAKE1) -C $(@D) all build-shared
-	$(MAKE1) -C $(@D) do_linux-shared
+	$(MAKE1) -C $(@D)
 endef
 
 define OPENSSL_INSTALL_STAGING_CMDS
