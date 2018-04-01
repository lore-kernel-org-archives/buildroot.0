From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 09:12:00 +0200
Subject: [Buildroot] [git commit] check-package: enable for Config.in* in
 base dir
Message-ID: <20180401071211.BF126814E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e2c4a687c78a5740dfed2fef624d553cf14ab47a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

These files can benefit from this script to prevent common mistakes when
submitting patches.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/check-package | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/utils/check-package b/utils/check-package
index dd3a4bb7e8..d9b719783d 100755
--- a/utils/check-package
+++ b/utils/check-package
@@ -44,8 +44,9 @@ def parse_args():
     return parser.parse_args()
 
 
-CONFIG_IN_FILENAME = re.compile("/Config\.\S*$")
+CONFIG_IN_FILENAME = re.compile("Config\.\S*$")
 DO_CHECK_INTREE = re.compile("|".join([
+    "Config.in",
     "arch/",
     "boot/",
     "fs/",
