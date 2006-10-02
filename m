From: Andrew E. Mileski <andrewm@isoar.ca>
Date: Mon, 02 Oct 2006 13:52:43 -0400
Subject: [Buildroot] Bad architecture in xorg.mk
Message-ID: <452151EB.9020105@isoar.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This looks like a typo to me.  Without this patch, one ends up with
"i386AArchitecture" being defined, which doesn't match anything.

Index: xorg.mk
===================================================================
--- xorg.mk     (revision 16287)
+++ xorg.mk     (working copy)
@@ -59,7 +59,7 @@
  XARCH=Arm32
  endif
  ifeq ($(BR2_i386),y)
-XARCH=i386A
+XARCH=i386
  endif
  ifeq ($(BR2_mips),y)
  XARCH=Mips

-- 
Andrew E. Mileski
