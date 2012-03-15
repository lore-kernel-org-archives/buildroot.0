From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Mar 2012 21:30:41 +0100
Subject: [Buildroot] [PATCH 19/20] alsa-lib: bump to version 1.0.25
In-Reply-To: <201203140036.06296.arnout@mind.be>
References: <1331502489-5036-1-git-send-email-gustavo@zacarias.com.ar>
 <1331502489-5036-19-git-send-email-gustavo@zacarias.com.ar>
 <201203140036.06296.arnout@mind.be>
Message-ID: <20120315213041.3bda3650@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 14 Mar 2012 00:36:05 +0100,
Arnout Vandecappelle <arnout@mind.be> a ?crit :

> On Sunday 11 March 2012 22:48:08 Gustavo Zacarias wrote:
> > +# Can't build with static & shared at the same time (1.0.25+)
> > +ifneq ($(BR2_PREFER_STATIC),y)
> > +ALSA_LIB_CONF_OPT += --enable-static=no
> > +else
> > +ALSA_LIB_CONF_OPT += --enable-shared=no
> > +endif
> 
>  Shouldn't we put this in AUTOTARGETS?  Or at least the
> --enable-shared=no if BR2_PREFER_STATIC?

We already have in package/Makefile.in:

ifeq ($(BR2_PREFER_STATIC_LIB),y)
SHARED_STATIC_LIBS_OPTS=--enable-static --disable-shared
else
SHARED_STATIC_LIBS_OPTS=--enable-static --enable-shared
endif

And SHARED_STATIC_LIB_OPTS is used in package/Makefile.autotools.in. I
am not sure why alsa-lib requires those different options than the
standard ones.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
