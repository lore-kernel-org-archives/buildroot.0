From: Christian Stewart <christian@paral.in>
Date: Wed, 16 Dec 2020 00:00:09 -0800
Subject: [Buildroot] [PATCH 2/5] package/runc: fix version output ldflags
In-Reply-To: <20201216080013.547261-1-christian@paral.in>
References: <20201216080013.547261-1-christian@paral.in>
Message-ID: <20201216080013.547261-2-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix the ldflags specifying the version info for "version" command.

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Tian Yuanhao <tianyuanhao@aliyun.com>
---
 package/runc/runc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/runc/runc.mk b/package/runc/runc.mk
index 3d177d23d5..393bd7b22f 100644
--- a/package/runc/runc.mk
+++ b/package/runc/runc.mk
@@ -9,7 +9,7 @@ RUNC_SITE = $(call github,opencontainers,runc,v$(RUNC_VERSION))
 RUNC_LICENSE = Apache-2.0
 RUNC_LICENSE_FILES = LICENSE
 
-RUNC_LDFLAGS = -X main.gitCommit=$(RUNC_VERSION)
+RUNC_LDFLAGS = -X main.version=$(RUNC_VERSION)
 RUNC_TAGS = cgo static_build
 
 ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
-- 
2.28.0
