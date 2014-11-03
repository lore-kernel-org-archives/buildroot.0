From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 3 Nov 2014 23:25:14 +0100
Subject: [Buildroot] [git commit] lttng-tools: update hash
Message-ID: <20141103222823.6A2D3B1B30@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1d221071cfbc5069d95f66d011e6555830724a82
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/4c0/4c0f8583986d72fbc879d21bef65246bc9b4a732/
http://autobuild.buildroot.net/results/db4/db4011b3444c71942b1a269dd16b18652fd22d97/
http://autobuild.buildroot.net/results/220/220ef41676096bafd2e38f4fbb892eb0a7d654d8/
http://autobuild.buildroot.net/results/545/545371f5a39c85aba0d15a41cdc46e1cf6c1ba9f/

And many more.

Upstream silently updated the tarball on 30/10, breaking the build. The only
difference between the old and new tarballs is that the version number is
fixed:

diff -urpN old/lttng-tools-2.5.1/include/version.h new/lttng-tools-2.5.1/include/version.h
--- old/lttng-tools-2.5.1/include/version.h     2014-10-20 21:47:51.000000000 +0200
+++ new/lttng-tools-2.5.1/include/version.h     2014-10-31 16:33:17.000000000 +0100
@@ -20,7 +20,7 @@
 #ifndef VERSION_H
 #define VERSION_H

-#define GIT_VERSION "heads/stable-2.5-0-g56eb774"
+#define GIT_VERSION "2.5.1"

The copy of the old tarball on sources.buildroot.net has also been removed.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lttng-tools/lttng-tools.hash |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/lttng-tools/lttng-tools.hash b/package/lttng-tools/lttng-tools.hash
index c0c4bc1..92a4401 100644
--- a/package/lttng-tools/lttng-tools.hash
+++ b/package/lttng-tools/lttng-tools.hash
@@ -1,2 +1,2 @@
 # Locally generated
-sha256  3c6511e6ceef975cfe36b5644ab9bfaa6780c71b1d2551718279823924429739  lttng-tools-2.5.1.tar.bz2
+sha256  1084ce1fac0030cb5e0e3e117002444ceb9f94d6a15a6cce6607c480eca9b21b  lttng-tools-2.5.1.tar.bz2
