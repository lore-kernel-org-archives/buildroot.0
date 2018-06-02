From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  3 Jun 2018 00:19:32 +0200
Subject: [Buildroot] [PATCH 2/4] support/docker: sort the list of installed
 packages
In-Reply-To: <cover.1527977964.git.yann.morin.1998@free.fr>
References: <cover.1527977964.git.yann.morin.1998@free.fr>
Message-ID: <ed5028f2849286aef3ec10937f4fe7d03a2137b8.1527977964.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As suggested in the docker best practices [0], order the package list
alphabetically, and list only one package per line.

This will be much usefull later, we need to update the list of installed
packages, like adding new ones for example.

[0] https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#sort-multi-line-arguments

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 support/docker/Dockerfile | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
index 8c525f7cf1..4f08a54f06 100644
--- a/support/docker/Dockerfile
+++ b/support/docker/Dockerfile
@@ -22,13 +22,28 @@ COPY apt-sources.list /etc/apt/sources.list
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
+        qemu-system-arm \
+        qemu-system-x86 \
+        rsync \
+        subversion \
+        unzip \
+        wget \
+        && \
     apt-get -y autoremove && \
     apt-get -y clean
 
-- 
2.14.1
