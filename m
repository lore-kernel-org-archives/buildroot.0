From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Jun 2013 21:29:13 +0200
Subject: [Buildroot] [PATCH 23/23] docs/manual: update to mention eglibc
	support in Buildroot toolchain backend
In-Reply-To: <1372620553-11416-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1372620553-11416-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1372620553-11416-24-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/configure.txt | 52 +++++++++++++++++++++++------------------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/docs/manual/configure.txt b/docs/manual/configure.txt
index 4f9a6bb..e554ff8 100644
--- a/docs/manual/configure.txt
+++ b/docs/manual/configure.txt
@@ -72,11 +72,12 @@ The _internal toolchain backend_ is the backend where Buildroot builds
 by itself a cross-compilation toolchain, before building the userspace
 applications and libraries for your target embedded system.
 
-This backend is the historical backend of Buildroot, and is limited to
-the usage of the http://www.uclibc.org[uClibc C library] (i.e, the
-_glibc_ and _eglibc_ C libraries are not supported by this backend,
-see the _External toolchain backend_ and _Crosstool-NG toolchain
-backend_ for solutions to use either _glibc_ or _eglibc_).
+This backend is the historical backend of Buildroot, and has been
+limited for a long time to the usage of the
+http://www.uclibc.org[uClibc C library]. Support for the _eglibc_ C
+library has been added in 2013 and is at this point. considered
+experimental. See the _External toolchain backend_ and _Crosstool-NG
+toolchain backend_ for other solutions to use _glibc_ or _eglibc_.
 
 Once you have selected this backend, a number of options appear. The
 most important ones allow to:
@@ -99,29 +100,29 @@ most important ones allow to:
    the C library might be using interfaces that are not provided by
    your Linux kernel.
 
- * Change the version and the configuration of the uClibc C
-   library. The default options are usually fine. However, if you
-   really need to specifically customize the configuration of your
-   uClibc C library, you can pass a specific configuration file
-   here. Or alternatively, you can run the +make uclibc-menuconfig+
-   command to get access to uClibc's configuration interface. Note
-   that all packages in Buildroot are tested against the default
-   uClibc configuration bundled in Buildroot: if you deviate from this
-   configuration by removing features from uClibc, some packages may
-   no longer build.
+ * Change the version and the configuration of the uClibc C library
+   (if uClibc is selected). The default options are usually
+   fine. However, if you really need to specifically customize the
+   configuration of your uClibc C library, you can pass a specific
+   configuration file here. Or alternatively, you can run the +make
+   uclibc-menuconfig+ command to get access to uClibc's configuration
+   interface. Note that all packages in Buildroot are tested against
+   the default uClibc configuration bundled in Buildroot: if you
+   deviate from this configuration by removing features from uClibc,
+   some packages may no longer build.
 
  * Change the version of the GCC compiler and binutils.
 
- * Select a number of toolchain options: whether the toolchain should
-   have largefile support (i.e support for files larger than 2 GB on
-   32 bits systems), IPv6 support, RPC support (used mainly for NFS),
-   wide-char support, locale support (for internationalization), C++
-   support, thread support. Depending on which options you choose, the
-   number of userspace applications and libraries visible in Buildroot
-   menus will change: many applications and libraries require certain
-   toolchain options to be enabled. Most packages show a comment when
-   a certain toolchain option is required to be able to enable those
-   packages.
+ * Select a number of toolchain options (uClibc only): whether the
+   toolchain should have largefile support (i.e support for files
+   larger than 2 GB on 32 bits systems), IPv6 support, RPC support
+   (used mainly for NFS), wide-char support, locale support (for
+   internationalization), C++ support, thread support. Depending on
+   which options you choose, the number of userspace applications and
+   libraries visible in Buildroot menus will change: many applications
+   and libraries require certain toolchain options to be enabled. Most
+   packages show a comment when a certain toolchain option is required
+   to be able to enable those packages.
 
 It is worth noting that whenever one of those options is modified,
 then the entire toolchain and system must be rebuilt. See
@@ -137,7 +138,6 @@ Drawbacks of this backend:
 * Rebuilding the toolchain is needed when doing +make clean+, which
   takes time. If you're trying to reduce your build time, consider
   using the _External toolchain backend_.
-* Limited to the _uClibc_ C library.
 
 [[external-toolchain-backend]]
 External toolchain backend
-- 
1.8.1.2
