From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Nov 2013 15:58:39 +0100
Subject: [Buildroot] [git commit] tinymembench: package not supported on
	MIPS64
Message-ID: <20131122145921.22CF39BD8F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9883cbd3678be65bdca10a124ba6cb7fd1f008d3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

   http://autobuild.buildroot.net/results/bab/bab68bcf8714f215ac0b0c2546fa06608377fbb0/

This package is only supported on MIPS32 platforms. The mips-32.S file
included in the source code of this package only makes sense to be compiled
for MIPS32, and also contains hardcoded MIPS32 instructions which are
illegal on MIPS64.  Trying to compile this package on a MIPS64 platform will
end with a linkage failure due to undefined references.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Reviewed-by: Markos Chandras <markos.chandras@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tinymembench/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/tinymembench/Config.in b/package/tinymembench/Config.in
index 0d45532..0555b19 100644
--- a/package/tinymembench/Config.in
+++ b/package/tinymembench/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_TINYMEMBENCH
 	bool "tinymembench"
+	depends on !BR2_mips64 && !BR2_mips64el
 	help
 	  Tinymembench is a simple memory benchmark program, which
 	  tries to measure the peak bandwidth of sequential memory
