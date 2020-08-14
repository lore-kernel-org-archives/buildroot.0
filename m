From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 14 Aug 2020 23:08:34 +0200
Subject: [Buildroot] [git commit] support/docker: drop Python 2.x modules
Message-ID: <20200814210234.C3BBD81604@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=23f7fa874b63bbc0e999cf4e904c7d3f3a8d7904
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since commit 4a40d36f131890941c1e482eb5f28ebcd81cb7a3
("support/testing: switch to Python 3 only") our runtime testing
infrastructure is Python 3.x only.

Therefore, it is no longer needed to have python-nose2 and
python-pexpect in the Docker container used to run our Gitlab CI jobs.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/docker/Dockerfile | 2 --
 1 file changed, 2 deletions(-)

diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
index 8c555dcf7a..a9bacca3a0 100644
--- a/support/docker/Dockerfile
+++ b/support/docker/Dockerfile
@@ -36,8 +36,6 @@ RUN apt-get install -y --no-install-recommends \
         libncurses5-dev \
         locales \
         mercurial \
-        python-nose2 \
-        python-pexpect \
         python3 \
         python3-flake8 \
         python3-nose2 \
