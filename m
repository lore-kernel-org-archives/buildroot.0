From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 08:01:05 +0200
Subject: [Buildroot] [git commit] check-package: enable for arch/ and system/
Message-ID: <20180401060117.DBE3B80500@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=560ab2cb956e936ead76074c5e8e6f6c0287074a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

These directories can benefit from this script to prevent common
mistakes when submitting patches.

In order to accomplish this:
Do not ignore anymore files from these directories.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/check-package | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/utils/check-package b/utils/check-package
index d2457c706c..8d10affabd 100755
--- a/utils/check-package
+++ b/utils/check-package
@@ -46,7 +46,9 @@ def parse_args():
 
 CONFIG_IN_FILENAME = re.compile("/Config\.\S*$")
 DO_CHECK_INTREE = re.compile("|".join([
+    "arch/",
     "package/",
+    "system/",
     ]))
 DO_NOT_CHECK_INTREE = re.compile("|".join([
     "package/doc-asciidoc\.mk$",
