From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Jun 2014 14:39:48 +0200
Subject: [Buildroot] [git commit] graphs/depends: do not draw transitive
	dependencies by default
Message-ID: <20140613124035.BAA0499E72@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4cce4ac9907ed58e480a0a9c319a0af96c96108f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The transitive dependencies make the graphs barely readable for large
configs, with a large number of packages.

So, just switch to not drawing the transitive dependencies by default.

By popular demand... ;-)

[Peter: reword]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc; Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/common-usage.txt  |    2 +-
 support/scripts/graph-depends |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/manual/common-usage.txt b/docs/manual/common-usage.txt
index eb83990..539185a 100644
--- a/docs/manual/common-usage.txt
+++ b/docs/manual/common-usage.txt
@@ -207,7 +207,7 @@ The +graph-depends+ behaviour can be controlled by setting options in the
   default, +0+, means no limit.
 
 * +--transitive+, +--no-transitive+, to draw (or not) the transitive
-  dependencies. The default is to draw transitive dependencies.
+  dependencies. The default is to not draw transitive dependencies.
 
 * +--colours R,T,H+, the comma-separated list of colours to draw the
   root package (+R+), the target packages (+T+) and the host packages
diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index 42a42a8..29f271a 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -48,7 +48,7 @@ parser.add_argument("--colours", "-c", metavar="COLOR_LIST", dest="colours",
                        + " packages, and the host packages, in this order." \
                        + " Defaults to: 'lightblue,grey,gainsboro'")
 parser.add_argument("--transitive", dest="transitive", action='store_true',
-                    default=True)
+                    default=False)
 parser.add_argument("--no-transitive", dest="transitive", action='store_false',
                     help="Draw (do not draw) transitive dependencies")
 args = parser.parse_args()
