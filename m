From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 5 Nov 2010 16:33:10 +0100
Subject: [Buildroot] [git commit master 1/1] slang: build system breaks with
	parallel builds
Message-ID: <20101105153337.93A768DBB3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=189c60ef8a2bac4b459016ba37b38ce8b8856991
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/slang/slang.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/slang/slang.mk b/package/slang/slang.mk
index f6e6eb1..74c800b 100644
--- a/package/slang/slang.mk
+++ b/package/slang/slang.mk
@@ -9,7 +9,7 @@ SLANG_SITE = http://www.uclibc.org/
 SLANG_INSTALL_STAGING = YES
 
 define SLANG_BUILD_CMDS
-	$(MAKE) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
+	$(MAKE1) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
 	LDFLAGS="$(TARGET_LDFLAGS)" -C $(@D)
 endef
 
-- 
1.7.1
