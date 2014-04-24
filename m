From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Apr 2014 22:29:55 +0200
Subject: [Buildroot] [git commit] pkg-cmake.mk: replace "echo -en" with
	printf
Message-ID: <20140424204218.263F69C9C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ea01826b90bbc2c4a35707058d9fd96bb700c525
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

printf is POSIX-compliant, echo -e is not.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-cmake.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
