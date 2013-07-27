From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Jul 2013 16:11:40 +0200
Subject: [Buildroot] [git commit] uclibc: reorder list of dependencies for
	NPTL option
Message-ID: <20130727141206.16A009AC10@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dbee13b527d342ecb3cdd86d093ed40f1f03995d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uclibc/Config.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 094ea11..17176f6 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -115,11 +115,11 @@ choice
 	config BR2_PTHREADS_NATIVE
 		bool "Native POSIX Threading (NPTL)"
 		select BR2_TOOLCHAIN_HAS_THREADS
-		depends on !BR2_x86_i386
+		depends on !BR2_arc
 		depends on !BR2_avr32
 		depends on !BR2_bfin
 		depends on !BR2_xtensa
-		depends on !BR2_arc
+		depends on !BR2_x86_i386
 endchoice
 
 config BR2_PTHREAD_DEBUG
