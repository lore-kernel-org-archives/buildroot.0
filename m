From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 10 Nov 2013 23:59:04 +0100
Subject: [Buildroot] [git commit] manual: clarify that Config.in comments
	should have correct dependencies
Message-ID: <20131110230227.CDCAA9BB64@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3c33c11386240444c6fde0984f43c64f98ce516d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Acked-by: "Samuel Martin" <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/adding-packages-directory.txt |   17 +++++++++++++++--
 1 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index 3ebe50e..700ec4f 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -171,8 +171,9 @@ C library, C++ support, largefile support, thread support, RPC support,
 IPv6 support, wchar support, or dynamic library support. Some packages
 can only be built on certain target architectures, or if an MMU is
 available in the processor.
-These dependencies have to expressed with the appropriate 'depends on'
-statements in the Config.in file. Additionally, for dependencies on
+
+These dependencies have to be expressed with the appropriate 'depends
+on' statements in the Config.in file. Additionally, for dependencies on
 toolchain options, a +comment+ should be displayed when the option is
 not enabled, so that the user knows why the package is not available.
 Dependencies on target architecture or MMU support should not be
@@ -180,6 +181,18 @@ made visible in a comment: since it is unlikely that the user can
 freely choose another target, it makes little sense to show these
 dependencies explicitly.
 
+The +comment+ should only be visible if the +config+ option itself would
+be visible when the toolchain option dependencies are met. This means
+that all other dependencies of the package (including dependencies on
+target architecture and MMU support) have to be repeated on the
++comment+ definition. To keep it clear, the +depends on+ statement for
+these non-toolchain option should be kept separate from the +depends on+
+statement for the toolchain options.
+If there is a dependency on a config option in that same file (typically
+the main package) it is preferable to have a global +if ... endif+
+construct rather than repeating the +depends on+ statement on the
+comment and other config options.
+
 The general format of a dependency +comment+ for package foo is:
 --------------------------
 foo needs a toolchain w/ featA, featB, featC
