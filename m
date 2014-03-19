From: Alan Ott <alan@signal11.us>
Date: Wed, 19 Mar 2014 19:57:46 -0400
Subject: [Buildroot] [PATCH] manual: Add Section on using Buildroot's
	Toolchain Externally
Message-ID: <1395273466-19365-1-git-send-email-alan@signal11.us>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alan Ott <alan@signal11.us>
---
 docs/manual/customize-toolchain.txt | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/docs/manual/customize-toolchain.txt b/docs/manual/customize-toolchain.txt
index 31c9140..71687d3 100644
--- a/docs/manual/customize-toolchain.txt
+++ b/docs/manual/customize-toolchain.txt
@@ -49,3 +49,33 @@ It allows to tune major settings, such as:
 
 These settings are available after selecting the +Buildroot toolchain+ type in
 the menu +Toolchain+.
+
+Using a Buildroot Toolchain from Outside Buildroot
+^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+
+The Buildroot toolchain (either internal or external) can be used to build
+packages from outside of Buildroot's build system.
+
+The preferred way of using Buildroot's toolchain is to use the toolchain
+wrappers (described above in this section), which are located in the
++output/host/usr/bin/+ directory.  Using the wrappers will ensure that the
+appropriate options are passed to the compiler.  This directory contains two
+sets of binaries, one set with short names (eg: +gcc+) and one set with
+the full host tuple names (eg: +i686-pc-linux-gnu+).  The full host tuple
+binaries should be used.
+
+For example, if Buildroot is configured for i686, use the following to build
+autotools-based packages using Buildroot's toolchain:
+
+-----------------------------------------------------------
+export PATH=$PATH:/path/to/buildroot/output/host/usr/bin/
+./configure --host=i686-pc-linux-gnu
+make
+-----------------------------------------------------------
+
+Some build systems (eg: kbuild) use the CROSS_COMPILE environment variable
+and can be built as follows:
+------------------------------------------------------------------------------
+export CROSS_COMPILE=/path/to/buildroot/output/host/usr/bin/i686-pc-linux-gnu-
+make
+------------------------------------------------------------------------------
-- 
1.8.1.2
