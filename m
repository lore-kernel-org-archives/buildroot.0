From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Mon, 24 Feb 2014 11:00:48 +0100
Subject: [Buildroot] [PATCH v2 1/1] manual: add virtual package tutorial.
In-Reply-To: <20140223190407.GE32759@free.fr>
References: <1392390673-30343-1-git-send-email-eric.le.bihan.dev@free.fr>
 <CAHXCMMJuED9xj9wVS0d0d+USa=-7_MdD6ZwoKQNj3zyg2+1vpQ@mail.gmail.com>
 <20140219141950.GA25812@pc-eric> <20140223190407.GE32759@free.fr>
Message-ID: <20140224100047.GA24002@pc-eric>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, All,

On Sun, Feb 23, 2014 at 08:04:07PM +0100, Yann E. MORIN wrote:
> Eric, All,
>
> On 2014-02-19 15:19 +0100, Eric Le Bihan spake thusly:
> > On Tue, Feb 18, 2014 at 09:34:41PM +0100, Samuel Martin wrote:
> > [...]
> > > > +[[virtual-package-tutorial]]
> > > > +How to add a virtual package
> > > > +^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > > > +
> > > > +In Buildroot, a virtual package is a package whose functionalities are
> > > > +provided by one or more packages, referred to as 'providers'.
> > > > +
> > > > +For example, 'OpenGL ES' is an API for 2D and 3D graphics on embedded systems.
> > > > +The implementation of this API is different for the 'Allwinner Tech Sunxi' and
> > > > +the 'Texas Instruments OMAP35xx' plaftorms. So +libgles+ will be a virtual
> > > > +package and +sunxi-mali+ and +ti-gfx+ will be the providers.
> > >
> > > The generic way of presenting the virtual/provider "infra" in Buildroot is:
> > > we want to use the virtual/provider infrastructure when there is one
> > > API, but several packages implementing this API, so we want an
> > > extensible mechanism allowing to choose what implementation we want in
> > > the target rootfs.
> > I will update the text in order to put emphasis on this idea.
>
> How are your changes going?
>
> There are quite a few improvements to the manual being upstreamed. Your
> changes would make for another nice addition.
>
> Do you think you could resubmit sometime next week, so this has a chance
> to go in before the release?
I sent a patch series intended for the next branch, which features:

- a new version of the dependency check in the virtual package infra (less
  shell script, more make functions). All the virtual packages have been
  updated.
- a new version of the tutorial, which includes the fixes.

But I can provide a version of the tutorial for the current version of virtual
infra for current branch if needed.

Best regards,
ELB
