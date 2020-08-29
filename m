From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 Aug 2020 14:49:12 +0200
Subject: [Buildroot] [git commit branch/next] package/mender-artifact: drop
 custom GOFLAGS
Message-ID: <20200829124233.33A7686CCF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=92584815bace88b0c0548d7ab7796854c92aaa99
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Now that we have switched to the go.mod integration, all Go packages
are built with -mod=vendor, so there's no need to have custom GOFLAGS
in mender-artifact.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mender-artifact/mender-artifact.mk | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/package/mender-artifact/mender-artifact.mk b/package/mender-artifact/mender-artifact.mk
index 67fdc44b9d..c81ec9ba53 100644
--- a/package/mender-artifact/mender-artifact.mk
+++ b/package/mender-artifact/mender-artifact.mk
@@ -31,14 +31,6 @@ HOST_MENDER_ARTIFACT_LICENSE_FILES = \
 
 HOST_MENDER_ARTIFACT_DEPENDENCIES = host-xz
 
-# By default, go will attempt to download needed modules before building, which
-# is not desirable. This behavior also causes permission issues when cleaning,
-# as go downloads modules as read-only by default. Because mender-artifact
-# includes the modules in the vendor directory, mod=vendor prevents the package
-# from downloading the go modules during the build process and prevents
-# permission issues when cleaning.
-HOST_MENDER_ARTIFACT_GO_ENV = GOFLAGS="-mod=vendor"
-
 HOST_MENDER_ARTIFACT_LDFLAGS = -X main.Version=$(HOST_MENDER_ARTIFACT_VERSION)
 
 HOST_MENDER_ARTIFACT_BUILD_TARGETS = cli/mender-artifact
