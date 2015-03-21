From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 21 Mar 2015 20:49:48 +0100
Subject: [Buildroot] [PATCH 4/4] README: reduce it to a single page and
	refer to other documentation
In-Reply-To: <1426967388-559-1-git-send-email-arnout@mind.be>
References: <1426967388-559-1-git-send-email-arnout@mind.be>
Message-ID: <1426967388-559-5-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As discussed on the BR developer meeting at FOSDEM, the README should be
very short and instead refer to other documentation: the manual, the
website, the mailing list, the IRC channel.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 README | 59 ++++++++++-------------------------------------------------
 1 file changed, 10 insertions(+), 49 deletions(-)

diff --git a/README b/README
index 944347d..a7dae24 100644
--- a/README
+++ b/README
@@ -1,59 +1,20 @@
+Buildroot is a simple, efficient and easy-to-use tool to generate embedded
+Linux systems through cross-compilation.
+
+The documentation can be found in docs/manual. You can generate a text
+document with 'make manual-text' and read output/docs/manual/manual.text.
+Online documentation can be found at http://buildroot.org/docs.html
+
 To build and use the buildroot stuff, do the following:
 
 1) run 'make menuconfig'
-2) select the packages you wish to compile
+2) select the target architecture and the packages you wish to compile
 3) run 'make'
 4) wait while it compiles
-5) Use your shiny new root filesystem. Depending on which sort of
-    root filesystem you selected, you may want to loop mount it,
-    chroot into it, nfs mount it on your target device, burn it
-    to flash, or whatever is appropriate for your target system.
+5) find the kernel, bootloader, root filesystem, etc. in output/images
 
 You do not need to be root to build or run buildroot.  Have fun!
 
-Offline build:
-==============
-
-In order to do an offline-build (not connected to the net), fetch all
-selected source by issuing a
-$ make source
-
-before you disconnect.
-If your build-host is never connected, then you have to copy buildroot
-and your toplevel .config to a machine that has an internet-connection
-and issue "make source" there, then copy the content of your dl/ dir to
-the build-host.
-
-Building out-of-tree:
-=====================
-
-Buildroot supports building out of tree with a syntax similar
-to the Linux kernel. To use it, add O=<directory> to the
-make command line, E.G.:
-
-$ make O=/tmp/build
-
-And all the output files (including .config) will be located under /tmp/build.
-
-More finegrained configuration:
-===============================
-
-You can specify a config-file for uClibc:
-$ make UCLIBC_CONFIG_FILE=/my/uClibc.config
-
-And you can specify a config-file for busybox:
-$ make BUSYBOX_CONFIG_FILE=/my/busybox.config
-
-To use a non-standard host-compiler (if you do not have 'gcc'),
-make sure that the compiler is in your PATH and that the library paths are
-setup properly, if your compiler is built dynamically:
-$ make HOSTCC=gcc-4.3.orig HOSTCXX=gcc-4.3-mine
-
-Depending on your configuration, there are some targets you can use to
-use menuconfig of certain packages. This includes:
-$ make HOSTCC=gcc-4.3 linux-menuconfig
-$ make HOSTCC=gcc-4.3 uclibc-menuconfig
-$ make HOSTCC=gcc-4.3 busybox-menuconfig
-
 Please feed suggestions, bug reports, insults, and bribes back to the
 buildroot mailing list: buildroot at buildroot.org
+You can also find us on #buildroot on Freenode IRC.
-- 
2.1.4
