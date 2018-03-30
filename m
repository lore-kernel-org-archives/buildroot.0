From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Fri, 30 Mar 2018 20:10:55 -0300
Subject: [Buildroot] [PATCH 1/1] .gitlab-ci.yml: use image with flake8
Message-ID: <20180330231055.26326-1-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump the docker image to the latest tag to have flake8 pre-installed.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
---
After this, please consider applying this patch, currently in Deferred state:
http://patchwork.ozlabs.org/patch/884978/ ".gitlab-ci.yml: check flake8"

With this patch and also the other patch mentioned above, here is the new job:
https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/60447043
which is part of a full build:
https://gitlab.com/RicardoMartincoski/buildroot/pipelines/19771580
---
 .gitlab-ci.yml    | 2 +-
 .gitlab-ci.yml.in | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 952fffaf88..2d9929ba11 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -4,7 +4,7 @@
 # It needs to be regenerated every time a defconfig is added, using
 # "make .gitlab-ci.yml".
 
-image: buildroot/base:20180205.0730
+image: buildroot/base:20180318.1724
 
 .defconfig_script: &defconfig_script
     - echo 'Configure Buildroot'
diff --git a/.gitlab-ci.yml.in b/.gitlab-ci.yml.in
index cb3eb715f2..c0e9563f2f 100644
--- a/.gitlab-ci.yml.in
+++ b/.gitlab-ci.yml.in
@@ -4,7 +4,7 @@
 # It needs to be regenerated every time a defconfig is added, using
 # "make .gitlab-ci.yml".
 
-image: buildroot/base:20180205.0730
+image: buildroot/base:20180318.1724
 
 .defconfig_script: &defconfig_script
     - echo 'Configure Buildroot'
-- 
2.14.1
