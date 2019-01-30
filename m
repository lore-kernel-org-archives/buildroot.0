From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 30 Jan 2019 21:50:55 +0100
Subject: [Buildroot] [RFC 0/3] init: Add s6 as init system
In-Reply-To: <20190120153151.GA22618@itchy>
References: <20190116215135.32142-1-vadim4j@gmail.com>
 <20190120153151.GA22618@itchy>
Message-ID: <CAAXf6LXes1KNb9UHO33cNpVhQjR0Qg36OUJEyUL3iG11vZ2_yA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Eric, Vadim,

El dom., 20 ene. 2019 a las 16:32, Eric Le Bihan
(<eric.le.bihan.dev@free.fr>) escribi?:
>
> Hi!
> On 2019-01-16 23:51, Vadim Kochan wrote:
> > Add new system init support (BR2_INIT_S6) based on s6 suite. This is very-very
> > basic support which does not have any setup automation logic (but only getty)
> > but it allows to install custom s6-rc services in a bit easier way by the
> > board. All s6-rc services which were copied by rootfs-overlay or post-build
> > will be compiled as s6-rc db into /etc/s6-rc/compiled-initial, which also has
> > /etc/s6-rc/compiled link to easy replace it in runtime.
> >
> > In case if such kind of change will be merged, then may be it would be good to
> > think about of some packages integration into s6-rc system.
> >
> > Vadim Kochan (3):
> >   package/s6-linux-init: Build also for the host
> >   package/s6-linux-init: Allow to install as init system
> >   package/s6-rc: Allow to integrate s6-rc services
> >
> >  package/s6-linux-init/s6-linux-init.mk | 69 +++++++++++++++++++++++++++++++++-
> >  package/s6-rc/rc.init                  |  4 ++
> >  package/s6-rc/rc.shutdown              |  3 ++
> >  package/s6-rc/s6-rc.mk                 | 32 ++++++++++++++++
> >  system/Config.in                       |  9 ++++-
> >  5 files changed, 114 insertions(+), 3 deletions(-)
> >  create mode 100644 package/s6-rc/rc.init
> >  create mode 100644 package/s6-rc/rc.shutdown
> >
> > --
> > 2.14.1
> >
>
> I worked on a s6-based init system eons ago [1], but without using a
> host variant of s6-linux-init.
>
> I'll test your patches.
>
> [1] https://github.com/elebihan/br2-ext-skarnet
>

We are based on Eric's original s6 init files, before it was moved to
a BR2_EXTERNAL logic.
But I'm no s6 expert at all, so I can't really comment on these changes.
Nevertheless, I'm quite interested to see how this evolves so we can
align our local situation with something in upstream Buildroot.

Best regards,
Thomas
