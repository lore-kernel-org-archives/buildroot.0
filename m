From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 26 Mar 2014 22:39:29 +0100
Subject: [Buildroot] [PATCH] Makefile: move fs/common.mk above
	external.mk
In-Reply-To: <1395583071-10016-1-git-send-email-tremyfr@yahoo.fr> (Philippe
 Reynes's message of "Sun, 23 Mar 2014 14:57:51 +0100")
References: <1395583071-10016-1-git-send-email-tremyfr@yahoo.fr>
Message-ID: <87ha6kk5bi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Philippe" == Philippe Reynes <tremyfr@yahoo.fr> writes:

 > The file external.mk was included before fs/common.mk,
 > so it was impossible to add rootfs target to external.
 > This change move fs/common.mk before external.mk, so
 > now rootfs target may be added to external.

 > Signed-off-by: Philippe Reynes <tremyfr@yahoo.fr>
 > ---
 >  Makefile |    3 +--
 >  1 files changed, 1 insertions(+), 2 deletions(-)

 > diff --git a/Makefile b/Makefile
 > index d49d7bf..07e6c74 100644
 > --- a/Makefile
 > +++ b/Makefile
 > @@ -391,6 +391,7 @@ include $(sort $(wildcard package/*/*.mk))
 >  include boot/common.mk
 >  include linux/linux.mk
 >  include system/system.mk
 > +include fs/common.mk
 
 >  include $(BR2_EXTERNAL)/external.mk
 
 > @@ -408,8 +409,6 @@ ifeq ($(BR2_ECLIPSE_REGISTER),y)
 >  TARGETS+=toolchain-eclipse-register
 >  endif
 
 > -include fs/common.mk
 > -

Hmm, does that really work? Does the locale data get correctly purged /
generated before the filesystem images are generated?

-- 
Bye, Peter Korsgaard
