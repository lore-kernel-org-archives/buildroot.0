From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Mar 2015 16:45:52 +0100
Subject: [Buildroot] [git commit] package/uclibc: fix linuxthreads symbol
	typos
Message-ID: <20150320154559.7120A818AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c34f42ace6ba34ea25046aa59891df9f147c7ac9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

BR2_UCLIBC_VERSION_XTENSA_GIT and BR2_UCLIBC_VERSION_SNAPSHOT select
BR2_UCLIBC_SUPPORTS_* instead of new BR2_UCLIBC_VERSION_SUPPORTS_*.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uclibc/Config.in |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 56fea8a..3a6525b 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -49,12 +49,12 @@ choice
 	config BR2_UCLIBC_VERSION_XTENSA_GIT
 		bool "uClibc Git Xtensa"
 		depends on BR2_xtensa
-		select BR2_UCLIBC_SUPPORTS_LINUXTHREADS_OLD
+		select BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS_OLD
 
 	config BR2_UCLIBC_VERSION_SNAPSHOT
 		bool "daily snapshot"
-		select BR2_UCLIBC_SUPPORTS_LINUXTHREADS if !BR2_bfin && !BR2_xtensa
-		select BR2_UCLIBC_SUPPORTS_LINUXTHREADS_OLD
+		select BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS if !BR2_bfin && !BR2_xtensa
+		select BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS_OLD
 		select BR2_UCLIBC_VERSION_SUPPORTS_NPTL \
 		       if !BR2_bfin && !BR2_x86_i386 && !BR2_xtensa
 		depends on !(BR2_arc)
