From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Aug 2019 11:10:41 +0200
Subject: [Buildroot] [git commit] support/scripts/pkg-stats: rename
 dump_gen_info()
Message-ID: <20190801090802.051B181378@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2a16a0ff08918cc28b577df86d63c77854b922cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since it's used only for the HTML output, and all other functions used
for HTML output are prefixed by dump_html, let's do so for
dump_gen_info() as well by renaming it to dump_html_gen_info().

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/pkg-stats | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index a04712df04..c5bebfed6b 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -678,7 +678,7 @@ def dump_html_stats(f, stats):
     f.write("</table>\n")
 
 
-def dump_gen_info(f, date, commit):
+def dump_html_gen_info(f, date, commit):
     # Updated on Mon Feb 19 08:12:08 CET 2018, Git commit aa77030b8f5e41f1c53eb1c1ad664b8c814ba032
     f.write("<p><i>Updated on %s, git commit %s</i></p>\n" % (str(date), commit))
 
@@ -688,7 +688,7 @@ def dump_html(packages, stats, date, commit, output):
         f.write(html_header)
         dump_html_all_pkgs(f, packages)
         dump_html_stats(f, stats)
-        dump_gen_info(f, date, commit)
+        dump_html_gen_info(f, date, commit)
         f.write(html_footer)
 
 
