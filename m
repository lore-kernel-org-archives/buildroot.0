From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Fri, 30 Mar 2018 23:22:41 -0300
Subject: [Buildroot] [PATCH 16/36] check-package: enable for Config.in* in
 base dir
In-Reply-To: <20180331022301.27501-1-ricardo.martincoski@gmail.com>
References: <20180331022301.27501-1-ricardo.martincoski@gmail.com>
Message-ID: <20180331022301.27501-17-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

These files can benefit from this script to prevent common mistakes when
submitting patches.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 utils/check-package | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/utils/check-package b/utils/check-package
index 35a4a70858..5faf413b85 100755
--- a/utils/check-package
+++ b/utils/check-package
@@ -44,8 +44,9 @@ def parse_args():
     return parser.parse_args()
 
 
-CONFIG_IN_FILENAME = re.compile("/Config\.\S*$|/toolchain-common.in$")
+CONFIG_IN_FILENAME = re.compile("Config\.\S*$|/toolchain-common.in$")
 DO_CHECK_INTREE = re.compile("|".join([
+    "Config.in",
     "arch/",
     "boot/",
     "fs/",
-- 
2.14.1
