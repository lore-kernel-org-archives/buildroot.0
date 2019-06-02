From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 2 Jun 2019 09:37:20 +0200
Subject: [Buildroot] [git commit] package/mender-artifact: needs host-xz
Message-ID: <20190602201238.812ED811FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=852df15f317fed37c780e79a253907ee1241cad7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

host-xz (for lzma) is needed since version 3.0.0 and
https://github.com/mendersoftware/mender-artifact/commit/8f1b79b03fded3a923d948878905ac5fefe59893

Fixes:
 - http://autobuild.buildroot.org/results/c7cecf8946e9d4b4ae118b5f7597638c70decd3f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mender-artifact/mender-artifact.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mender-artifact/mender-artifact.mk b/package/mender-artifact/mender-artifact.mk
index 7ca8e7280f..f8b364166f 100644
--- a/package/mender-artifact/mender-artifact.mk
+++ b/package/mender-artifact/mender-artifact.mk
@@ -22,6 +22,7 @@ HOST_MENDER_ARTIFACT_LICENSE_FILES = \
 	vendor/github.com/stretchr/testify/LICENSE \
 	vendor/github.com/urfave/cli/LICENSE \
 	vendor/github.com/sirupsen/logrus/LICENSE
+HOST_MENDER_ARTIFACT_DEPENDENCIES = host-xz
 
 HOST_MENDER_ARTIFACT_LDFLAGS = -X main.Version=$(HOST_MENDER_ARTIFACT_VERSION)
 
