From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 May 2016 23:26:25 +0200
Subject: [Buildroot] [git commit] support/scripts: fix graph-build-time help
	text
Message-ID: <20160524212703.824E081F05@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8bf947e0ef62362cda991537520b94a090a652ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The graph-build-time help text currently looks like this:

usage: graph-build-time [-h] [--type GRAPH_TYPE] [--order GRAPH_ORDER]
                        [--alternate-colors] [--input OUTPUT] --output OUTPUT

Obviously, naming the parameter for --input as OUTPUT is not a very
good idea, so this commit fixes that to name it "INPUT", as expected.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/scripts/graph-build-time | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/graph-build-time b/support/scripts/graph-build-time
index 7eb3e47..0ba0f2d 100755
--- a/support/scripts/graph-build-time
+++ b/support/scripts/graph-build-time
@@ -276,7 +276,7 @@ parser.add_argument("--order", '-O', metavar="GRAPH_ORDER",
                     help="Ordering of packages: build or duration (for histogram only)")
 parser.add_argument("--alternate-colors", '-c', action="store_true",
                     help="Use alternate colour-scheme")
-parser.add_argument("--input", '-i', metavar="OUTPUT",
+parser.add_argument("--input", '-i', metavar="INPUT",
                     help="Input file (usually $(O)/build/build-time.log)")
 parser.add_argument("--output", '-o', metavar="OUTPUT", required=True,
                     help="Output file (.pdf or .png extension)")
