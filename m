From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 20:24:10 +0100
Subject: [Buildroot] [git commit] support/docker: add python3
Message-ID: <20191027191741.7B5298A4FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8b44338ec5c290b9b4ed2e1acb4377fbdd6375e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The test infra will soon be converted to Python 3 only.
So add the interpreter and also the Python 3 variant of modules nose2
and pexpect to the docker image used to run runtime tests.

Keep the Python 2 variant of those modules to allow a gradual
transition.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Nicolas Carrier <nicolas.carrier@orolia.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/docker/Dockerfile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
index 36cd3b28a4..03acde85d2 100644
--- a/support/docker/Dockerfile
+++ b/support/docker/Dockerfile
@@ -39,6 +39,9 @@ RUN apt-get install -y --no-install-recommends \
         python-flake8 \
         python-nose2 \
         python-pexpect \
+        python3 \
+        python3-nose2 \
+        python3-pexpect \
         qemu-system-arm \
         qemu-system-x86 \
         rsync \
