From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 5 Jan 2021 17:35:06 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/runc: fix version
 output ldflags
Message-ID: <20210105162033.5252C86370@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a6f2516c58c81cde23c512247dc99373afb95b2e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Fix the ldflags specifying the version info for "version" command.

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9e12516f2aea1f2bc858ac16873a5ccfaeac752b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/runc/runc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/runc/runc.mk b/package/runc/runc.mk
index 1c2fee067e..4a701d81a0 100644
--- a/package/runc/runc.mk
+++ b/package/runc/runc.mk
@@ -11,7 +11,7 @@ RUNC_LICENSE_FILES = LICENSE
 
 RUNC_WORKSPACE = Godeps/_workspace
 
-RUNC_LDFLAGS = -X main.gitCommit=$(RUNC_VERSION)
+RUNC_LDFLAGS = -X main.version=$(RUNC_VERSION)
 
 RUNC_TAGS = cgo static_build
 
