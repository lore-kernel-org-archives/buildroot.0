From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  4 Feb 2018 15:44:26 +0100
Subject: [Buildroot] [PATCH 5/5] support/dockker: create and push tagged
 images
In-Reply-To: <cover.1517755438.git.yann.morin.1998@free.fr>
References: <cover.1517755438.git.yann.morin.1998@free.fr>
Message-ID: <c7619a7bdc91c8c2cb9d486859ddad8a8e89e78a.1517755438.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, we refer to the latest version of the image, which means we
can't guarantee any reproducibility. Also, it measn we can't have a
separate images for the maintenance branches (especially the LTS) and
master.

Update the comment in the Dockerfile to create and push tagged images.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Peter Korsgaard <peter@korsgaard.com>

---
Note: once this is applied, we can push such a tagged image and then
update our .gitlab-ci.yml accordingly.
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
-- 
2.14.1
