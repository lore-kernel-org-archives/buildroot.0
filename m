From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Dec 2015 23:46:10 +0100
Subject: [Buildroot] [git commit] graph-depends: correct is_dep() comment
Message-ID: <20151229225703.1CF6D826FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f62ce058be91a999716210a86f968be5bd515c4f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The uncached variant is called is_dep_uncached(), not is_dep_full().

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/graph-depends | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
index e91c9c5..fd8ad2f 100755
--- a/support/scripts/graph-depends
+++ b/support/scripts/graph-depends
@@ -270,7 +270,7 @@ def is_dep_uncached(pkg,pkg2,deps):
         pass
     return False
 
-# See is_dep_full() above; this is the cached version.
+# See is_dep_uncached() above; this is the cached version.
 def is_dep(pkg,pkg2,deps):
     try:
         return is_dep_cache_lookup(pkg, pkg2)
