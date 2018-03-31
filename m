From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Fri, 30 Mar 2018 23:23:01 -0300
Subject: [Buildroot] [PATCH 36/36] .gitlab-ci.yml: extend check-package test
 to Config.* files
In-Reply-To: <20180331022301.27501-1-ricardo.martincoski@gmail.com>
References: <20180331022301.27501-1-ricardo.martincoski@gmail.com>
Message-ID: <20180331022301.27501-37-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that all issues in Config.in files have been fixed, let's try to
make sure we don't introduce new ones by checking regularly these files
issues in Gitlab CI.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 .gitlab-ci.yml    | 3 ++-
 .gitlab-ci.yml.in | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 952fffaf88..8489f8c45c 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -32,7 +32,8 @@ check-DEVELOPERS:
 
 check-package:
     script:
-        - find . -type f \( -name '*.mk' -o -name '*.hash' \) -exec ./utils/check-package {} +
+        - find . -type f \( -name '*.mk' -o -name '*.hash' -o -name 'Config.*' -o -name 'toolchain-common.in' \)
+            -exec ./utils/check-package {} +
 
 .defconfig: &defconfig
     # Running the defconfigs for every push is too much, so limit to
diff --git a/.gitlab-ci.yml.in b/.gitlab-ci.yml.in
index cb3eb715f2..578e13f532 100644
--- a/.gitlab-ci.yml.in
+++ b/.gitlab-ci.yml.in
@@ -32,7 +32,8 @@ check-DEVELOPERS:
 
 check-package:
     script:
-        - find . -type f \( -name '*.mk' -o -name '*.hash' \) -exec ./utils/check-package {} +
+        - find . -type f \( -name '*.mk' -o -name '*.hash' -o -name 'Config.*' -o -name 'toolchain-common.in' \)
+            -exec ./utils/check-package {} +
 
 .defconfig: &defconfig
     # Running the defconfigs for every push is too much, so limit to
-- 
2.14.1
