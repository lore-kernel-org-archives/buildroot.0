From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 Aug 2020 14:49:12 +0200
Subject: [Buildroot] [git commit branch/next] package/runc: drop
 <pkg>_WORKSPACE variable
Message-ID: <20200829124233.0702986CC9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=302bb3347cff943977042b0bf53194c797c9a41b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

With the go.mod integration, the <pkg>_WORKSPACE variable has become
useless, so drop it.

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
