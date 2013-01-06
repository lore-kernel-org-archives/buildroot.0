From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 6 Jan 2013 17:43:33 +0100
Subject: [Buildroot] [git commit] package/crosstool-ng: fix show-tuple stdout
Message-ID: <20130106164433.A17089A5E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6e6d2363e02a7c905e7141174d778756a129fa8e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream changeset d8bd17248789.

Reported-by: Floris Bos <bos@je-eigen-domein.nl>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../crosstool-ng-001-fix-showtuple-stdout.patch    |   35 ++++++++++++++++++++
 1 files changed, 35 insertions(+), 0 deletions(-)

diff --git a/package/crosstool-ng/crosstool-ng-001-fix-showtuple-stdout.patch b/package/crosstool-ng/crosstool-ng-001-fix-showtuple-stdout.patch
new file mode 100644
index 0000000..416ef76
--- /dev/null
+++ b/package/crosstool-ng/crosstool-ng-001-fix-showtuple-stdout.patch
@@ -0,0 +1,35 @@
+changeset:   3141:d8bd17248789
+tag:         tip
+user:        "Yann E. MORIN" <yann.morin.1998@free.fr>
+date:        Sun Jan 06 12:08:33 2013 +0100
+files:       scripts/showTuple.sh.in
+description:
+scripts/showTuple: fix stdout
+
+Since we've had the debug shell feature, fd #7 is now used to
+redirect stderr, while it was previously unused.
+
+Use fd #9 to redirect stdout.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+
+diff --git a/scripts/showTuple.sh.in b/scripts/showTuple.sh.in
+--- a/scripts/showTuple.sh.in
++++ b/scripts/showTuple.sh.in
+@@ -7,7 +7,7 @@
+ . "${CT_LIB_DIR}/paths.sh"
+ 
+ # We'll need the stdout later, save it
+-exec 7>&1
++exec 9>&1
+ 
+ # Parse the common functions
+ . "${CT_LIB_DIR}/scripts/functions"
+@@ -27,4 +27,4 @@
+ CT_DoBuildTargetTuple
+ 
+ # All this for this single echo... :-( Sigh, I'll have to re-arrange things...
+-echo "${CT_TARGET}" >&7
++echo "${CT_TARGET}" >&9
+
