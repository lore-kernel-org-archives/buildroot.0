From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 26 Jul 2010 16:51:26 +0200
Subject: [Buildroot] [PATCH 1/1] Deprecate the Alpha, IA64,
	Sparc and Sparc64 support
In-Reply-To: <cover.1280155876.git.thomas.petazzoni@free-electrons.com>
References: <cover.1280155876.git.thomas.petazzoni@free-electrons.com>
Message-ID: <59f8b962e83de5bd5e13a6eb58530634e5701f0f.1280155876.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Those architectures don't exist anymore (Alpha, IA64) or aren't widely
used for embedded systems running Linux. Moreover, no clear Buildroot
maintainer has stepped in to maintain these architectures, so it's
better to not pretend that we support them.

The goal is to mark them as deprecated in 2010.08 and remove them in
2010.11.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 target/Config.in.arch |   16 ++++++++++++++++
 1 files changed, 16 insertions(+), 0 deletions(-)

diff --git a/target/Config.in.arch b/target/Config.in.arch
index 62721c9..726d843 100644
--- a/target/Config.in.arch
+++ b/target/Config.in.arch
@@ -6,6 +6,9 @@ choice
 
 config BR2_alpha
 	bool "alpha"
+	# Alpha does not exist anymore and has never been used in
+	# embedded systems, so we'll remove support for it.
+	depends on BR2_DEPRECATED
 	depends on BROKEN # no threads, shared libs, gcc psignal compile errors
 config BR2_arm
 	bool "arm"
@@ -18,6 +21,9 @@ config BR2_cris
 	bool "cris"
 config BR2_ia64
 	bool "ia64"
+	# IA64 almost does not exist anymore and has never been used
+	# in embedded systems, so we'll remove support for it.
+	depends on BR2_DEPRECATED
 	depends on BROKEN # uclibc linker errors
 config BR2_i386
 	bool "i386"
@@ -35,8 +41,18 @@ config BR2_sh
 config BR2_sh64
 	bool "superh64"
 config BR2_sparc
+	# Sparc isn't really used in embedded systems, and in the
+	# cases where it is used, Linux doesn't seem to be common, and
+	# as of today we don't have a maintainer in Buildroot who
+	# wants to take care of the sparc support.
+	depends on BR2_DEPRECATED
 	bool "sparc"
 config BR2_sparc64
+	# Sparc64 isn't really used in embedded systems, and in the
+	# cases where it is used, Linux doesn't seem to be common, and
+	# as of today we don't have a maintainer in Buildroot who
+	# wants to take care of the sparc support.
+	depends on BR2_DEPRECATED
 	bool "sparc64"
 config BR2_x86_64
 	bool "x86_64"
-- 
1.7.0.4
