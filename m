From: Nicolas Dechesne <ndec13@gmail.com>
Date: Mon, 4 Feb 2013 23:45:50 +0100
Subject: [Buildroot] X11 component versions
In-Reply-To: <20130204232435.69179214@skate>
References: <CAOT3miKoAF=cPMfwy4=u=gZAjh+6NZE-qzVPUtqANCe5X3_LCg@mail.gmail.com>
 <510F9155.6050904@carallon.com>
 <CAOT3miLtOy0VwYc0b5DV_snUci0AD5gQzO=ugvsuniMsYd+dow@mail.gmail.com>
 <510F9768.4020907@carallon.com> <20130204214018.2efc0bfb@skate>
 <CAOT3miKRqb5EvLgrLPkxK32YHLj5QOsqgP5n0zy__rb5L22Kbg@mail.gmail.com>
 <20130204223024.0e687d5b@skate>
 <CAOT3miJUfF3Oc2XFXJRiLCtMxtsHSWZWWLGvGyc+zNkqHGgnEw@mail.gmail.com>
 <20130204232435.69179214@skate>
Message-ID: <CAOT3miKU=Wg6rQeyb4r6Lj6Yv9yDaHxqWCAtQ4_0VKGEw558Ug@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 4, 2013 at 11:24 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> We have two choices:
>
>  * Move those apps outside of package/x11r7, so that package/x11r7 only
>    contains packages that are part of official X11R7 releases. But we
>    already have things like the x86-input-tslib package that is in
>    package/x11r7, but is in fact not a X.org project at all.

this seems a better option indeed. i will try to cook a patch for
that. i assume something like packages/x11apps should be a good
package name, or perhaps x11_xorg_apps to make the distinction between
apps from x.org and any other app that would use X11..

>
>  * Add additional exceptions for those applications in the xorg-release
>    script, just to make the output of this script more meaningful.
>
> I also feel like we have a lot of those old xapp_<something> and that
> not many of them are actually useful beyond a good old xeyes to test
> that your X.org server runs and that the mouse is working, and possibly
> a few tools like xapp_xev and stuff like that.
>
> But really, who cares about xman, xmh, xbiff, xcalc and similar things?

sure, once we are done with the migration, we can remove unused apps.
