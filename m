From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 10 Jun 2018 17:44:57 +0200
Subject: [Buildroot] [PATCH 1/2 v3] support/docker: sort the list of
 installed packages
In-Reply-To: <cover.1528645489.git.yann.morin.1998@free.fr>
References: <cover.1528645489.git.yann.morin.1998@free.fr>
Message-ID: <31dc2172ac9fba9527eec403868e3dc82c6f7ce8.1528645489.git.yann.morin.1998@free.fr>
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
Changes v2 -> v3:
  - don't mistakenly drop cmake  (Ricardo)

Changes v1 -> v2:
  - don't drop python-pip yet  (Ricardo)
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
 
-- 
2.14.1
