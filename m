From: Christian Stewart <christian@paral.in>
Date: Thu, 13 Aug 2020 14:32:20 -0700
Subject: [Buildroot] [PATCH v4 7/7] package/mender-artifact: fix go-module
 package build target
In-Reply-To: <20200813213220.260112-1-christian@paral.in>
References: <20200813213220.260112-1-christian@paral.in>
Message-ID: <20200813213220.260112-7-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/mender-artifact/mender-artifact.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mender-artifact/mender-artifact.mk b/package/mender-artifact/mender-artifact.mk
index c81ec9ba53..af78df0f61 100644
--- a/package/mender-artifact/mender-artifact.mk
+++ b/package/mender-artifact/mender-artifact.mk
@@ -33,7 +33,7 @@ HOST_MENDER_ARTIFACT_DEPENDENCIES = host-xz
 
 HOST_MENDER_ARTIFACT_LDFLAGS = -X main.Version=$(HOST_MENDER_ARTIFACT_VERSION)
 
-HOST_MENDER_ARTIFACT_BUILD_TARGETS = cli/mender-artifact
+HOST_MENDER_ARTIFACT_BUILD_TARGETS = github.com/mendersoftware/mender-artifact/cli/mender-artifact
 
 HOST_MENDER_ARTIFACT_BIN_NAME = mender-artifact
 HOST_MENDER_ARTIFACT_INSTALL_BINS = $(HOST_MENDER_ARTIFACT_BIN_NAME)
-- 
2.28.0
