From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 6 Mar 2013 21:10:24 +0100
Subject: [Buildroot] [git commit] graph-depends: ignore the
	'target-post-image' target
Message-ID: <20130306205128.291FE9AEFC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a9ba807c588e285960e08140127ea43a6066204c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the introduction of the post-image mechanism, the graph-depends
script is broken: it tries to call 'make
target-post-image-show-depends', which doesn't exist since
'target-post-image' is not a package.

So we should simply ignore this 'target-post-image'.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 support/scripts/graph-depends |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index 1163d79..180c81d 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -168,6 +168,7 @@ TARGET_EXCEPTIONS = [
     "erase-fakeroots",
     "target-generic-hostname",
     "target-root-passwd",
+    "target-post-image",
 ]
 
 # In full mode, start with the result of get_targets() to get the main
