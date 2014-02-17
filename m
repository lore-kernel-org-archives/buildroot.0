From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Mon, 17 Feb 2014 16:07:17 +0100
Subject: [Buildroot] [PATCH 1/2] udev: update udev to new virtual
 package infra.
In-Reply-To: <20140217153745.1e5683e9@skate>
References: <1392632536-16714-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1392632536-16714-2-git-send-email-eric.le.bihan.dev@free.fr>
 <20140217114906.5b6aab4a@skate> <20140217143311.GA4920@pc-eric>
 <20140217153745.1e5683e9@skate>
Message-ID: <20140217150714.GC4920@pc-eric>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 17, 2014 at 03:37:45PM +0100, Thomas Petazzoni wrote:
> Dear Eric Le Bihan,
>
> On Mon, 17 Feb 2014 15:33:13 +0100, Eric Le Bihan wrote:
>
> > > Why are we doing this check in UDEV_CONFIGURE_CMDS ? I believe we can
> > > simply do:
> > >
> > > ifeq ($(<foo>_DEPENDENCIES),)
> > > $(error No <foo> implementation selected)
> > > endif
> > I followed the example in package/opengl/libegl/libegl.mk, but I mixed the
> > Makefile control function $(error text...) and some Shell script without
> > thinking...
> >
> > I will revert it to the pure shell version to be coherent.
>
> I guess you mean "to the pure make version", according to what you say
> below, right?
>
No. I was thinking about keeping the shell version for this series and making
the change in the new series that would update all the virtual packages, but
thinking twice about it, it is better to make it now (patches could be applied
in any order).

Best regards,
ELB
