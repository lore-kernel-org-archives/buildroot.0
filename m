From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Aug 2014 21:00:19 +0200
Subject: [Buildroot] [git commit] package/nut: fix parallel install
Message-ID: <20140817190117.AD0B59D462@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dce24bba0d2e85eb4bae50e2b061bd3f3bcbd531
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
    http://autobuild.buildroot.net/results/256/2567e13cd5bc702bc3a38a1d6fc8e34022cc7db5/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nut/nut-0002-parallel-build.patch |   24 ++++++++++++++++++++++++
 1 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/package/nut/nut-0002-parallel-build.patch b/package/nut/nut-0002-parallel-build.patch
new file mode 100644
index 0000000..f979c19
--- /dev/null
+++ b/package/nut/nut-0002-parallel-build.patch
@@ -0,0 +1,24 @@
+conf: fix parallel install
+
+Do not reference the upsmon.conf.sample twice, otherwise install, with
+a high number of make jobs, may fail, like so:
+    http://autobuild.buildroot.net/results/256/2567e13cd5bc702bc3a38a1d6fc8e34022cc7db5/build-end.log
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+---
+Upstream status:
+    https://github.com/networkupstools/nut/pull/147
+
+diff -durB nut-2.7.2.orig/conf/Makefile.am nut-2.7.2/conf/Makefile.am
+--- nut-2.7.2.orig/conf/Makefile.am	2014-02-14 09:56:53.000000000 +0100
++++ nut-2.7.2/conf/Makefile.am	2014-08-17 11:33:46.804439240 +0200
+@@ -2,7 +2,7 @@
+ 
+ INSTALL_0600 = $(INSTALL) -m 0600
+ 
+-SECFILES = upsmon.conf.sample upsd.conf.sample upsd.users.sample
++SECFILES = upsd.conf.sample upsd.users.sample
+ PUBFILES = nut.conf.sample ups.conf.sample
+ CGIPUB = hosts.conf.sample upsset.conf.sample upsstats.html.sample	\
+  upsstats-single.html.sample
