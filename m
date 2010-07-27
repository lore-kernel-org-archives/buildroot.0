From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Jul 2010 23:01:29 +0200
Subject: [Buildroot] [git commit master 1/1] icu: add quotes around
	TARGET_CXX
Message-ID: <20100727210246.8D90C835A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=8a1468be5b0c6638ce6da8b41ae3a6c3ca788575
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that TARGET_CXX contains a --sysroot= option and therefore spaces,
it needs to be used with quotes.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/icu/icu.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/icu/icu.mk b/package/icu/icu.mk
index 17f153e..7961b07 100644
--- a/package/icu/icu.mk
+++ b/package/icu/icu.mk
@@ -33,7 +33,7 @@ $(ICU_DIR)/.configured: $(ICU_HOST_DIR)/.configured
 	(cd $(ICU_DIR); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
-		CXX=$(TARGET_CXX) \
+		CXX="$(TARGET_CXX)" \
 		./configure $(QUIET) \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
-- 
1.7.1
