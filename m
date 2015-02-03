From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Feb 2015 15:15:27 +0100
Subject: [Buildroot] [git commit] docs/manual: add FAQ entry about speeding
	up the build process
Message-ID: <20150203141530.D99F880E39@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=33712d7a7cce08b07124a37a3cdf29c5f5b6def6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is a very frequently asked question, so let's add a FAQ entry
about it, that we can progressively extend with more advices for our
users.

[Thomas: remove the part about your boss buying new hardware, as
suggested by reviewers.]

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 docs/manual/faq-troubleshooting.txt |   34 ++++++++++++++++++++++++++++++++++
 1 files changed, 34 insertions(+), 0 deletions(-)

diff --git a/docs/manual/faq-troubleshooting.txt b/docs/manual/faq-troubleshooting.txt
index b30b4ac..825899b 100644
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
+   etc.), you will save the build time of the toolchain at each
+   complete rebuild, approximately 15 to 20 minutes. Note that
+   temporarily using an external toolchain does not prevent you to
+   switch back to an internal toolchain (that may provide a higher
+   level of customization) once the rest of your system is working;
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
+   a build over NFS, which significantly slows down the build. Having
+   the Buildroot download folder available locally also helps a bit.
+
+ * Buy new hardware. SSDs and lots of RAM are key to speeding up the
+   builds.
