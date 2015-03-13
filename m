From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 13 Mar 2015 15:22:05 -0300
Subject: [Buildroot] [PATCH 06/15] package infra: drop non-lfs support
In-Reply-To: <1426270934-15499-1-git-send-email-gustavo@zacarias.com.ar>
References: <1426270934-15499-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1426270934-15499-7-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Makefile.in      | 7 -------
 package/pkg-autotools.mk | 1 -
 2 files changed, 8 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 803b162..fc57427 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -136,10 +136,7 @@ ifeq ($(BR2_DEBUG_3),y)
 TARGET_DEBUGGING = -g3
 endif
 
-ifeq ($(BR2_LARGEFILE),y)
 TARGET_CPPFLAGS += -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-endif
-
 TARGET_CFLAGS = $(TARGET_CPPFLAGS) $(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING)
 TARGET_CXXFLAGS = $(TARGET_CFLAGS)
 TARGET_LDFLAGS = $(call qstrip,$(BR2_TARGET_LDFLAGS))
@@ -373,10 +370,6 @@ else
 DISABLE_NLS :=--disable-nls
 endif
 
-ifneq ($(BR2_LARGEFILE),y)
-DISABLE_LARGEFILE = --disable-largefile
-endif
-
 ifeq ($(BR2_INET_IPV6),y)
 DISABLE_IPV6 = --enable-ipv6
 else
diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index d2f15fa..2ecf7d8 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -201,7 +201,6 @@ define $(2)_CONFIGURE_CMDS
 		--with-fop=no \
 		--disable-dependency-tracking \
 		$$(DISABLE_NLS) \
-		$$(DISABLE_LARGEFILE) \
 		$$(DISABLE_IPV6) \
 		$$(ENABLE_DEBUG) \
 		$$(SHARED_STATIC_LIBS_OPTS) \
-- 
2.0.5
