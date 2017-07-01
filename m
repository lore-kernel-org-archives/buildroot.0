From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Jul 2017 00:34:40 +0200
Subject: [Buildroot] [git commit] .gitlab-ci.yml: fix it again
Message-ID: <20170701223139.936B77F89F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=29ba13e57cefdf01a8598e409d4efb884fcfde1e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It seems the ! is removed by the yaml parser, so it needs to be quoted.
While we're at it, add some explanatory comment.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .gitlab-ci.yml    | 5 ++++-
 .gitlab-ci.yml.in | 5 ++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 6bd9837..eda8af4 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -35,8 +35,11 @@ check-gitlab-ci.yml:
         - diff -u .gitlab-ci.yml.orig .gitlab-ci.yml
 
 check-DEVELOPERS:
+    # get-developers should print just "No action specified"; if it prints
+    # anything else, it's a parse error.
+    # The initial ! is removed by YAML so we need to quote it.
     script:
-        - ! utils/get-developers | grep -v 'No action specified'
+        - "! utils/get-developers | grep -v 'No action specified'"
 
 .defconfig: &defconfig
     # Running the defconfigs for every push is too much, so limit to
diff --git a/.gitlab-ci.yml.in b/.gitlab-ci.yml.in
index 0855bff..24a1888 100644
--- a/.gitlab-ci.yml.in
+++ b/.gitlab-ci.yml.in
@@ -35,8 +35,11 @@ check-gitlab-ci.yml:
         - diff -u .gitlab-ci.yml.orig .gitlab-ci.yml
 
 check-DEVELOPERS:
+    # get-developers should print just "No action specified"; if it prints
+    # anything else, it's a parse error.
+    # The initial ! is removed by YAML so we need to quote it.
     script:
-        - ! utils/get-developers | grep -v 'No action specified'
+        - "! utils/get-developers | grep -v 'No action specified'"
 
 .defconfig: &defconfig
     # Running the defconfigs for every push is too much, so limit to
