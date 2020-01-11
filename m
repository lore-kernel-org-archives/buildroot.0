From: Christian Stewart <christian@paral.in>
Date: Fri, 10 Jan 2020 20:13:51 -0800
Subject: [Buildroot] [PATCH v2 2/6] package/runc: remove unnecessary
 workspace identifier
In-Reply-To: <20200111041355.21705-1-christian@paral.in>
References: <20200111041355.21705-1-christian@paral.in>
Message-ID: <20200111041355.21705-2-christian@paral.in>
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
index acf61ab160..9a237aca38 100644
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
2.24.1
