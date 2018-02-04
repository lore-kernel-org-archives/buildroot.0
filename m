From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Feb 2018 21:57:37 +0100
Subject: [Buildroot] [git commit] support/docker: use a known base
 distribution
Message-ID: <20180204210102.B085288391@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3c24b8bd401df6605661fdc83805c363eb0114d0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, we are using debian:stable, which is subject to change with
time, as new stable versions of Debian are released/updated.

Use the latest tagged stable release, stretch-20171210 as of today, as
the base distribution to use.

This will ease reproducible builds in the future.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/docker/Dockerfile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
index aa2b38fcc9..49b74b88bd 100644
--- a/support/docker/Dockerfile
+++ b/support/docker/Dockerfile
@@ -3,7 +3,7 @@
 #   sudo docker build -t buildroot/base support/docker
 #   sudo docker push buildroot/base
 
-FROM debian:stable
+FROM debian:stretch-20171210
 LABEL maintainer="Buildroot mailing list <buildroot@buildroot.org>" \
       vendor="Buildroot" \
 description="Container with everything needed to run Buildroot"
