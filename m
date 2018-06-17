From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Jun 2018 20:53:53 +0200
Subject: [Buildroot] [git commit] support/docker: sort the list of installed
 packages
Message-ID: <20180617185137.20B7F8156F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=afc1ec707384dabd0d63d316c117f45ee8976356
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As suggested in the docker best practices [0], order the package list
alphabetically, and list only one package per line.

This will be much usefull later, we need to update the list of installed
packages, like adding new ones for example.

[0] https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#sort-multi-line-arguments

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/docker/Dockerfile | 29 +++++++++++++++++++++++------
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
index 8c525f7cf1..bebd861dc1 100644
--- a/support/docker/Dockerfile
+++ b/support/docker/Dockerfile
@@ -22,13 +22,30 @@ COPY apt-sources.list /etc/apt/sources.list
 RUN dpkg --add-architecture i386 && \
     apt-get update -y
 RUN apt-get install -y --no-install-recommends \
-        build-essential cmake libc6:i386 g++-multilib \
-        bc ca-certificates file locales rsync \
-        cvs bzr git mercurial subversion wget \
-        cpio unzip \
+        bc \
+        build-essential \
+        bzr \
+        ca-certificates \
+        cmake \
+        cpio \
+        cvs \
+        file \
+        g++-multilib \
+        git \
+        libc6:i386 \
         libncurses5-dev \
-        python-nose2 python-pexpect qemu-system-arm qemu-system-x86 \
-        python-pip && \
+        locales \
+        mercurial \
+        python-nose2 \
+        python-pexpect \
+        python-pip \
+        qemu-system-arm \
+        qemu-system-x86 \
+        rsync \
+        subversion \
+        unzip \
+        wget \
+        && \
     apt-get -y autoremove && \
     apt-get -y clean
 
