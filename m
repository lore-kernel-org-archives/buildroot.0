From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue,  3 Dec 2019 15:59:03 +0100
Subject: [Buildroot] [PATCH] utils/genrandconfig: test per-package
 directories
Message-ID: <20191203145904.1070561-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that the support for per-package directories has been merged, it
is time to get some exposure for it in the autobuilders, so let's
build 1 out of 15 builds with this feature enabled, at least as an
initial step.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/genrandconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index aaba6c4204..fb28f4d356 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -349,6 +349,10 @@ def gen_config(args):
     # Allow hosts with old certificates to download over https
     configlines.append("BR2_WGET=\"wget --passive-ftp -nd -t 3 --no-check-certificate\"\n")
 
+    # Per-package folder
+    if randint(0, 15) == 0:
+        configlines.append("BR2_PER_PACKAGE_DIRECTORIES=y\n")
+
     # Amend the configuration with a few things.
     if randint(0, 20) == 0:
         configlines.append("BR2_ENABLE_DEBUG=y\n")
-- 
2.23.0
