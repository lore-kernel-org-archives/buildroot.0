From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Apr 2014 20:59:14 +0200
Subject: [Buildroot] [git commit] libsigsegv: not available on Microblaze
Message-ID: <20140416185941.EA6D99C80F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2b4b0ce9f2a51e8c1d3d467b7360668baa9a4ae8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

  http://autobuild.buildroot.org/results/dd5/dd583e1c11bba814cd0f124eeeffeca5657a0aa9/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libsigsegv/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/libsigsegv/Config.in b/package/libsigsegv/Config.in
index 4890552..2ca9a28 100644
--- a/package/libsigsegv/Config.in
+++ b/package/libsigsegv/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_LIBSIGSEGV
 	bool "libsigsegv"
 	depends on !BR2_xtensa
 	depends on !BR2_arc # no ucontext_i.sym file
+	depends on !BR2_microblaze
 	help
 	  Library for handling page faults in user mode.
 
