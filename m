From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 30 Nov 2017 00:08:45 +0100
Subject: [Buildroot] [PATCH 8/8] gitlab-ci: run check-package
In-Reply-To: <cover.1511996903.git.yann.morin.1998@free.fr>
References: <cover.1511996903.git.yann.morin.1998@free.fr>
Message-ID: <b9a9596c19817cf5a70c17acaa23657ed3597f01.1511996903.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 .gitlab-ci.yml    | 4 ++++
 .gitlab-ci.yml.in | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 0dddb22f12..c80a6b129b 100644
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
index 33c7b13725..0d2e239414 100644
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
-- 
2.11.0
