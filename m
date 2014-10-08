From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  8 Oct 2014 22:16:50 +0200
Subject: [Buildroot] [PATCH 2/2] docs/manual: add FAQ entry about speeding
	up the build process
In-Reply-To: <1412799410-19667-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1412799410-19667-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1412799410-19667-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a very frequently asked question, so let's add a FAQ entry
about it, that we can progressively extend with more advices for our
users.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/faq-troubleshooting.txt | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/docs/manual/faq-troubleshooting.txt b/docs/manual/faq-troubleshooting.txt
index 693028c..9325ac0 100644
--- a/docs/manual/faq-troubleshooting.txt
+++ b/docs/manual/faq-troubleshooting.txt
@@ -205,3 +205,37 @@ On this matter, the Buildroot developers make this position statement:
    upgrades by upgrading the entire root filesystem image at once,
    the image deployed to the embedded system is guaranteed to really
    be the one that has been tested and validated.
+
+[[faq-speeding-up-build]]
+=== How to speed-up the build process?
+
+Since Buildroot often involves doing full rebuilds of the entire
+system that can be quite long, we provide below a number of tips to
+help reduce the build time:
+
+ * Use a pre-built external toolchain instead of the default Buildroot
+   internal toolchain. By using a pre-built Linaro toolchain (on ARM)
+   or a Sourcery CodeBench toolchain (for ARM, x86, x86-64, MIPS,
+   etc.), you will the build time of the toolchain at each build,
+   approximately 15 to 20 minutes. Note that using an external
+   toolchain temporarily does not prevent you to switch back to an
+   internal toolchain (that may provide a higher level of
+   customization) once the rest of your system is working;
+
+ * Use the +ccache+ compiler cache (see: xref:ccache[]);
+
+ * Learn about rebuilding only the few packages you actually care
+   about (see xref:rebuild-pkg[]), but beware that sometimes full
+   rebuilds are anyway necessary (see xref:full-rebuild[]);
+
+ * Make sure you are not using a virtual machine for the Linux system
+   used to run Buildroot. Most of the virtual machine technologies are
+   known to cause a significant performance impact on I/O, which is
+   really important for building source code;
+
+ * Make sure that you're using only local files: do not attempt to do
+   a build over NFS, or to keep the Buildroot download folder over
+   NFS. This significantly slows down the build;
+
+ * Buy (or convince your boss to) new hardware. SSDs and lots of RAM
+   are key to speeding up the builds.
-- 
2.0.0
