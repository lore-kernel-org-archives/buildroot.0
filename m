From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 27 Jul 2010 23:23:42 +0200
Subject: [Buildroot] [git commit master 1/1] Deprecate the Alpha,
	IA64 and Sparc64 support
Message-ID: <20100727212352.3284982579@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=a563a663471ed1e3a8344b27255850e7c7094a23
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Those architectures don't exist anymore (Alpha, IA64) or aren't widely
used for embedded systems running Linux. Moreover, no clear Buildroot
maintainer has stepped in to maintain these architectures, so it's
better to not pretend that we support them.

The goal is to mark them as deprecated in 2010.08 and remove them in
2010.11.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES               |    4 ++++
 target/Config.in.arch |   11 +++++++++++
 2 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/CHANGES b/CHANGES
index def806b..8a8c8bb 100644
--- a/CHANGES
+++ b/CHANGES
@@ -15,6 +15,10 @@
 	support this, they will be removed during the 2010.11
 	development cycle.
 
+	Alpha, IA64 and Sparc64 architectures marked as deprecated.
+	Unless someone steps up to support them, they will be removed
+	during the 2010.11 development cycle.
+
 	New packages: cgilua, copas, coxpcall, ffmpeg, libsvgtiny,
 	luafilesystem, luasocket, rings, wsapi, xavante, xterm
 
diff --git a/target/Config.in.arch b/target/Config.in.arch
index 3efebb8..d3a4025 100644
--- a/target/Config.in.arch
+++ b/target/Config.in.arch
@@ -9,6 +9,9 @@ choice
 
 config BR2_alpha
 	bool "alpha"
+	# Alpha does not exist anymore and has never been used in
+	# embedded systems, so we'll remove support for it.
+	depends on BR2_DEPRECATED
 	depends on BROKEN # no threads, shared libs, gcc psignal compile errors
 config BR2_arm
 	bool "arm"
@@ -21,6 +24,9 @@ config BR2_cris
 	bool "cris"
 config BR2_ia64
 	bool "ia64"
+	# IA64 almost does not exist anymore and has never been used
+	# in embedded systems, so we'll remove support for it.
+	depends on BR2_DEPRECATED
 	depends on BROKEN # uclibc linker errors
 config BR2_i386
 	bool "i386"
@@ -40,6 +46,11 @@ config BR2_sh64
 config BR2_sparc
 	bool "sparc"
 config BR2_sparc64
+	# Sparc64 isn't really used in embedded systems, and in the
+	# cases where it is used, Linux doesn't seem to be common, and
+	# as of today we don't have a maintainer in Buildroot who
+	# wants to take care of the sparc support.
+	depends on BR2_DEPRECATED
 	bool "sparc64"
 	select BR2_ARCH_IS_64
 config BR2_x86_64
-- 
1.7.1
