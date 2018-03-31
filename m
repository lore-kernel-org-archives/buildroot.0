From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Fri, 30 Mar 2018 23:22:27 -0300
Subject: [Buildroot] [PATCH 02/36] check-package: enable for arch/ and
 system/
In-Reply-To: <20180331022301.27501-1-ricardo.martincoski@gmail.com>
References: <20180331022301.27501-1-ricardo.martincoski@gmail.com>
Message-ID: <20180331022301.27501-3-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

These directories can benefit from this script to prevent common
mistakes when submitting patches.

In order to accomplish this:
Do not ignore anymore files from these directories.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
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
-- 
2.14.1
