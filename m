From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 Nov 2013 11:05:12 +0100
Subject: [Buildroot] [git commit] tinymembench: not supported on MIPS n32/64
	ABIs
Message-ID: <20131125100535.C51EC9BDDF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ee40f4f7a0100dab087fabd514733c4cb8efc28a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is a fix for 9883cbd3678be65bdca10a124ba6cb7fd1f008d3. After deeper
testing we have found that package is supported on MIPS64, but only for
o32 ABI.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Reviewed-by: Markos Chandras <markos.chandras@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tinymembench/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/tinymembench/Config.in b/package/tinymembench/Config.in
index 0555b19..7e8aaf5 100644
--- a/package/tinymembench/Config.in
+++ b/package/tinymembench/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_TINYMEMBENCH
 	bool "tinymembench"
-	depends on !BR2_mips64 && !BR2_mips64el
+	depends on !BR2_MIPS_NABI32 && !BR_MIPS_NABI64
 	help
 	  Tinymembench is a simple memory benchmark program, which
 	  tries to measure the peak bandwidth of sequential memory
