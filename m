From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 24 Apr 2014 00:48:20 +0200
Subject: [Buildroot] [PATCH 01/14] pkg-cmake.mk: replace "echo -en" with
	printf
In-Reply-To: <1398293313-17580-1-git-send-email-s.martin49@gmail.com>
References: <1398293313-17580-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1398293313-17580-2-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>

---
changes v1 -> v2
- new patch
---
 package/pkg-cmake.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index bf3db90..edda14a 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -160,7 +160,7 @@ host-cmake-package = $(call inner-cmake-package,host-$(pkgname),$(call UPPERCASE
 
 $(HOST_DIR)/usr/share/buildroot/toolchainfile.cmake:
 	@mkdir -p $(@D)
-	@echo -en "\
+	@printf "\
 	set(CMAKE_SYSTEM_NAME Linux)\n\
 	set(CMAKE_C_COMPILER $(TARGET_CC_NOCCACHE))\n\
 	set(CMAKE_CXX_COMPILER $(TARGET_CXX_NOCCACHE))\n\
-- 
1.9.2
