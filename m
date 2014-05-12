From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 12 May 2014 22:18:26 +0200
Subject: [Buildroot] [git commit] libcec: fix build issue on AVR32
Message-ID: <20140512204138.7F50C9CB9C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a5dbc10a7fc1d707b277fd8a961ffb97a3e74af9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.org/results/89d/89d8165b455cd7131e4c0729cec50dad8980ceb1/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcec/libcec-0002-no-psabi-warning.patch |   22 +++++++++++++++++++++
 1 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/package/libcec/libcec-0002-no-psabi-warning.patch b/package/libcec/libcec-0002-no-psabi-warning.patch
new file mode 100644
index 0000000..bd6557e
--- /dev/null
+++ b/package/libcec/libcec-0002-no-psabi-warning.patch
@@ -0,0 +1,22 @@
+Do not use -Wno-psabi warning, not available on old g++
+
+AVR32 uses a very old g++ version, which does not implement the
+-Wno-psabi warning flag. This patch simply removes this warning flag
+from the libcec build. It can be dropped if only gcc 4.5+ versions are
+supported in Buildroot.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/configure.ac
+===================================================================
+--- a/configure.ac
++++ b/configure.ac
+@@ -130,7 +130,7 @@
+ use_udev="no"
+ use_adapter_detection="yes"
+ use_lockdev="no"
+-SUPPRESS_MANGLING_WARNINGS=" -Wno-psabi"
++SUPPRESS_MANGLING_WARNINGS=""
+ case "${host}" in
+   *-*-linux*)
+     ## search for udev if pkg-config was found
