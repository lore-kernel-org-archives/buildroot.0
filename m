From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Apr 2015 09:44:08 +0200
Subject: [Buildroot] [git commit] libtirpc: fix build failure after non-IPv6
	disabled
Message-ID: <20150423074852.0712F81DAB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=723151f93c57bbd08b9f86a6ce7b14b6f79894e0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adjust patch 0005 to account for the removed optional IPv6 support
patch, since otherwise it won't apply. Fixes:
http://autobuild.buildroot.net/results/0ad/0ad8c9e331190f72280c3a1e3cd8d42728f818de/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...ly-generate-XDR-header-files-from-.x-sour.patch |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/libtirpc/0005-Automatically-generate-XDR-header-files-from-.x-sour.patch b/package/libtirpc/0005-Automatically-generate-XDR-header-files-from-.x-sour.patch
index 3c1c82d..023abd1 100644
--- a/package/libtirpc/0005-Automatically-generate-XDR-header-files-from-.x-sour.patch
+++ b/package/libtirpc/0005-Automatically-generate-XDR-header-files-from-.x-sour.patch
@@ -4,6 +4,7 @@ Date: Sat, 10 Nov 2012 17:29:53 +0100
 Subject: [PATCH] Automatically generate XDR header files from .x sources using
  rpcgen
 
+[Gustavo: update after dropping non-IPv6 support]
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 ---
  Makefile.am           |  22 +-
@@ -75,7 +76,7 @@ index f086255..a9db71b 100644
 @@ -8,7 +8,7 @@
  noinst_HEADERS = rpc_com.h
  
- AM_CPPFLAGS = -I$(top_srcdir)/tirpc -DPORTMAP \
+ AM_CPPFLAGS = -I$(top_srcdir)/tirpc -DPORTMAP -DINET6 \
 -		-D_GNU_SOURCE -Wall -pipe  
 +		-D_GNU_SOURCE -Wall -pipe -I$(top_builddir)/tirpc
  
