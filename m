From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Oct 2014 15:02:20 +0200
Subject: [Buildroot] [PATCH] tinyalsa: new package
In-Reply-To: <471202899.FpAt3MTFiF@hyperion>
References: <1412531488-8849-1-git-send-email-maxime.hadjinlian@gmail.com>
 <20141006211545.025b58c5@free-electrons.com>
 <471202899.FpAt3MTFiF@hyperion>
Message-ID: <20141018150220.06b209c5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maarten ter Huurne,

On Sat, 18 Oct 2014 02:42:45 +0200, Maarten ter Huurne wrote:

> > +++ b/package/tinyalsa/tinyalsa.mk
> > [snip]
> > +       $(INSTALL) -D -m 0644 $(@D)/include/sound/asound.h \
> > +                       $(STAGING_DIR)/usr/include/sound/asound.h
> 
> This will overwrite the pre-existing (from libc or kernel headers) version 
> of <sound/asound.h> with the Android-style stripped version from tinyalsa.
> I think it would be better to keep the pre-existing version of this header, 
> do you agree?

Yes, overwriting this header file indeed looks brutal. Is the original
asound.h a superset of the tinyalsa asound.h ? If that's the case, then
we can simply keep the original asound.h and that's it.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
