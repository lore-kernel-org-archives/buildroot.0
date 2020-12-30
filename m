From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 30 Dec 2020 09:27:21 +0100
Subject: [Buildroot] [git commit] package/runc: fix version output ldflags
Message-ID: <20201230081009.C41D28230F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9e12516f2aea1f2bc858ac16873a5ccfaeac752b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the ldflags specifying the version info for "version" command.

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/runc/runc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/runc/runc.mk b/package/runc/runc.mk
index c559244e83..45fe1442ad 100644
--- a/package/runc/runc.mk
+++ b/package/runc/runc.mk
@@ -9,7 +9,7 @@ RUNC_SITE = $(call github,opencontainers,runc,v$(RUNC_VERSION))
 RUNC_LICENSE = Apache-2.0
 RUNC_LICENSE_FILES = LICENSE
 
-RUNC_LDFLAGS = -X main.gitCommit=$(RUNC_VERSION)
+RUNC_LDFLAGS = -X main.version=$(RUNC_VERSION)
 RUNC_TAGS = cgo static_build
 
 ifeq ($(BR2_PACKAGE_LIBAPPARMOR),y)
