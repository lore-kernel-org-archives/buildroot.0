From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 08:49:18 +0200
Subject: [Buildroot] [git commit] check-package: enable for boot/
Message-ID: <20180401064927.92DFF8134D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=79936be11a4ad7f8939a5b8dbe7ef258da7afe1c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This directory can benefit from this script to prevent common mistakes
when submitting patches.

In order to accomplish this:
Do not ignore anymore files from the boot/ directory.
Ignore boot/barebox/barebox.mk as it declares a package infra and not a
package itself.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
