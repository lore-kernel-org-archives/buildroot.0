From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Oct 2016 15:01:45 +0200
Subject: [Buildroot] [git commit] Revert "Revert "texinfo: new host package""
Message-ID: <20161009130312.06C3F81D4F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b566ffb2d45266a4b5c40244b3752ed03a6a2927
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 79c8abdad7c997c1815c682859acfcf76ee619a8.

The change in the binutils package to avoid the texinfo dependency broke
the toolchain build.

See:

  http://autobuild.buildroot.net/results/90d0537bc12cbb2a7c6d344b3c6c9e1a5046d791/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/texinfo/texinfo.hash |  2 ++
 package/texinfo/texinfo.mk   | 13 +++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/package/texinfo/texinfo.hash b/package/texinfo/texinfo.hash
new file mode 100644
index 0000000..4bdf343
--- /dev/null
+++ b/package/texinfo/texinfo.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 ac68394ce21b2420ba7ed7cec65d84aacf308cc88e9bf4716fcfff88286883d2 texinfo-6.1.tar.xz
diff --git a/package/texinfo/texinfo.mk b/package/texinfo/texinfo.mk
new file mode 100644
index 0000000..ebd0b48
--- /dev/null
+++ b/package/texinfo/texinfo.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# texinfo
+#
+################################################################################
+
+TEXINFO_VERSION = 6.1
+TEXINFO_SITE = $(BR2_GNU_MIRROR)/texinfo
+TEXINFO_SOURCE = texinfo-$(TEXINFO_VERSION).tar.xz
+TEXINFO_LICENSE = GPLv3+
+TEXINFO_LICENSE_FILES = COPYING
+
+$(eval $(host-autotools-package))
