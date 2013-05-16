From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 16 May 2013 13:05:04 +0200
Subject: [Buildroot] [git commit] graph-depends: ignore the
	'target-purgelocales' target
Message-ID: <20130516110701.32FB99A26F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bfca77e7f7e21e1a624c32f0b1efdb52af34f1f2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Otherwise, graph-depends tries to call 'make target-purgelocales-show-depends',
which does not exist, as 'target-purgelocales' is not an actual package.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 support/scripts/graph-depends |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index 790e24e..50b8670 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -170,6 +170,7 @@ TARGET_EXCEPTIONS = [
     "target-generic-hostname",
     "target-root-passwd",
     "target-post-image",
+    "target-purgelocales",
 ]
 
 # In full mode, start with the result of get_targets() to get the main
