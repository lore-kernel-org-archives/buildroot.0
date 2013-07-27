From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Jul 2013 16:11:40 +0200
Subject: [Buildroot] [git commit] uclibc/bfin: only supports linuxthreads.old
Message-ID: <20130727141206.0923F9AC10@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=04f0d1379c11a98dc43df4ab70a87c0651c75310
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: do not reorder options, as this is a separate change]
Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uclibc/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 90aae90..094ea11 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -104,6 +104,7 @@ choice
 
 	config BR2_PTHREADS
 		bool "linuxthreads"
+		depends on !BR2_bfin
 		depends on !BR2_xtensa
 	        select BR2_TOOLCHAIN_HAS_THREADS
 
@@ -116,6 +117,7 @@ choice
 		select BR2_TOOLCHAIN_HAS_THREADS
 		depends on !BR2_x86_i386
 		depends on !BR2_avr32
+		depends on !BR2_bfin
 		depends on !BR2_xtensa
 		depends on !BR2_arc
 endchoice
