From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Sat, 6 Sep 2008 23:44:19 +0200
Subject: [Buildroot] [PATCH] svn commit: trunk/buildroot/package: audio
In-Reply-To: <87wshpvvxa.fsf@macbook.be.48ers.dk>
References: <20080905120650.45FB73C67A@busybox.net>
	<87wshpvvxa.fsf@macbook.be.48ers.dk>
Message-ID: <200809062344.19860.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard, 06.09.2008:
> >>>>> "laird" == laird  <laird@uclibc.org> writes:
> 
>  laird> Author: laird
>  laird> Date: 2008-09-05 05:06:50 -0700 (Fri, 05 Sep 2008)
>  laird> New Revision: 23330
> 
>  laird> Log:
>  laird> audio: Move all audio packages into audio subdir
> 
> Argh, that was pretty broken. Please test your changes and be more
> careful next time.

Another one, but this is the last one.


diff --git a/package/audio/speex/speex.mk b/package/audio/speex/speex.mk
index 0ffd203..31b0b63 100644
--- a/package/audio/speex/speex.mk
+++ b/package/audio/speex/speex.mk
@@ -23,7 +23,7 @@ ifeq ($(BR2_PACKAGE_SPEEX_ARM5E),y)
 	SPEEX_CONF_OPT += --enable-arm5e-asm
 endif
 
-$(eval $(call AUTOTARGETS,package,speex))
+$(eval $(call AUTOTARGETS,package/audio,speex))
 
 $(SPEEX_TARGET_BUILD): $(SPEEX_TARGET_CONFIGURE)
 	$(call MESSAGE,"Building")
