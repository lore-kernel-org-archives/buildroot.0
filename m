From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Mar 2015 11:30:57 +0100
Subject: [Buildroot] [PATCH v4 3/3] GNURadio: new package
In-Reply-To: <20150309112223.647f7c5a@x230.trabucayre.com>
References: <1425553401-27461-1-git-send-email-gwenj@trabucayre.com>
 <1425553401-27461-3-git-send-email-gwenj@trabucayre.com>
 <CAHXCMM+PYBAiuFXxBOHfXghPBW7x8P6ha_w1qb9eEe2wt_1WrQ@mail.gmail.com>
 <20150309112223.647f7c5a@x230.trabucayre.com>
Message-ID: <20150309113057.6076ebe5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

(Please try to strip useless parts of an e-mail when replying, thanks!).

On Mon, 9 Mar 2015 11:22:23 +0100, gwenhael.goavec wrote:

> > > +GNURADIO_CONF_OPTS += -DENABLE_DEFAULT=OFF -DENABLE_TESTING=OFF
> > > +GNURADIO_CONF_OPTS += -DENABLE_VOLK=ON -DENABLE_GNURADIO_RUNTIME=ON
> > > +ifeq ($(BR2_arm),y)
> > > +ifeq ($(BR2_ARM_CPU_HAS_NEON)$(BR2_ARM_EABIHF),yy)
> > > +GNURADIO_MTUNE = $(call qstrip,$(BR2_GCC_TARGET_CPU))
> > > +GNURADIO_CONF_OPTS += -DCMAKE_C_FLAGS="-mfloat-abi=hard -mfpu=neon -march=armv7-a -mtune=$(GNURADIO_MTUNE)"
> > Hum... Dubious! Enforcing these target flags won't play very well with
> > the toolchain wrapper!
> > Also, how about aarch64 targets?
> >
> Volk seems buggy on arm with hf, consequently this Work around is mandatory to
> avoid build failure... I'm agree it's not really good but it's the recommended
> solution... 

Can you be more specific about this? What bug?

Because what you're doing here with -mfloat-abi=hard is *precisely*
using EABIhf.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
