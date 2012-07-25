From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Jul 2012 18:25:42 +0200
Subject: [Buildroot] [git commit branch/next] gpsd: add patch to disable
	rpath
Message-ID: <20120802195300.E07388E8F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=73c6abae04aceb9f2556996d1783fde6d35e713c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../gpsd/gpsd-03-sconstruct-disable-rpath.patch    |   17 +++++++++++++++++
 1 files changed, 17 insertions(+), 0 deletions(-)

diff --git a/package/gpsd/gpsd-03-sconstruct-disable-rpath.patch b/package/gpsd/gpsd-03-sconstruct-disable-rpath.patch
new file mode 100644
index 0000000..5476450
--- /dev/null
+++ b/package/gpsd/gpsd-03-sconstruct-disable-rpath.patch
@@ -0,0 +1,17 @@
+Disable addition of RPATH to the generated libraries
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/SConstruct
+===================================================================
+--- a/SConstruct
++++ b/SConstruct
+@@ -273,8 +273,6 @@
+     env.Prepend(LIBPATH=[installdir('libdir')])
+ else:
+     env.Prepend(LIBPATH=[env["sysroot"] + installdir('libdir')])
+-if env["shared"]:
+-    env.Prepend(RPATH=[installdir('libdir')])
+ 
+ # Give deheader a way to set compiler flags
+ if 'MORECFLAGS' in os.environ:
