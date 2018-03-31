From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Fri, 30 Mar 2018 23:22:29 -0300
Subject: [Buildroot] [PATCH 04/36] check-package: enable for boot/
In-Reply-To: <20180331022301.27501-1-ricardo.martincoski@gmail.com>
References: <20180331022301.27501-1-ricardo.martincoski@gmail.com>
Message-ID: <20180331022301.27501-5-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This directory can benefit from this script to prevent common mistakes
when submitting patches.

In order to accomplish this:
Do not ignore anymore files from the boot/ directory.
Ignore boot/barebox/barebox.mk as it declares a package infra and not a
package itself.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 utils/check-package | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/utils/check-package b/utils/check-package
index 8d10affabd..48ce956443 100755
--- a/utils/check-package
+++ b/utils/check-package
@@ -47,10 +47,12 @@ def parse_args():
 CONFIG_IN_FILENAME = re.compile("/Config\.\S*$")
 DO_CHECK_INTREE = re.compile("|".join([
     "arch/",
+    "boot/",
     "package/",
     "system/",
     ]))
 DO_NOT_CHECK_INTREE = re.compile("|".join([
+    "boot/barebox/barebox\.mk$",
     "package/doc-asciidoc\.mk$",
     "package/pkg-\S*\.mk$",
     ]))
-- 
2.14.1
