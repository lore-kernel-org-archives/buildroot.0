From: Spenser Gilliland <spenser@gillilanding.com>
Date: Wed,  8 Jan 2014 10:33:05 -0600
Subject: [Buildroot] [PATCH 4/4] pixman: do not build demos or tests
In-Reply-To: <1389198785-11923-1-git-send-email-spenser@gillilanding.com>
References: <1389198785-11923-1-git-send-email-spenser@gillilanding.com>
Message-ID: <1389198785-11923-5-git-send-email-spenser@gillilanding.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Test code does not compile correctly on microblaze architecture.  Disable both
tests and demos from being built to reduce failures and decrease build time.

Fixes autobuild failures

http://autobuild.buildroot.net/results/a4b/a4b0ce0621701df55c146609388c3e529ea3411e/build-end.log
http://autobuild.buildroot.net/results/e2f/e2f6e4750d8b93320681abf09157917d131c8de0/build-end.log
http://autobuild.buildroot.net/results/878/878f0665c1b3e0c8895912c3a5a3078f937a9c75/build-end.log
http://autobuild.buildroot.net/results/018/01869b49eb1d305cec98d4d9ecf046427e88c2f3/build-end.log
http://autobuild.buildroot.net/results/0e8/0e8a2f5fc1425e153c112f87083e8a93f726e3df/build-end.log
http://autobuild.buildroot.net/results/980/980e03c5f8a7678f3343439dc37636855f637f9e/build-end.log
http://autobuild.buildroot.net/results/e1c/e1c86da68e012dfbff345436b0967d7774c9d9c5/build-end.log
http://autobuild.buildroot.net/results/63c/63c4cc230fb0c1b359f2ca15721e20deaa0eecc9/build-end.log
http://autobuild.buildroot.net/results/db7/db7785da51133d9874857731de6e7ff19e13527b/build-end.log
http://autobuild.buildroot.net/results/af6/af6a646e560b9a743d909966a1243b1ee8dcb15f/build-end.log
http://autobuild.buildroot.net/results/e36/e360e979fbafa5add49dba4ae3f6972220966e0d/build-end.log
http://autobuild.buildroot.net/results/79e/79e4e0c94b833c247457d4839a46ff92a524f0bb/build-end.log
http://autobuild.buildroot.net/results/b67/b671f57bbfe3609d59d30281c7ee931b5ebf3df1/build-end.log
Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
---
 package/pixman/pixman-disable-demos-and-tests.patch | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 package/pixman/pixman-disable-demos-and-tests.patch

diff --git a/package/pixman/pixman-disable-demos-and-tests.patch b/package/pixman/pixman-disable-demos-and-tests.patch
new file mode 100644
index 0000000..f55fc0d
--- /dev/null
+++ b/package/pixman/pixman-disable-demos-and-tests.patch
@@ -0,0 +1,14 @@
+pixman: do not build demos or tests
+
+Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
+
+Index: pixman-0.30.0/Makefile.am
+===================================================================
+--- pixman-0.30.0.orig/Makefile.am	2014-01-08 10:14:23.773508352 -0600
++++ pixman-0.30.0/Makefile.am	2014-01-08 10:14:39.549508640 -0600
+@@ -1,4 +1,4 @@
+-SUBDIRS = pixman demos test
++SUBDIRS = pixman
+ 
+ pkgconfigdir=$(libdir)/pkgconfig
+ pkgconfig_DATA=pixman-1.pc
-- 
1.8.3.2
