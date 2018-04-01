From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Apr 2018 10:16:09 +0200
Subject: [Buildroot] [git commit] scanpypi: generate help text compliant to
 check-package
Message-ID: <20180401081638.8F3A7827DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3ff0728480f4b9b5e1ba36537960f107f274b4b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Each line must fit in <tab><2 spaces><62 chars>.
The default width for textwrap.wrap() is 70, so explicit set it to 62.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/scanpypi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/scanpypi b/utils/scanpypi
index df8939b82e..f03ad0bb64 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -583,7 +583,7 @@ class BuildrootPackage():
 
         lines.append('\thelp\n')
 
-        help_lines = textwrap.wrap(self.metadata['info']['summary'],
+        help_lines = textwrap.wrap(self.metadata['info']['summary'], 62,
                                    initial_indent='\t  ',
                                    subsequent_indent='\t  ')
 
