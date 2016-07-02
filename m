From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 02 Jul 2016 11:58:53 +0200
Subject: [Buildroot] [PATCH 02/12] reproducibility: override locale and
	timezone
In-Reply-To: <1465918277-30675-2-git-send-email-gilles.chanteperdrix@xenomai.org>
 (Gilles Chanteperdrix's message of "Tue, 14 Jun 2016 17:31:10 +0200")
References: <20160614152928.GH3060@hermes.click-hack.org>
 <1465918277-30675-1-git-send-email-gilles.chanteperdrix@xenomai.org>
 <1465918277-30675-2-git-send-email-gilles.chanteperdrix@xenomai.org>
Message-ID: <87wpl4bbtu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gilles" == Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org> writes:

 > Signed-off-by: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
 > ---
 >  Makefile | 7 +++++++
 >  1 file changed, 7 insertions(+)

 > diff --git a/Makefile b/Makefile
 > index 3f5c3d3..0217ff0 100644
 > --- a/Makefile
 > +++ b/Makefile
 > @@ -208,6 +208,13 @@ ifeq ($(filter $(noconfig_targets),$(MAKECMDGOALS)),)
 >  -include $(BR2_CONFIG)
 >  endif
 
 > +export BR2_REPRODUCIBLE

I moved this down with the other exports we do for post-build /
post-image scripts.

 > +ifeq ($(BR2_REPRODUCIBLE),y)

And added a comment why we do this.

Committed with that fixed, thanks.

 > +export TZ=UTC
 > +export LANG=C
 > +export LC_ALL=C
 > +endif
 > +
 >  # To put more focus on warnings, be less verbose as default
 >  # Use 'make V=1' to see the full commands
 >  ifeq ("$(origin V)", "command line")
 > -- 
 > 2.8.2

 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
