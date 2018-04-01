From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 1 Apr 2018 22:25:57 +0200
Subject: [Buildroot] [git commit] support/scripts/graph-depends: add --quiet
 option
Message-ID: <20180401202618.BCF64836B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dcfcb777f480dc9ee4ff6503c338d792806d7bab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This will be useful for the upcoming recursive show-depends and
show-rdepends features.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/graph-depends | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index 17bfaa0cf5..4ec0e46f7b 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -312,6 +312,8 @@ def parse_args():
                         help="Draw direct dependencies (the default)")
     parser.add_argument("--reverse", dest="direct", action='store_false',
                         help="Draw reverse dependencies")
+    parser.add_argument("--quiet", '-q', dest="quiet", action='store_true',
+                        help="Quiet")
     return parser.parse_args()
 
 
@@ -321,7 +323,7 @@ def main():
     check_only = args.check_only
 
     logging.basicConfig(stream=sys.stderr, format='%(message)s',
-                        level=logging.INFO)
+                        level=logging.WARNING if args.quiet else logging.INFO)
 
     if args.outfile is None:
         outfile = sys.stdout
