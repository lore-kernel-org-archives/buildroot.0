From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 5 Jan 2021 17:34:08 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/runc: fix version
 output ldflags
Message-ID: <20210105162037.60ED286370@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=21057834da127654b61b7f558fafff28c7f62d61
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

Fix the ldflags specifying the version info for "version" command.

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9e12516f2aea1f2bc858ac16873a5ccfaeac752b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
