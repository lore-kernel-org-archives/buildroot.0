From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Feb 2013 23:24:35 +0100
Subject: [Buildroot] X11 component versions
In-Reply-To: <CAOT3miJUfF3Oc2XFXJRiLCtMxtsHSWZWWLGvGyc+zNkqHGgnEw@mail.gmail.com>
References: <CAOT3miKoAF=cPMfwy4=u=gZAjh+6NZE-qzVPUtqANCe5X3_LCg@mail.gmail.com>
 <510F9155.6050904@carallon.com>
 <CAOT3miLtOy0VwYc0b5DV_snUci0AD5gQzO=ugvsuniMsYd+dow@mail.gmail.com>
 <510F9768.4020907@carallon.com> <20130204214018.2efc0bfb@skate>
 <CAOT3miKRqb5EvLgrLPkxK32YHLj5QOsqgP5n0zy__rb5L22Kbg@mail.gmail.com>
 <20130204223024.0e687d5b@skate>
 <CAOT3miJUfF3Oc2XFXJRiLCtMxtsHSWZWWLGvGyc+zNkqHGgnEw@mail.gmail.com>
Message-ID: <20130204232435.69179214@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Nicolas Dechesne,

On Mon, 4 Feb 2013 22:37:36 +0100, Nicolas Dechesne wrote:

> well, what i would say is:
>  - for apps included in X11 release, take them all
>  - for other apps, it's a 'distro' choice to include it... so I would
> keep the one we have already, here I assume there must be a reason why
> they are there in BR already... and we can add new ones as needed...

We have two choices:

 * Move those apps outside of package/x11r7, so that package/x11r7 only
   contains packages that are part of official X11R7 releases. But we
   already have things like the x86-input-tslib package that is in
   package/x11r7, but is in fact not a X.org project at all.

 * Add additional exceptions for those applications in the xorg-release
   script, just to make the output of this script more meaningful.

I also feel like we have a lot of those old xapp_<something> and that
not many of them are actually useful beyond a good old xeyes to test
that your X.org server runs and that the mouse is working, and possibly
a few tools like xapp_xev and stuff like that.

But really, who cares about xman, xmh, xbiff, xcalc and similar things?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
