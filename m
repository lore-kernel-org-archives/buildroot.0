From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 9 Dec 2018 17:31:13 +0100
Subject: [Buildroot] [git commit] .gitlab-ci.yml: store .config files as
 artefacts for defconfig tests
Message-ID: <20181209162758.3472686AC8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d163ba497ccfd9bb094668bf48d69cf2f1b1cd17
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add Buildroot's own .config file, as well as any package's .config file
(uclibc, linux, and busybox), for later inspection should a build fails,
notably due to changes in the kconfig-package infrastructure.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml    | 2 ++
 .gitlab-ci.yml.in | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 1a78211823..9e2b111f53 100644
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
+            - output/build/*/.config
 
 .runtime_test: &runtime_test
     # Running the runtime tests for every push is too much, so limit to
diff --git a/.gitlab-ci.yml.in b/.gitlab-ci.yml.in
index ebca29ca1f..d5eab91c70 100644
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
+            - output/build/*/.config
 
 .runtime_test: &runtime_test
     # Running the runtime tests for every push is too much, so limit to
