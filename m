From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 04 May 2014 20:55:23 +0200
Subject: [Buildroot] [PATCH] libfribidi: bump version
In-Reply-To: <1399215794-28324-1-git-send-email-maxime.hadjinlian@gmail.com>
 (Maxime Hadjinlian's message of "Sun, 4 May 2014 17:03:14 +0200")
References: <1399215794-28324-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <87r449jrvo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Hadjinlian <maxime.hadjinlian@gmail.com> writes:

 > This patch also call autoreconf in order to use buildroot's libtool

It wasn't immediately clear to me why we need AUTORECONF (our libtool
patch doesn't apply to upstreams' ltmain.sh), so I've extended the
commit message / added a comment and committed, thanks.

 > Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
 > ---
 >  package/libfribidi/libfribidi.mk | 3 ++-
 >  1 file changed, 2 insertions(+), 1 deletion(-)

 > diff --git a/package/libfribidi/libfribidi.mk b/package/libfribidi/libfribidi.mk
 > index 99005c2..52e2a84 100644
 > --- a/package/libfribidi/libfribidi.mk
 > +++ b/package/libfribidi/libfribidi.mk
 > @@ -4,11 +4,12 @@
 >  #
 >  ################################################################################
 
 > -LIBFRIBIDI_VERSION = 0.19.5
 > +LIBFRIBIDI_VERSION = 0.19.6
 >  LIBFRIBIDI_SOURCE = fribidi-$(LIBFRIBIDI_VERSION).tar.bz2
 >  LIBFRIBIDI_SITE = http://www.fribidi.org/download/
 >  LIBFRIBIDI_LICENSE = LGPLv2.1+
 >  LIBFRIBIDI_LICENSE_FILES = COPYING
 >  LIBFRIBIDI_INSTALL_STAGING = YES
 > +LIBFRIBIDI_AUTORECONF = YES
 
 >  $(eval $(autotools-package))
 > -- 
 > 1.9.2

 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
