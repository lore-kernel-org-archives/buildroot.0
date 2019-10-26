From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 26 Oct 2019 21:43:14 +0200
Subject: [Buildroot] [PATCH 1/2] utils/genrandconfig: test configurations
 with BR2_RELRO_FULL
Message-ID: <20191026194315.32111-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 utils/genrandconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 9567739252..66f1ce6547 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -368,6 +368,8 @@ def gen_config(args):
         configlines.append("BR2_SYSTEM_ENABLE_NLS=y\n")
     if randint(0, 4) == 0:
         configlines.append("BR2_PIC_PIE=y\n")
+    if randint(0, 4) == 0:
+        configlines.append("BR2_RELRO_FULL=y\n")
 
     # Randomly enable BR2_REPRODUCIBLE 10% of times
     # also enable tar filesystem images for testing
-- 
2.23.0
