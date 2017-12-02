From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Dec 2017 14:16:57 +0100
Subject: [Buildroot] [git commit] .gitlab-ci.yml: extend check-package test
 to hash files
Message-ID: <20171202131022.977228221B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a59e4b0dd86eb8b4051d67b43b0386b4a1c03579
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that all issues in hash files have been fixed, let's try to make
sure we don't introduce new ones by checking regularly the hash files
issues in Gitlab CI.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .gitlab-ci.yml    | 2 +-
 .gitlab-ci.yml.in | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index a6540d1..dc7fd84 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -32,7 +32,7 @@ check-DEVELOPERS:
 
 check-package:
     script:
-        - find . -type f -name '*.mk' -exec ./utils/check-package {} +
+        - find . -type f \( -name '*.mk' -o -name '*.hash' \) -exec ./utils/check-package {} +
 
 .defconfig: &defconfig
     # Running the defconfigs for every push is too much, so limit to
diff --git a/.gitlab-ci.yml.in b/.gitlab-ci.yml.in
index 0d2e239..9a1e7a1 100644
--- a/.gitlab-ci.yml.in
+++ b/.gitlab-ci.yml.in
@@ -32,7 +32,7 @@ check-DEVELOPERS:
 
 check-package:
     script:
-        - find . -type f -name '*.mk' -exec ./utils/check-package {} +
+        - find . -type f \( -name '*.mk' -o -name '*.hash' \) -exec ./utils/check-package {} +
 
 .defconfig: &defconfig
     # Running the defconfigs for every push is too much, so limit to
