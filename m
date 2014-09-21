From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Sep 2014 19:29:57 +0200
Subject: [Buildroot] [git commit] package/openvmtools: do not force
	-I/usr/include in CPPFLAGS
Message-ID: <20140921173024.3271F9D6FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=625fe102f0fbaed83f841e724f9536f095aba704
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
    http://autobuild.buildroot.net/results/447/4473d8a99ffec1fde491d172520e86ae1e69fae7/

[Thomas: change patch sequence number to 05, since another patch added
a 04 patch in the mean time.]

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../openvmtools-05-dont-force-cppflags.patch       |   22 ++++++++++++++++++++
 1 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/package/openvmtools/openvmtools-05-dont-force-cppflags.patch b/package/openvmtools/openvmtools-05-dont-force-cppflags.patch
new file mode 100644
index 0000000..8f904b1
--- /dev/null
+++ b/package/openvmtools/openvmtools-05-dont-force-cppflags.patch
@@ -0,0 +1,22 @@
+m4: do not force -I/usr/include in CPPFLAGS
+
+This is so horribly broken for cross-compilation. :-(
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff -durN openvmtools-9.4.6-1770165.orig/m4/vmtools.m4 openvmtools-9.4.6-1770165/m4/vmtools.m4
+--- openvmtools-9.4.6-1770165.orig/m4/vmtools.m4	2014-07-02 00:21:14.000000000 +0200
++++ openvmtools-9.4.6-1770165/m4/vmtools.m4	2014-09-21 12:39:15.901659888 +0200
+@@ -281,10 +281,10 @@
+       if test "$os" = freebsd; then
+          CUSTOM_$1_CPPFLAGS="-I/usr/local/include"
+       else
+-         CUSTOM_$1_CPPFLAGS="-I/usr/include"
++         CUSTOM_$1_CPPFLAGS=" "
+       fi
+       if test -n "$2"; then
+-         CUSTOM_$1_CPPFLAGS="${CUSTOM_$1_CPPFLAGS}/$2"
++         : CUSTOM_$1_CPPFLAGS="${CUSTOM_$1_CPPFLAGS}/$2"
+       fi
+    fi
+ ])
