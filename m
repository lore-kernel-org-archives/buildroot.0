Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75FABCA1017
	for <buildroot@archiver.kernel.org>; Sat,  6 Sep 2025 17:02:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33C4282265;
	Sat,  6 Sep 2025 17:02:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z0NmXtEbc2U5; Sat,  6 Sep 2025 17:02:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE9D283D36
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE9D283D36;
	Sat,  6 Sep 2025 17:02:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B0C51E0E
 for <buildroot@buildroot.org>; Sat,  6 Sep 2025 17:02:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 97A8E412B7
 for <buildroot@buildroot.org>; Sat,  6 Sep 2025 17:02:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GXChTCQC4eaI for <buildroot@buildroot.org>;
 Sat,  6 Sep 2025 17:02:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BFE2412A3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3BFE2412A3
 for <buildroot@buildroot.org>; Sat,  6 Sep 2025 17:02:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 34D04835F4; Sat,  6 Sep 2025 17:02:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 6 Sep 2025 18:57:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d0fbebd52eb4ef517999bc466ee13a962f8fba61
X-Git-Newrev: 70cefcac9e83128275d044f07df049dc42b0c97c
X-Patchwork-Hint: ignore
Message-Id: <20250906170220.34D04835F4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iozone: bump to version 3.508
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=70cefcac9e83128275d044f07df049dc42b0c97c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

iozone releases 3.507 and 3.508 seems to be only build fixes releases
for latest GCC compiler version but since there is no public vcs
it's not easy to review the history between releases and backport
any patches.

Based on the changelog from [1]:

  Revision 3.507
  Fix GCC compile warnings.

  Revision 3.508
  Put an end to the (&*% stupid GCC breaking builds for no valid reason.

So bump to the latest 508 release.

Rebase 0001-Add-new-targets-for-iozone.patch
Rebase 0002-fix-build-without-aio.patch and convert to git format

The TestIozone build issue is not yet fixed by the version bump [2].

[1] https://www.iozone.org/src/current/Changes.txt
[2] https://gitlab.com/buildroot.org/buildroot/-/jobs/11176774405

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../iozone/0001-Add-new-targets-for-iozone.patch   | 24 +++++----
 ...patch => 0002-Fix-build-without-ASYNC_IO.patch} | 63 +++++++++++++---------
 package/iozone/iozone.hash                         |  2 +-
 package/iozone/iozone.mk                           |  2 +-
 4 files changed, 54 insertions(+), 37 deletions(-)

diff --git a/package/iozone/0001-Add-new-targets-for-iozone.patch b/package/iozone/0001-Add-new-targets-for-iozone.patch
index 3cc184ec8f..585f128724 100644
--- a/package/iozone/0001-Add-new-targets-for-iozone.patch
+++ b/package/iozone/0001-Add-new-targets-for-iozone.patch
@@ -1,4 +1,4 @@
-From 5b1e973b2333e838624abf195b3ba9716591f304 Mon Sep 17 00:00:00 2001
+From 015b6fa0c4a503ae822e6cf787de82e09bc44511 Mon Sep 17 00:00:00 2001
 From: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Date: Sun, 10 Oct 2021 10:15:26 +0200
 Subject: [PATCH] Add new targets for iozone:
@@ -10,12 +10,14 @@ And make largefile support optional via CFLAGS.
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
+[Romain: rebase on 3.508]
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
 ---
  src/current/makefile | 56 +++++++++++++++++++++++++++++++++++++-------
  1 file changed, 47 insertions(+), 9 deletions(-)
 
 diff --git a/src/current/makefile b/src/current/makefile
-index 3a54701..3b17b1b 100644
+index 24a391e..bd66a4e 100755
 --- a/src/current/makefile
 +++ b/src/current/makefile
 @@ -172,10 +172,28 @@ hpux_no_ansi:	iozone_hpux_no.o  libbif.o
@@ -54,15 +56,15 @@ index 3a54701..3b17b1b 100644
  	@echo ""
  	@echo "Building iozone for Linux"
  	@echo ""
--	$(CC) -Wmissing-prototypes -Wall -c -O3 -Dunix -DHAVE_ANSIC_C -DASYNC_IO -DHAVE_PREAD \
+-	$(CC) -Wmissing-prototypes -c -O3 -Dunix -DHAVE_ANSIC_C -DASYNC_IO -DHAVE_PREAD \
 -		-DSHARED_MEM -Dlinux -D_LARGEFILE64_SOURCE $(CFLAGS) iozone.c \
-+	$(CC) -Wmissing-prototypes -Wall -c -Dunix -DHAVE_ANSIC_C -DASYNC_IO -DHAVE_PREAD \
++	$(CC) -Wmissing-prototypes -c -Dunix -DHAVE_ANSIC_C -DASYNC_IO -DHAVE_PREAD \
 +		-DSHARED_MEM -Dlinux $(CFLAGS) iozone.c \
  		-DNAME='"linux"' -o iozone_linux.o
--	$(CC) -Wmissing-prototypes -Wall -c -O3 -Dunix -DHAVE_ANSIC_C -DASYNC_IO -D_LARGEFILE64_SOURCE \
-+	$(CC) -Wmissing-prototypes -Wall -c -Dunix -DHAVE_ANSIC_C -DASYNC_IO \
+-	$(CC) -Wmissing-prototypes -c -O3 -Dunix -DHAVE_ANSIC_C -DASYNC_IO -D_LARGEFILE64_SOURCE \
++	$(CC) -Wmissing-prototypes -c -Dunix -DHAVE_ANSIC_C -DASYNC_IO \
 +		-DSHARED_MEM -Dlinux $(CFLAGS) libbif.c -o libbif.o
-+	$(CC) -Wmissing-prototypes -Wall -c -Dunix -Dlinux -DHAVE_ANSIC_C -DASYNC_IO \
++	$(CC) -Wmissing-prototypes -c -Dunix -Dlinux -DHAVE_ANSIC_C -DASYNC_IO \
 +		$(CFLAGS) libasync.c  -o libasync.o
 +
 +iozone_linux-noaio.o: iozone.c libbif.c
@@ -84,7 +86,7 @@ index 3a54701..3b17b1b 100644
 +		-DNAME='"linux"' -o iozone_linux-noth.o
 +	$(CC) -Wmissing-prototypes -Wall -c -Dunix -DHAVE_ANSIC_C -DNO_THREADS \
  		-DSHARED_MEM -Dlinux $(CFLAGS) libbif.c -o libbif.o
--	$(CC) -Wmissing-prototypes -Wall -c -O3 -Dunix -Dlinux -DHAVE_ANSIC_C -DASYNC_IO \
+-	$(CC) -Wmissing-prototypes -c -O3 -Dunix -Dlinux -DHAVE_ANSIC_C -DASYNC_IO \
 -		-D_LARGEFILE64_SOURCE $(CFLAGS) libasync.c  -o libasync.o 
  
  fileop_AIX.o:	fileop.c
@@ -93,11 +95,11 @@ index 3a54701..3b17b1b 100644
  	@echo ""
  	@echo "Building fileop for Linux"
  	@echo ""
--	$(CC) -Wall -c -O3 $(CFLAGS) fileop.c -o fileop_linux.o
-+	$(CC) -Wall -c $(CFLAGS) fileop.c -o fileop_linux.o
+-	$(CC) -c -O3 $(CFLAGS) fileop.c -o fileop_linux.o
++	$(CC) -c $(CFLAGS) fileop.c -o fileop_linux.o
  
  fileop_openbsd.o:	fileop.c
  	@echo ""
 -- 
-2.27.0
+2.51.0
 
diff --git a/package/iozone/0002-fix-build-without-aio.patch b/package/iozone/0002-Fix-build-without-ASYNC_IO.patch
similarity index 64%
rename from package/iozone/0002-fix-build-without-aio.patch
rename to package/iozone/0002-Fix-build-without-ASYNC_IO.patch
index 8b54bef4e1..92621e5242 100644
--- a/package/iozone/0002-fix-build-without-aio.patch
+++ b/package/iozone/0002-Fix-build-without-ASYNC_IO.patch
@@ -1,4 +1,7 @@
-Fix build without ASYNC_IO
+From cdd5e78a275c8cda5d48d15acc96c3be5170bf2f Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@smile.fr>
+Date: Sat, 6 Sep 2025 00:26:00 +0200
+Subject: [PATCH] Fix build without ASYNC_IO
 
 Fix the following build failure without ASYNC_IO:
 
@@ -10,11 +13,20 @@ Fixes:
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Upstream: sent to capps@iozone.org
+[Romain:
+  rebase on 3.508
+  convert to git format
+]
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ src/current/iozone.c | 20 ++++++++++++++++++++
+ 1 file changed, 20 insertions(+)
 
-diff '--color=auto' -Nura iozone3_506.orig/src/current/iozone.c iozone3_506/src/current/iozone.c
---- iozone3_506.orig/src/current/iozone.c	2024-03-06 12:28:16.734023725 +0100
-+++ iozone3_506/src/current/iozone.c	2024-03-06 12:39:14.453991162 +0100
-@@ -9153,6 +9153,7 @@
+diff --git a/src/current/iozone.c b/src/current/iozone.c
+index 6657a9b..8de26cf 100755
+--- a/src/current/iozone.c
++++ b/src/current/iozone.c
+@@ -9196,6 +9196,7 @@ long long *data1,*data2;
  				}
  			  }
  			}
@@ -22,7 +34,7 @@ diff '--color=auto' -Nura iozone3_506.orig/src/current/iozone.c iozone3_506/src/
  			if(async_flag)
  			{
  				if(no_copy_flag)
-@@ -9160,6 +9161,7 @@
+@@ -9203,6 +9204,7 @@ long long *data1,*data2;
  				end_async(gc);
  				gc=0;
  			}
@@ -30,7 +42,7 @@ diff '--color=auto' -Nura iozone3_506.orig/src/current/iozone.c iozone3_506/src/
  			buffer1=0;
  			if(hist_summary)
  			{
-@@ -9634,6 +9636,7 @@
+@@ -9677,6 +9679,7 @@ long long *data1, *data2;
  				}
  			  }
  			}
@@ -38,7 +50,7 @@ diff '--color=auto' -Nura iozone3_506.orig/src/current/iozone.c iozone3_506/src/
  			if(async_flag)
  			{
  				if(no_copy_flag)
-@@ -9641,6 +9644,7 @@
+@@ -9684,6 +9687,7 @@ long long *data1, *data2;
  				end_async(gc);
  				gc=0;
  			}
@@ -46,7 +58,7 @@ diff '--color=auto' -Nura iozone3_506.orig/src/current/iozone.c iozone3_506/src/
  			if(rlocking)
  			{
  				lock_offset=I_LSEEK(fd,0,SEEK_CUR);
-@@ -10097,6 +10101,7 @@
+@@ -10140,6 +10144,7 @@ long long *data1,*data2;
  				}
  			   }
  			}
@@ -54,7 +66,7 @@ diff '--color=auto' -Nura iozone3_506.orig/src/current/iozone.c iozone3_506/src/
  			if(async_flag)
  			{
  				if(no_copy_flag)
-@@ -10104,6 +10109,7 @@
+@@ -10147,6 +10152,7 @@ long long *data1,*data2;
  				end_async(gc);
  				gc=0;
  			}
@@ -62,7 +74,7 @@ diff '--color=auto' -Nura iozone3_506.orig/src/current/iozone.c iozone3_506/src/
  			if(rlocking)
  			{
  				mylockr((int) fd, (int) 0, (int)1,
-@@ -10749,6 +10755,7 @@
+@@ -10792,6 +10798,7 @@ printf("Read_Stride\n");
  			   }
  			}
  		}
@@ -70,7 +82,7 @@ diff '--color=auto' -Nura iozone3_506.orig/src/current/iozone.c iozone3_506/src/
  		if(async_flag)
  		{
  			if(no_copy_flag)
-@@ -10756,6 +10763,7 @@
+@@ -10799,6 +10806,7 @@ printf("Read_Stride\n");
  			end_async(gc);
  			gc=0;
  		}
@@ -78,7 +90,7 @@ diff '--color=auto' -Nura iozone3_506.orig/src/current/iozone.c iozone3_506/src/
  			
  		/* This is a bit tricky.  The goal is to read with a stride through
  		   the file. The problem is that you need to touch all of the file
-@@ -15485,6 +15493,7 @@
+@@ -15528,6 +15536,7 @@ thread_read_test(x)
  			   }
  		   }
  		}
@@ -86,7 +98,7 @@ diff '--color=auto' -Nura iozone3_506.orig/src/current/iozone.c iozone3_506/src/
  		if(async_flag)
  		{
  			if(no_copy_flag)
-@@ -15492,6 +15501,7 @@
+@@ -15535,6 +15544,7 @@ thread_read_test(x)
  			end_async(gc);
  			gc=0;
  		}
@@ -94,7 +106,7 @@ diff '--color=auto' -Nura iozone3_506.orig/src/current/iozone.c iozone3_506/src/
  		read_so_far+=reclen/1024;
  		r_traj_bytes_completed+=reclen;
  		r_traj_ops_completed++;
-@@ -16050,6 +16060,7 @@
+@@ -16093,6 +16103,7 @@ thread_pread_test(x)
  			   }
  		   }
  		}
@@ -102,7 +114,7 @@ diff '--color=auto' -Nura iozone3_506.orig/src/current/iozone.c iozone3_506/src/
  		if(async_flag)
  		{
  			if(no_copy_flag)
-@@ -16057,6 +16068,7 @@
+@@ -16100,6 +16111,7 @@ thread_pread_test(x)
  			end_async(gc);
  			gc=0;
  		}
@@ -110,7 +122,7 @@ diff '--color=auto' -Nura iozone3_506.orig/src/current/iozone.c iozone3_506/src/
  		read_so_far+=reclen/1024;
  		r_traj_bytes_completed+=reclen;
  		r_traj_ops_completed++;
-@@ -16665,6 +16677,7 @@
+@@ -16708,6 +16720,7 @@ thread_rread_test(x)
  			}
  		   }
  		}
@@ -118,7 +130,7 @@ diff '--color=auto' -Nura iozone3_506.orig/src/current/iozone.c iozone3_506/src/
  		if(async_flag)
  		{
  			if(no_copy_flag)
-@@ -16672,6 +16685,7 @@
+@@ -16715,6 +16728,7 @@ thread_rread_test(x)
  			end_async(gc);
  			gc=0;
  		}
@@ -126,7 +138,7 @@ diff '--color=auto' -Nura iozone3_506.orig/src/current/iozone.c iozone3_506/src/
  		re_read_so_far+=reclen/1024;
  		r_traj_bytes_completed+=reclen;
  		r_traj_ops_completed++;
-@@ -17244,6 +17258,7 @@
+@@ -17287,6 +17301,7 @@ thread_reverse_read_test(x)
  			  lock_offset, reclen);
  		}
  		current_position+=reclen;
@@ -134,7 +146,7 @@ diff '--color=auto' -Nura iozone3_506.orig/src/current/iozone.c iozone3_506/src/
  		if(async_flag)
  		{
  			if(no_copy_flag)
-@@ -17251,6 +17266,7 @@
+@@ -17294,6 +17309,7 @@ thread_reverse_read_test(x)
  			end_async(gc);
  			gc=0;
  		}
@@ -142,7 +154,7 @@ diff '--color=auto' -Nura iozone3_506.orig/src/current/iozone.c iozone3_506/src/
  		t_offset = (off64_t)reclen*2;
  		if (!(h_flag || k_flag || mmapflag))
  		{
-@@ -17778,6 +17794,7 @@
+@@ -17821,6 +17837,7 @@ thread_stride_read_test(x)
  			}
  		   }
  		}
@@ -150,7 +162,7 @@ diff '--color=auto' -Nura iozone3_506.orig/src/current/iozone.c iozone3_506/src/
  		if(async_flag)
  		{
  			if(no_copy_flag)
-@@ -17785,6 +17802,7 @@
+@@ -17828,6 +17845,7 @@ thread_stride_read_test(x)
  			end_async(gc);
  			gc=0;
  		}
@@ -158,7 +170,7 @@ diff '--color=auto' -Nura iozone3_506.orig/src/current/iozone.c iozone3_506/src/
  		if(current_position + (stride * reclen) >= (numrecs64 * reclen)-reclen) 
  		{
  			current_position=0;
-@@ -18528,6 +18546,7 @@
+@@ -18571,6 +18589,7 @@ void *x;
  			}
  		   }
  		}
@@ -166,7 +178,7 @@ diff '--color=auto' -Nura iozone3_506.orig/src/current/iozone.c iozone3_506/src/
  		if(async_flag)
  		{
  			if(no_copy_flag)
-@@ -18535,6 +18554,7 @@
+@@ -18578,6 +18597,7 @@ void *x;
  			end_async(gc);
  			gc=0;
  		}
@@ -174,3 +186,6 @@ diff '--color=auto' -Nura iozone3_506.orig/src/current/iozone.c iozone3_506/src/
  		ranread_so_far+=reclen/1024;
  		if(*stop_flag)
  		{
+-- 
+2.51.0
+
diff --git a/package/iozone/iozone.hash b/package/iozone/iozone.hash
index 936ab5a646..1f41483b4a 100644
--- a/package/iozone/iozone.hash
+++ b/package/iozone/iozone.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  114ce5c071873b9a2c7ba6e73d05d5ef7e66564392acbfcdc0b3261db10fcbe7  iozone3_506.tar
+sha256  ee55af310a65ec97e1db214aebd75ee87f458b529cea3da37081a63974e8ace3  iozone3_508.tar
 sha256  bff7909fd698708d15613a4fb977a193cff98f44ef170c2dc1dd502974df75b2  docs/License.txt
diff --git a/package/iozone/iozone.mk b/package/iozone/iozone.mk
index b1b29d1098..07034cd96f 100644
--- a/package/iozone/iozone.mk
+++ b/package/iozone/iozone.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IOZONE_VERSION = 3.506
+IOZONE_VERSION = 3.508
 IOZONE_SOURCE = iozone$(subst .,_,$(IOZONE_VERSION)).tar
 IOZONE_SITE = http://www.iozone.org/src/current
 IOZONE_LICENSE = IOzone license (NO DERIVED WORKS ALLOWED)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
