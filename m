From: Bhupal Singh <singhbhupal88@gmail.com>
Date: Thu, 28 Feb 2013 14:22:26 +0530
Subject: [Buildroot] WebkitGtk upgradation
In-Reply-To: <512F0B0A.4050403@relinux.de>
References: <CAJsG2H5B=ZdfDZm_wTmOqMkG6_kME=y_7oc5gkMygtd6HA4p+g@mail.gmail.com>
 <512F0B0A.4050403@relinux.de>
Message-ID: <CAJsG2H4pZWE7FZGFUJuhYhjrNkf0Aa62y12WW3YQdbScJ1HTtA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks Stephan,

Yeah correct Webkit1.10.2 requires few other packages to be updated, Since
webkit1.10.2 is a currect stable version, Is the only reason I am sticking
to this version.
Okay here are some more details

To build Webkit1.10.2 requires Libglib, Pango, Cairo, Gstreamer, Atk,
Gdk-pixbuf, All these packages needs to be updated, And new package
Geoclue-0.12.99 to be added in the buildroot.

I have updated all the above said packages and its build completely fine,
The only place where I am stuck is while building Webkit.
The build fails here Xrender package required and it looks for x11
libraries, Though I have given target as DirectFB.
And like icu-config not found even though icu package is already build, To
my knowledge I can either build using icu or glib as a backend-unicode in
which icu is default I tried to change this option as well but no success
yet.

-- 
Warm Regards,
BS_Chauhan


On Thu, Feb 28, 2013 at 1:15 PM, Stephan Hoffmann <sho@relinux.de> wrote:

> Hello Bhupal!
>
> Am 28.02.2013 06:53, schrieb Bhupal Singh:
> > Hi All,
> >
> > I was trying to update webkit 1.10.2 in the latest buildroot which was
> > released on feb 2013, for a cross-compilation toolchain. But seems
> > that the latest buildroot has webkit1.2.7 which seems to be very old.
> >
> > While building webkit1.10.2 with target as DirectFB, The build fails
> > due to the other packages which are not compatible with the
> > webkit1.10.2 and lot of issues which I really could not figure out.
> I also tried this some time before, but there were some other packages
> that had to be updated. I am not sure if GTK3 is needed, which isn't
> supported yet. So I had to give up because I was running out of time.
> > If some one can tell me why does latest buildroot has such an old
> > webkit1.2.7 version, Or is it that the current stable webkit1.10.2 is
> > not feasible with the latest buildroot.
> I am sure this is simply due to the fact that nobody had time to do it
> or needed a newer version.
> > Since I am new to this platform, I have very little understanding on
> > buildroot,Please help.
> Quite sure that you would get help here on the list if you decide to
> bump webkit's version.
>
> When I'm back in my office I'll review my recent work and give you some
> more details.
>
> Kind regards
>
> Stephan
> >
> > Thanks in advance.
> >
> >
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130228/2a7f1fed/attachment-0001.html>
