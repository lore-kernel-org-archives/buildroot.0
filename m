From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 20 Sep 2012 14:08:01 +0200
Subject: [Buildroot] [git commit] mplayer: not supported on sh4a/sh4aeb
Message-ID: <20120920124824.1E8BB9964E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=14af091234840bf22f240b66bcb78da00950f8f8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The mplayer configure script says that sh4a is not supported,
according to:

 http://autobuild.buildroot.org/results/c6457c2dea7c1df4d8e0f23995ebfb3285a85aed/build-end.log

Apparently, sh4 is supported, but not sh4a, even though it seems that
sh4a is a super-set of sh4. So it would probably not be too difficult
to get mplayer to build/work for sh4a, but we don't have hardware to
test this easily, and we can leave this work to the first developer
who will need mplayer on sh4a: let's only support what the upstream
package supports.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/mplayer/Config.in |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/mplayer/Config.in b/package/multimedia/mplayer/Config.in
index a9a4bb6..77bf9dc 100644
--- a/package/multimedia/mplayer/Config.in
+++ b/package/multimedia/mplayer/Config.in
@@ -1,5 +1,8 @@
 config BR2_PACKAGE_MPLAYER
 	bool "mplayer"
+	# "Error: unsupported architecture sh4a" says mplayer
+	# configure script.
+	depends on !BR2_sh4a && !BR2_sh4aeb
 	help
 	  MPlayer is a movie player which runs on many systems and supports
 	  many different file formats.
