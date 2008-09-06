From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat,  6 Sep 2008 15:39:58 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/audio/speex
Message-ID: <20080906223958.F240F3C683@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-09-06 15:39:58 -0700 (Sat, 06 Sep 2008)
New Revision: 23350

Log:
speex: fix paths (broken by r23330)

Patch by Markus Heidelberg <markus.heidelberg@web.de>

Modified:
   trunk/buildroot/package/audio/speex/speex.mk


Changeset:
Modified: trunk/buildroot/package/audio/speex/speex.mk
===================================================================
--- trunk/buildroot/package/audio/speex/speex.mk	2008-09-06 20:49:40 UTC (rev 23349)
+++ trunk/buildroot/package/audio/speex/speex.mk	2008-09-06 22:39:58 UTC (rev 23350)
@@ -23,7 +23,7 @@
 	SPEEX_CONF_OPT += --enable-arm5e-asm
 endif
 
-$(eval $(call AUTOTARGETS,package,speex))
+$(eval $(call AUTOTARGETS,package/audio,speex))
 
 $(SPEEX_TARGET_BUILD): $(SPEEX_TARGET_CONFIGURE)
 	$(call MESSAGE,"Building")
