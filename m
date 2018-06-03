From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  3 Jun 2018 11:08:22 +0200
Subject: [Buildroot] [PATCH 5/5] support/docker: update to python3-flavoured
 flake8
In-Reply-To: <cover.1528016895.git.yann.morin.1998@free.fr>
References: <cover.1528016895.git.yann.morin.1998@free.fr>
Message-ID: <ed69b61801983e7f424b062eb586669b6d59a969.1528016895.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We are currently using python2-flavoured flake8, but the way to the
future is with python3. Besides, the python3-flavoured flake8 catches
more problems.

So, we leap into the future and switch to using python3's flake8.

Future, here we come! ;-)

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 .gitlab-ci.yml            | 2 +-
 .gitlab-ci.yml.in         | 2 +-
 support/docker/Dockerfile | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index e80491cdde..4e111b48bd 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -37,7 +37,7 @@ check-flake8:
         - find * -type f -print0 | xargs -0 file | grep 'Python script' | cut -d':' -f1 >> files.txt
         - sort -u files.txt | tee files.processed
     script:
-        - python -m flake8 --statistics --count $(cat files.processed)
+        - python3 -m flake8 --statistics --count $(cat files.processed)
     after_script:
         - wc -l files.processed
 
diff --git a/.gitlab-ci.yml.in b/.gitlab-ci.yml.in
index fb2650c5ce..bfe1eeccec 100644
--- a/.gitlab-ci.yml.in
+++ b/.gitlab-ci.yml.in
@@ -37,7 +37,7 @@ check-flake8:
         - find * -type f -print0 | xargs -0 file | grep 'Python script' | cut -d':' -f1 >> files.txt
         - sort -u files.txt | tee files.processed
     script:
-        - python -m flake8 --statistics --count $(cat files.processed)
+        - python3 -m flake8 --statistics --count $(cat files.processed)
     after_script:
         - wc -l files.processed
 
diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
index 8d40aeecdf..57c9ef78fa 100644
--- a/support/docker/Dockerfile
+++ b/support/docker/Dockerfile
@@ -29,13 +29,13 @@ RUN apt-get install -y --no-install-recommends \
         cpio \
         cvs \
         file \
+        flake8 \
         g++-multilib \
         git \
         libc6:i386 \
         libncurses5-dev \
         locales \
         mercurial \
-        python-flake8 \
         python-nose2 \
         python-pexpect \
         qemu-system-arm \
-- 
2.14.1
