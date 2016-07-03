From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Jul 2016 00:35:16 +0200
Subject: [Buildroot] [git commit] scanpypi: fix help text handling
Message-ID: <20160703223538.739668081B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f49295cc42caf72aadd0500ae5ef01870cc4d98c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Make sure a help text is terminated with a full stop.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/scanpypi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/support/scripts/scanpypi b/support/scripts/scanpypi
index 79a888c..f0d584a 100755
--- a/support/scripts/scanpypi
+++ b/support/scripts/scanpypi
@@ -525,6 +525,11 @@ class BuildrootPackage():
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
