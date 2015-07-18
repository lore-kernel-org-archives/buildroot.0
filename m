From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Jul 2015 19:20:49 +0200
Subject: [Buildroot] [git commit] cpio: needs wchar support
Message-ID: <20150718172119.C4D6B80056@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6c7d490558498888a783fe3ca53f1a3b6cef1b16
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Spotted during package review/testing, but forgot to squash it in the
original patch.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cpio/Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/cpio/Config.in b/package/cpio/Config.in
index 1787f39..df40fac 100644
--- a/package/cpio/Config.in
+++ b/package/cpio/Config.in
@@ -2,7 +2,11 @@ config BR2_PACKAGE_CPIO
 	bool "cpio"
 	# Need argp.h support
 	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC
+	depends on BR2_USE_WCHAR
 	help
 	  cpio archive utility for creation and extraction.
 
 	  https://www.gnu.org/software/cpio/
+
+comment "cpio needs a toolchain w/ wchar"
+	depends on !BR2_USE_WCHAR
