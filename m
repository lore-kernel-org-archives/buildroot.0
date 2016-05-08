From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Sun, 08 May 2016 14:33:22 +0200
Subject: [Buildroot] [PATCH] alsa-lib: Add option to allow calculations
 in float for soft float targets
In-Reply-To: <20160507091654.0b03f2fd@free-electrons.com>
References: <1462603525-4427-1-git-send-email-joerg.krause@embedded.rocks>
 <20160507091654.0b03f2fd@free-electrons.com>
Message-ID: <1462710802.22644.13.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sa, 2016-05-07 at 09:16 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Sat,??7 May 2016 08:45:25 +0200, J?rg Krause wrote:
> 
> > -ifeq ($(BR2_SOFT_FLOAT),y)
> > +ifeq ($(BR2_PACKAGE_ALSA_LIB_NO_FLOAT),y)
> > ?ALSA_LIB_CONF_OPTS += --with-softfloat
> > ?endif
> 
> So we were already passing --with-softfloat when BR2_SOFT_FLOAT=y. So
> what your option brings is:
> 
> ?- Ability to use floating point operations when BR2_SOFT_FLOAT=y.
> 
> ?- Ability to not use floating point operations when BR2_SOFT_FLOAT
> is
> ???disabled.
> 
> Do you have any actual use for such possibilities ?

Yes, for the first case.

I want to use a feature from the alsa-lib which is opted-out at compile
time for softfloat targets by #ifndef HAVE_SOFT_FLOAT [1]. This
functionality requires floating point data types and libmath
operations.

I do not see any point in disabling this unconditionally for softfloat
targets, as a?software floating point library can emulate this.

[1]
http://git.alsa-project.org/?p=alsa-lib.git;a=blob;f=src/pcm/pcm_softvo
l.c;h=802aa4b7cb68e444b8b47e7140870141aad65ffc;hb=HEAD#l785

Best regards
J?rg Krause
