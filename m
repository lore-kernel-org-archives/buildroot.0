From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 10 Jun 2014 00:28:56 +0200
Subject: [Buildroot] [PATCH] graphs/depends: do not draw transitive
	dependencis by default
Message-ID: <1402352936-21264-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

The transitive dependencies make the graphs barely readable for large
configs, with a large number of packages.

So, just switch to not drawing the transitive dependencies by default.

By popular demand... ;-)

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc; Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/common-usage.txt  | 2 +-
 support/scripts/graph-depends | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/manual/common-usage.txt b/docs/manual/common-usage.txt
index eb83990..71fe5a3 100644
--- a/docs/manual/common-usage.txt
+++ b/docs/manual/common-usage.txt
@@ -207,7 +207,7 @@ The +graph-depends+ behaviour can be controlled by setting options in the
   default, +0+, means no limit.
 
 * +--transitive+, +--no-transitive+, to draw (or not) the transitive
-  dependencies. The default is to draw transitive dependencies.
+  dependencies. The default is not to draw transitive dependencies.
 
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
-- 
1.8.3.2
