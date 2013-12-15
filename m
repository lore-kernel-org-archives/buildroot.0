From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Dec 2013 16:26:02 +0100
Subject: [Buildroot] [git commit] manual: clarify format of comments about
	dependency on Linux kernel
Message-ID: <20131215152646.149E99BC87@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b47c8cc8aa51a6fd3de8a60c5090c39801c81afd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/adding-packages-directory.txt |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index 36b7093..57f3204 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -253,6 +253,22 @@ use in the comment.
 ** Dependency symbol: +!BR2_PREFER_STATIC_LIB+
 ** Comment string: +dynamic library+
 
+Dependencies on a Linux kernel built by buildroot
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+Some packages need a Linux kernel to be built by buildroot. These are
+typically kernel modules or firmware. A comment should be added in the
+Config.in file to express this dependency, similar to dependencies on
+toolchain options. The general format is:
+
+--------------------------
+foo needs a Linux kernel to be built
+--------------------------
+
+If there is a dependency on both toolchain options and the Linux
+kernel, use this format:
+--------------------------
+foo needs a toolchain w/ featA, featB, featC and a Linux kernel to be built
+--------------------------
 
 The +.mk+ file
 ~~~~~~~~~~~~~~
