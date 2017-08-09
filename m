From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 9 Aug 2017 23:37:47 +0200
Subject: [Buildroot] [git commit branch/next] package/stella: fix gcc7
	support
Message-ID: <20170809225752.A609E7FA6F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d2f0f5df468209e0bd97b54e713e80e92188ef4f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes
http://autobuild.buildroot.net/results/6ed/6edd7950c402dbf433f3904193c645ebc8531c7e/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/stella/0004-gcc7.patch | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/package/stella/0004-gcc7.patch b/package/stella/0004-gcc7.patch
new file mode 100644
index 0000000..979682d
--- /dev/null
+++ b/package/stella/0004-gcc7.patch
@@ -0,0 +1,23 @@
+From fb6e573263b7fb80a12d0eb74d22e13899f745ee Mon Sep 17 00:00:00 2001
+From: Stephen Anthony <sa666666@gmail.com>
+Date: Mon, 17 Apr 2017 18:52:04 -0230
+Subject: [PATCH] Update UNIX configure script for gcc7 and above.
+
+Backported from upstream commit:
+https://github.com/stella-emu/stella/commit/fb6e573263b7fb80a12d0eb74d22e13899f745ee
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff --git a/configure b/configure
+index 94b91ef9..b1218e9f 100755
+--- a/configure
++++ b/configure
+@@ -417,7 +417,7 @@ elif test "$have_gcc" = yes; then
+ 	fi
+ 
+ 	case $cxx_version in
+-		4.[7-9]|4.[7-9].[0-9]|4.[7-9].[0-9][-.]*|[5-6].[0-9]|[5-6].[0-9].[0-9]|[5-6].[0-9].[0-9][-.]*)
++		4.[7-9]|4.[7-9].[0-9]|4.[7-9].[0-9][-.]*|[5-9]|[5-9].[0-9]|[5-9].[0-9].[0-9]|[5-9].[0-9].[0-9][-.]*)
+ 			_cxx_major=`echo $cxx_version | cut -d '.' -f 1`
+ 			_cxx_minor=`echo $cxx_version | cut -d '.' -f 2`
+ 			cxx_version="$cxx_version, ok"
