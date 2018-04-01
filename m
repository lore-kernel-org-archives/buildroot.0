From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun,  1 Apr 2018 02:08:48 -0300
Subject: [Buildroot] [PATCH v2 35/37] scanpypi: generate help text compliant
 to check-package
In-Reply-To: <20180401050850.5701-1-ricardo.martincoski@gmail.com>
References: <20180401050850.5701-1-ricardo.martincoski@gmail.com>
Message-ID: <20180401050850.5701-36-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Each line must fit in <tab><2 spaces><62 chars>.
The default width for textwrap.wrap() is 70, so explicit set it to 62.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
Changes v1 -> v2:
  - no changes
---
 utils/scanpypi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/scanpypi b/utils/scanpypi
index 505ba0a246..6a3cdcc666 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -583,7 +583,7 @@ class BuildrootPackage():
 
         lines.append('\thelp\n')
 
-        help_lines = textwrap.wrap(self.metadata['info']['summary'],
+        help_lines = textwrap.wrap(self.metadata['info']['summary'], 62,
                                    initial_indent='\t  ',
                                    subsequent_indent='\t  ')
 
-- 
2.14.1
