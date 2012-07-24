From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Jul 2012 00:10:30 +0200
Subject: [Buildroot] [PATCH 2/3] gpsd: add patch to disable rpath
In-Reply-To: <1343167832-14198-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1343167832-14198-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1343167832-14198-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../gpsd/gpsd-03-sconstruct-disable-rpath.patch    |   17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 package/gpsd/gpsd-03-sconstruct-disable-rpath.patch

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
-- 
1.7.9.5
