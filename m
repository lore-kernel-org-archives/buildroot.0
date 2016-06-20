From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon, 20 Jun 2016 15:12:53 +0200
Subject: [Buildroot] [PATCH] scanpypi: fix help text handling
Message-ID: <1466428373-17411-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Make sure a help text is terminated with a full stop.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 support/scripts/scanpypi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/support/scripts/scanpypi b/support/scripts/scanpypi
index 230791f..da578f4 100755
--- a/support/scripts/scanpypi
+++ b/support/scripts/scanpypi
@@ -527,6 +527,11 @@ class BuildrootPackage():
         help_lines = textwrap.wrap(self.metadata['info']['summary'],
                                    initial_indent='\t  ',
                                    subsequent_indent='\t  ')
+
+        # make sure a help text is terminated with a full stop
+        if help_lines[-1][-1] != '.':
+            help_lines[-1] += '.'
+
         # \t + two spaces is 3 char long
         help_lines.append('')
         help_lines.append('\t  ' + self.metadata['info']['home_page'])
-- 
2.1.4
