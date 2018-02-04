From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Feb 2018 21:58:59 +0100
Subject: [Buildroot] [git commit] support/dockker: create and push tagged
 images
Message-ID: <20180204210102.CC49F88391@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a874fc151a3188721543110021e45de9af33b353
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, we refer to the latest version of the image, which means we
can't guarantee any reproducibility. Also, it measn we can't have a
separate images for the maintenance branches (especially the LTS) and
master.

Update the comment in the Dockerfile to create and push tagged images.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/docker/Dockerfile | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
index f18d195f37..474e073c61 100644
--- a/support/docker/Dockerfile
+++ b/support/docker/Dockerfile
@@ -1,7 +1,7 @@
 # This Dockerfile generates the docker image that gets used by Gitlab CI
-# To build it:
-#   sudo docker build -t buildroot/base support/docker
-#   sudo docker push buildroot/base
+# To build it (YYYYMMDD.HHMM is the current date and time in UTC):
+#   sudo docker build -t buildroot/base:YYYYMMDD.HHMM support/docker
+#   sudo docker push buildroot/base:YYYYMMDD.HHMM
 
 # We use a specific tag for the base image *and* the corresponding date
 # for the repository., so do not forget to update the apt-sources.list
