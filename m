From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Dec 2017 23:00:02 +0100
Subject: [Buildroot] [git commit] gitlab-ci: run check-package
Message-ID: <20171201215250.251AD7F9DD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b58059ad98984382934320235ce89faf0549062f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .gitlab-ci.yml    | 4 ++++
 .gitlab-ci.yml.in | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index c34d2f7..a6540d1 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -30,6 +30,10 @@ check-DEVELOPERS:
     script:
         - "! utils/get-developers | grep -v 'No action specified'"
 
+check-package:
+    script:
+        - find . -type f -name '*.mk' -exec ./utils/check-package {} +
+
 .defconfig: &defconfig
     # Running the defconfigs for every push is too much, so limit to
     # explicit triggers through the API.
diff --git a/.gitlab-ci.yml.in b/.gitlab-ci.yml.in
index 33c7b13..0d2e239 100644
--- a/.gitlab-ci.yml.in
+++ b/.gitlab-ci.yml.in
@@ -30,6 +30,10 @@ check-DEVELOPERS:
     script:
         - "! utils/get-developers | grep -v 'No action specified'"
 
+check-package:
+    script:
+        - find . -type f -name '*.mk' -exec ./utils/check-package {} +
+
 .defconfig: &defconfig
     # Running the defconfigs for every push is too much, so limit to
     # explicit triggers through the API.
