From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 15 Dec 2013 13:20:40 +0100
Subject: [Buildroot] [PATCH 2 of 2] manual: clarify format of comments about
 dependency on Linux kernel
In-Reply-To: <patchbomb.1387110038@argentina>
References: <patchbomb.1387110038@argentina>
Message-ID: <ab56a4aad6683e9f04d4.1387110040@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 docs/manual/adding-packages-directory.txt |  16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
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
