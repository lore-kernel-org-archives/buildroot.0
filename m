From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 26 Feb 2014 09:47:55 +0100
Subject: [Buildroot] [PATCH 2/2] imagemagick: use --without-bzlib when
	bzip2 is not selected
In-Reply-To: <1392508668-27561-2-git-send-email-romain.naour@openwide.fr>
 (Romain Naour's message of "Sun, 16 Feb 2014 00:57:48 +0100")
References: <1392508668-27561-1-git-send-email-romain.naour@openwide.fr>
 <1392508668-27561-2-git-send-email-romain.naour@openwide.fr>
Message-ID: <87fvn6gszo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@openwide.fr> writes:

 > Signed-off-by: Romain Naour <romain.naour@openwide.fr>

Committed, thanks.

 > ---
 >  package/imagemagick/imagemagick.mk | 2 +-
 >  1 file changed, 1 insertion(+), 1 deletion(-)

 > diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
 > index c1e17c7..4f2a65f 100644
 > --- a/package/imagemagick/imagemagick.mk
 > +++ b/package/imagemagick/imagemagick.mk
 > @@ -115,7 +115,7 @@ ifeq ($(BR2_PACKAGE_BZIP2),y)
 >  IMAGEMAGICK_CONF_OPT += --with-bzlib
 >  IMAGEMAGICK_DEPENDENCIES += bzip2
 >  else
 > -IMAGEMAGICK_CONF_OPT += --without-bzip2
 > +IMAGEMAGICK_CONF_OPT += --without-bzlib
 >  endif
 
 >  $(eval $(autotools-package))
 > -- 
 > 1.8.5.3

 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
