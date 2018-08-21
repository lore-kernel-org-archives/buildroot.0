From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Aug 2018 22:10:26 +0200
Subject: [Buildroot] [PATCH 1/1] package/gettext-tiny: Add new package
In-Reply-To: <CAMw6YJLASMAVyjqKs26zzzpxdpHV5ezQhaXu=nNyO3UwnQF-Yw@mail.gmail.com>
References: <20180821142226.2309-1-vadim4j@gmail.com>
 <87r2irvljb.fsf@tkos.co.il> <20180821172913.1a7eb830@windsurf>
 <CAMw6YJ+FS=z0MQqWj3K-21QYR5m-20wE2RbfFHQnc1WdgrYwLA@mail.gmail.com>
 <20180821193616.5634b4dc@windsurf>
 <CAMw6YJLASMAVyjqKs26zzzpxdpHV5ezQhaXu=nNyO3UwnQF-Yw@mail.gmail.com>
Message-ID: <20180821221026.4fec5cf2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Vadim,

On Tue, 21 Aug 2018 23:07:59 +0300, Vadim Kochan wrote:

> >  - There are a few packages that unconditionally need host-gettext. Is
> >    this really true ?  
> Not sure about this)

In this situation, we have:

 - aumix
 - host-guile
 - host-intltool (perhaps legit ?)
 - host-libglib2
 - libv4l (for AM_ICONV m4 macro)
 - linphone
 - mediastreamer
 - host-mono
 - sysstat (which also uses TARGET_NLS_DEPENDENCIES... weird)
 - tvheadend
 - host-wine
 - xkeyboard-config
 - zbar (for AM_ICONV m4 macro)

> >  - Some packages need host-gettext because of the AM_ICONV m4 macro
> >    provided by gettext.m4. Is gettext-tiny also providing the
> >    gettext-related m4 macros ?  
> Yes it has some set of m4 macrosses, but it needs to be tested how it
> works for the buildroot.
> 
> What if I will start from converting gettext package into the virtual
> one (with renaming the original
> gettext -> gettext-gnu)  ? And after I will try to add gettext-tiny as
> gettext provider.

Looks OK to me. I think the choice between gettext and gettext-tiny is
really a top-level decision, so it probably belongs near the "Enable
Native Language Support (NLS)" option in "System configuration".

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
