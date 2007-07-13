From: Julien Letessier <julien.letessier@technosens.fr>
Date: Fri, 13 Jul 2007 11:59:04 +0200
Subject: [Buildroot] [PATCH] Critical typo in /Makefile
Message-ID: <f0528b5b0707130259n6132e765x28010199a1552451@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Unless I'm missing something, this is a type and it breaks everything
(in particular by adding 2 spaces at the end of $(PROJECT))


-- 
Julien Letessier
<julien.letessier@technosens.fr>

Index: Makefile
===================================================================
--- Makefile    (revision 19080)
+++ Makefile    (working copy)
@@ -156,9 +156,9 @@
 TARGETS:=uclibc
 endif

-PROJECT:=$(strip $(subst ",,$(BR2_PROJECT)))  # "))
-TARGET_HOSTNAME:=$(strip $(subst ",,$(BR2_HOSTNAME))) # " ))
-BANNER:=$(strip $(subst ",,$(BR2_BANNER))) # " ))
+PROJECT:=$(strip $(subst ",,$(BR2_PROJECT)))
+TARGET_HOSTNAME:=$(strip $(subst ",,$(BR2_HOSTNAME)))
+BANNER:=$(strip $(subst ",,$(BR2_BANNER)))


 include toolchain/Makefile.in
