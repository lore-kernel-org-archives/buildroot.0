From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  8 Dec 2018 17:11:28 +0100
Subject: [Buildroot] [PATCH] gitlab-ci: store .config files as artefacts for
 defconfig tests
Message-ID: <20181208161128.20041-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add Buildroot's own .config file, as well as any package's .config file
(uclibc, linux, and busybox), for later inspection should a build fails,
notably due to changes in the kconfig-package infrastructure.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml    | 2 ++
 .gitlab-ci.yml.in | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 1a78211823..7dda71248f 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -57,10 +57,12 @@ check-package:
         when: always
         expire_in: 2 weeks
         paths:
+            - .config
             - build.log
             - output/images/
             - output/build/build-time.log
             - output/build/packages-file-list.txt
+            - output/*/.config
 
 .runtime_test: &runtime_test
     # Running the runtime tests for every push is too much, so limit to
diff --git a/.gitlab-ci.yml.in b/.gitlab-ci.yml.in
index ebca29ca1f..41a7589072 100644
--- a/.gitlab-ci.yml.in
+++ b/.gitlab-ci.yml.in
@@ -57,10 +57,12 @@ check-package:
         when: always
         expire_in: 2 weeks
         paths:
+            - .config
             - build.log
             - output/images/
             - output/build/build-time.log
             - output/build/packages-file-list.txt
+            - output/*/.config
 
 .runtime_test: &runtime_test
     # Running the runtime tests for every push is too much, so limit to
-- 
2.14.1
