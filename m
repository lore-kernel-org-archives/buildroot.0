From: Christian Stewart <christian@paral.in>
Date: Thu, 13 Aug 2020 14:32:15 -0700
Subject: [Buildroot] [PATCH v4 2/7] package/runc: remove unnecessary
 workspace identifier
In-Reply-To: <20200813213220.260112-1-christian@paral.in>
References: <20200813213220.260112-1-christian@paral.in>
Message-ID: <20200813213220.260112-2-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/runc/runc.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/runc/runc.mk b/package/runc/runc.mk
index 4c2f84ab16..aedfb5ef9e 100644
--- a/package/runc/runc.mk
+++ b/package/runc/runc.mk
@@ -9,10 +9,7 @@ RUNC_SITE = $(call github,opencontainers,runc,v$(RUNC_VERSION))
 RUNC_LICENSE = Apache-2.0
 RUNC_LICENSE_FILES = LICENSE
 
-RUNC_WORKSPACE = Godeps/_workspace
-
 RUNC_LDFLAGS = -X main.gitCommit=$(RUNC_VERSION)
-
 RUNC_TAGS = cgo static_build
 
 ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
-- 
2.28.0
