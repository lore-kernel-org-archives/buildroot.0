From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun,  1 Apr 2018 02:08:30 -0300
Subject: [Buildroot] [PATCH v2 17/37] check-package: enable for Config.in*
 in base dir
In-Reply-To: <20180401050850.5701-1-ricardo.martincoski@gmail.com>
References: <20180401050850.5701-1-ricardo.martincoski@gmail.com>
Message-ID: <20180401050850.5701-18-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

These files can benefit from this script to prevent common mistakes when
submitting patches.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
Changes v1 -> v2:
  - rebase after toolchain-common.in was merged to Config.in
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
-- 
2.14.1
