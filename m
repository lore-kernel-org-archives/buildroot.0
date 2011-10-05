From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 5 Oct 2011 16:58:55 +0200
Subject: [Buildroot] [git commit] gdb: add 7.2a version
Message-ID: <20111005150455.167AC8DEC9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=228bde4dbe81254785ffa9986c81c79f5567c241
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/gdb/Config.in |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/toolchain/gdb/Config.in b/toolchain/gdb/Config.in
index a5dc71c..e593698 100644
--- a/toolchain/gdb/Config.in
+++ b/toolchain/gdb/Config.in
@@ -57,6 +57,11 @@ choice
 		depends on !BR2_bfin
 		select BR2_PTHREAD_DEBUG if !BR2_PTHREADS_NONE
 
+	config BR2_GDB_VERSION_7_2
+		bool "gdb 7.2.x"
+		depends on !BR2_bfin
+		select BR2_PTHREAD_DEBUG if !BR2_PTHREADS_NONE
+
 	config BR2_GDB_VERSION_7_3
 		bool "gdb 7.3.x"
 		depends on !BR2_bfin
@@ -71,4 +76,5 @@ config BR2_GDB_VERSION
 	default "6.8a"     if BR2_GDB_VERSION_6_8
 	default "7.0.1a"   if BR2_GDB_VERSION_7_0_1
 	default "7.1a"     if BR2_GDB_VERSION_7_1
+	default "7.2a"     if BR2_GDB_VERSION_7_2
 	default "7.3.1"    if BR2_GDB_VERSION_7_3
