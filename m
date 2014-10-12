From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Oct 2014 14:58:54 +0200
Subject: [Buildroot] [git commit] package/Makefile.in: Fix dependency for
	selecting uclinux as TARGET_OS
Message-ID: <20141012130031.4B4C6B228A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3c25f6e6c0a57daac4786dbdf2f0242273641566
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Current setting only allows blackfin to select uclinux as TARGET_OS.
However, some noMMU ARM platforms that using FLAT binary format also need to
select uclinux as TARGET_OS. Fix the dependency.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Makefile.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 7d9943c..28a5bfd 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -38,8 +38,8 @@ endif
 # Compute GNU_TARGET_NAME
 GNU_TARGET_NAME = $(ARCH)-$(TARGET_VENDOR)-$(TARGET_OS)-$(LIBC)$(ABI)
 
-# Blackfin FLAT needs uclinux
-ifeq ($(BR2_bfin)$(BR2_BINFMT_FLAT),yy)
+# FLAT binary format needs uclinux
+ifeq ($(BR2_BINFMT_FLAT),y)
 TARGET_OS = uclinux
 else
 TARGET_OS = linux
