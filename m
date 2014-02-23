From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Feb 2014 16:04:33 +0100
Subject: [Buildroot] [PATCH 07/13] docs/manual: update informations about C
	library in internal backend
In-Reply-To: <1393167879-16637-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1393167879-16637-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1393167879-16637-8-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that we have eglibc and glibc support in the internal backend, and
no longer marked as experimental, a little bit of rewording is
needed. It is no longer necessary to indicate that uClibc was
historically supported as the only C library, and that the glibc
support is experimental. We also update the rest of the description to
be less uClibc specific.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/configure.txt | 30 +++++++++++-------------------
 1 file changed, 11 insertions(+), 19 deletions(-)

diff --git a/docs/manual/configure.txt b/docs/manual/configure.txt
index 89df3d9..b566e8a 100644
--- a/docs/manual/configure.txt
+++ b/docs/manual/configure.txt
@@ -68,12 +68,10 @@ The _internal toolchain backend_ is the backend where Buildroot builds
 by itself a cross-compilation toolchain, before building the userspace
 applications and libraries for your target embedded system.
 
-This backend is the historical backend of Buildroot, and has been
-limited for a long time to the usage of the
-http://www.uclibc.org[uClibc C library]. Support for the _eglibc_ C
-library has been added in 2013 and is at this point considered
-experimental. See the _External toolchain backend_ for another
-solution to use _glibc_ or _eglibc_.
+This backend supports several C libraries:
+http://www.uclibc.org[uClibc], the
+http://www.gnu.org/software/libc/libc.html[glibc] and
+http://www.eglibc.org[eglibc].
 
 Once you have selected this backend, a number of options appear. The
 most important ones allow to:
@@ -96,18 +94,7 @@ most important ones allow to:
    the C library might be using interfaces that are not provided by
    your Linux kernel.
 
- * Change the version and the configuration of the uClibc C library
-   (if uClibc is selected). The default options are usually
-   fine. However, if you really need to specifically customize the
-   configuration of your uClibc C library, you can pass a specific
-   configuration file here. Or alternatively, you can run the +make
-   uclibc-menuconfig+ command to get access to uClibc's configuration
-   interface. Note that all packages in Buildroot are tested against
-   the default uClibc configuration bundled in Buildroot: if you
-   deviate from this configuration by removing features from uClibc,
-   some packages may no longer build.
-
- * Change the version of the GCC compiler and binutils.
+ * Change the version of the GCC compiler, binutils and the C library.
 
  * Select a number of toolchain options (uClibc only): whether the
    toolchain should have largefile support (i.e support for files
@@ -118,7 +105,12 @@ most important ones allow to:
    libraries visible in Buildroot menus will change: many applications
    and libraries require certain toolchain options to be enabled. Most
    packages show a comment when a certain toolchain option is required
-   to be able to enable those packages.
+   to be able to enable those packages. If needed, you can further
+   refine the uClibc configuration by running +make
+   uclibc-menuconfig+. Note however that all packages in Buildroot are
+   tested against the default uClibc configuration bundled in
+   Buildroot: if you deviate from this configuration by removing
+   features from uClibc, some packages may no longer build.
 
 It is worth noting that whenever one of those options is modified,
 then the entire toolchain and system must be rebuilt. See
-- 
1.8.3.2
