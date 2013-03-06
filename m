From: Rob Landley <rob@landley.net>
Date: Tue, 05 Mar 2013 22:22:36 -0600
Subject: [Buildroot] What to do about systemd/udev/eudev?
In-Reply-To: <CALo-6+izu2DJE6+PGDSFqQLz9tA=dF7DxEOS2rVcrdGjMwcapg@mail.gmail.com>
 (from charles.krinke@gmail.com on Tue Mar  5 09:04:45 2013)
References: <20130304192156.7bfe23bf@skate> <1362471660.7276.2@driftwood>
 <CALo-6+izu2DJE6+PGDSFqQLz9tA=dF7DxEOS2rVcrdGjMwcapg@mail.gmail.com>
Message-ID: <1362543756.7276.13@driftwood>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/05/2013 09:04:45 AM, Charles Krinke wrote:
> As a user working on an AM3517 project with buildroot, I am having
> trouble seeing anything wrong with the existing implementation of
> mdev. We have 802.11 and USB disks that are plugged in and removed and
> the mdev subsystem seems to be working fine.
> 
> Having other alternatives is nice, but I hope we do not remove the
> existing mdev which appears to work fine in embedded systems.
> 
> Charles

The existing mdev does work great. (solar at gentoo and myself designed  
it, Denys has extended it quite a bit since then.) This would be an  
extension for those other packages.

(It may be posible to just call some notify program and not modify mdev  
at all.)

Rob

> On 3/5/13, Rob Landley <rob@landley.net> wrote:
> > On 03/04/2013 12:21:56 PM, Thomas Petazzoni wrote:
> >> However, if an application relies on libudev to get notifications  
> of
> >> devices appearing/disappearing, or other services, then of course,  
> it
> >> cannot work with mdev.
> >
> > Notifications are pretty straightforward. Should be possible for  
> mdev
> > to poke something simple and a shim library to provide the right
> > interface...
> >
> > Rob
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> >
> 
> 
> --
> Charles Krinke
> 
