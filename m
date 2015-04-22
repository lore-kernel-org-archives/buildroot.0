From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Apr 2015 23:00:11 +0200
Subject: [Buildroot] [git commit] docs/manual: remove references to IPv6
Message-ID: <20150422210725.125C881D89@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=308ca05f96cda6fc89d0502a41df1867ce6a5b60
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's no longer an option so remove all references to it.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-directory.txt |   11 +++--------
 docs/manual/configure.txt                 |   10 +++++-----
 2 files changed, 8 insertions(+), 13 deletions(-)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index f536a0c..639003f 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -207,10 +207,9 @@ coding style].
 ==== Dependencies on target and toolchain options
 
 Many packages depend on certain options of the toolchain: the choice of
-C library, C++ support, thread support, RPC support, IPv6 support,
-wchar support, or dynamic library support. Some packages can only be
-built on certain target architectures, or if an MMU is available in the
-processor.
+C library, C++ support, thread support, RPC support, wchar support,
+or dynamic library support. Some packages can only be built on certain
+target architectures, or if an MMU is available in the processor.
 
 These dependencies have to be expressed with the appropriate 'depends
 on' statements in the Config.in file. Additionally, for dependencies on
@@ -301,10 +300,6 @@ use in the comment.
 ** Dependency symbol: +BR2_TOOLCHAIN_HAS_NATIVE_RPC+
 ** Comment string: +RPC+
 
-* IPv6 support
-** Dependency symbol: +BR2_INET_IPV6+
-** Comment string: +IPv6+ (lowercase v)
-
 * wchar support
 ** Dependency symbol: +BR2_USE_WCHAR+
 ** Comment string: +wchar+
diff --git a/docs/manual/configure.txt b/docs/manual/configure.txt
index c06182b..dd34eef 100644
--- a/docs/manual/configure.txt
+++ b/docs/manual/configure.txt
@@ -109,8 +109,8 @@ most important ones allow to:
  * Change the version of the GCC compiler, binutils and the C library.
 
  * Select a number of toolchain options (uClibc only): whether the
-   toolchain should have IPv6 support, RPC support (used mainly for
-   NFS), wide-char support, locale support (for internationalization),
+   toolchain should have RPC support (used mainly for NFS),
+   wide-char support, locale support (for internationalization),
    C++ support or thread support. Depending on which options you choose,
    the number of userspace applications and libraries visible in
    Buildroot menus will change: many applications and libraries require
@@ -177,9 +177,9 @@ Then, you have three solutions to use an external toolchain:
   external toolchain uses the 'glibc' library, you only have to tell
   whether your toolchain supports C\++ or not and whether it has
   built-in RPC support. If your external toolchain uses the 'uClibc'
-  library, then you have to tell Buildroot if it supports IPv6,
-  RPC, wide-char, locale, program invocation, threads and
-  C++. At the beginning of the execution, Buildroot will tell you if
+  library, then you have to tell Buildroot if it supports RPC,
+  wide-char, locale, program invocation, threads and C++.
+  At the beginning of the execution, Buildroot will tell you if
   the selected options do not match the toolchain configuration.
 
 Our external toolchain support has been tested with toolchains from
