From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 May 2013 16:22:16 +0200
Subject: [Buildroot] [PATCH v6 09/10] libopenmax: Add libopenmax virtual
 package
In-Reply-To: <CAEBucnBvGuHMM3cgGcaSyJ3M_ShpNuUKEW+8TRz4TQTmpDsh9Q@mail.gmail.com>
References: <1368655178-19176-1-git-send-email-spenser@gillilanding.com>
 <1368655178-19176-10-git-send-email-spenser@gillilanding.com>
 <20130516095842.78066d20@skate>
 <CAEBucnBvGuHMM3cgGcaSyJ3M_ShpNuUKEW+8TRz4TQTmpDsh9Q@mail.gmail.com>
Message-ID: <20130516162216.299938c4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Spenser Gilliland,

On Thu, 16 May 2013 09:18:38 -0500, Spenser Gilliland wrote:

> > but ok, that's certainly a different work. This current patch series is
> > already long enough.
> 
> I agree that a change like you suggested would be better but it's
> probably best left for another patch series due to the required
> changes being quite large.

Agreed, I'm fine with getting this part of your patch as is, and later
on, do some followup improvements. Especially since all those packages
and options have no effect on the configurations people may be
creating, some it doesn't cause any compatibility issue if we move
things around or rename those hidden kconfig options.

> >> +ifeq ($(BR2_PACKAGE_BELLAGIO),y)
> >> +LIBOPENMAX_DEPENDENCIES += bellagio
> >> +endif
> >
> > Unless I missed something, there is no bellagio package in Buildroot
> > for now, so this chunk should only be added once bellagio is added.
> 
> It's in package/multimedia/bellagio.

Argh, my bad. Stupid packages in subdirectories. I didn't remember
having bellagio, so I checked by doing package/bell<tab><tab>, and
nothing showed up, making me -incorrectly- conclude that this package
didn't exist.

Sorry for the noise on this one.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
