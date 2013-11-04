From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 04 Nov 2013 21:34:15 +0100
Subject: [Buildroot] [PATCH] manual: clarify that Config.in comments should
 have correct dependencies
Message-ID: <94085e779250785b8986.1383597255@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
Note: this documentation patch accompanies my earlier patch of today to add
missing dependencies on such comments [1]. These two should have been sent
as one series, sorry for that.
[1] http://patchwork.ozlabs.org/patch/288125/

 docs/manual/adding-packages-directory.txt |  9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -171,6 +171,7 @@ C library, C++ support, largefile suppor
 IPv6 support, wchar support, or dynamic library support. Some packages
 can only be built on certain target architectures, or if an MMU is
 available in the processor.
+
 These dependencies have to expressed with the appropriate 'depends on'
 statements in the Config.in file. Additionally, for dependencies on
 toolchain options, a +comment+ should be displayed when the option is
@@ -180,6 +181,14 @@ made visible in a comment: since it is u
 freely choose another target, it makes little sense to show these
 dependencies explicitly.
 
+The +comment+ should only be visible if the +config+ option itself would
+be visible when the toolchain option dependencies are met. This means
+that all other dependencies of the package (including dependencies on
+target architecture and MMU support) have to be repeated on the
++comment+ definition. To keep it clear, the +depends on+ statement for
+these non-toolchain option should be kept separate from the +depends on+
+statement for the toolchain options.
+
 The general format of a dependency +comment+ for package foo is:
 --------------------------
 foo needs a toolchain w/ featA, featB, featC
