From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 10:16:35 +0200
Subject: [Buildroot] [git commit] .gitlab-ci.yml: extend check-package test
 to Config.* files
Message-ID: <20180401081638.B821C827DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b757f9aca356824e47ce2de27deb91b1992c0313
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that all issues in Config.in files have been fixed, let's try to
make sure we don't introduce new ones by checking regularly these files
issues in Gitlab CI.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml    | 3 ++-
 .gitlab-ci.yml.in | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index fd1aeb3408..fcb53d6451 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -43,7 +43,8 @@ check-flake8:
 
 check-package:
     script:
-        - find . -type f \( -name '*.mk' -o -name '*.hash' \) -exec ./utils/check-package {} +
+        - find . -type f \( -name '*.mk' -o -name '*.hash' -o -name 'Config.*' \)
+            -exec ./utils/check-package {} +
 
 .defconfig: &defconfig
     # Running the defconfigs for every push is too much, so limit to
diff --git a/.gitlab-ci.yml.in b/.gitlab-ci.yml.in
index bffcb02be1..fb2650c5ce 100644
--- a/.gitlab-ci.yml.in
+++ b/.gitlab-ci.yml.in
@@ -43,7 +43,8 @@ check-flake8:
 
 check-package:
     script:
-        - find . -type f \( -name '*.mk' -o -name '*.hash' \) -exec ./utils/check-package {} +
+        - find . -type f \( -name '*.mk' -o -name '*.hash' -o -name 'Config.*' \)
+            -exec ./utils/check-package {} +
 
 .defconfig: &defconfig
     # Running the defconfigs for every push is too much, so limit to
