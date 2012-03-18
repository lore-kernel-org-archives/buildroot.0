From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 18 Mar 2012 23:10:19 +0100
Subject: [Buildroot] [git commit] ttcp: deprecate package
Message-ID: <20120318221115.9F49290E90@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b6a507c71218b797104f5ccc63316634062f22ad
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Software is ancient, upstream is missing and the package hasn't seen any
significant changes since it was added in 2003.

Unless someone steps up to update it (E.G. to gentargets), it will
be removed during the 2012.05 cycle.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                |    2 ++
 package/ttcp/Config.in |    1 +
 2 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/CHANGES b/CHANGES
index 284707c..44079a5 100644
--- a/CHANGES
+++ b/CHANGES
@@ -29,6 +29,8 @@
 	New packages: glib-networking, lcdprog, minicom, parted,
 	zeromq
 
+	Deprecated packages: ttcp
+
 	Removed packages: ntfsprogs
 
 	Issues resolved (http://bugs.uclibc.org):
diff --git a/package/ttcp/Config.in b/package/ttcp/Config.in
index a3f5a71..0262fc9 100644
--- a/package/ttcp/Config.in
+++ b/package/ttcp/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_TTCP
 	bool "ttcp"
+	depends on BR2_DEPRECATED
 	help
 	  Benchmarking tool for determining TCP and UDP performance.
 
