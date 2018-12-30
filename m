From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 30 Dec 2018 02:44:10 -0600
Subject: [Buildroot] [PATCH 5/5 v5] boot/systemd-boot: new package
In-Reply-To: <20181229113847.GZ14286@scaer>
References: <20181227084902.GN14286@scaer>
 <CADvTj4qwOPD774mrqNOWK+FZ1wWVX8jAhsYnW3fQ0b7-nTaswA@mail.gmail.com>
 <20181227091134.GO14286@scaer>
 <CADvTj4oEdXRcOScrou=L0-AWG1pGu3kD9PLj=j9WoeJUBUG8bA@mail.gmail.com>
 <20181227104029.GP14286@scaer>
 <CADvTj4rdOXyUF-WN+ZATt6v1L9QH7pEA2iQhP7YtfHdQRG3AjA@mail.gmail.com>
 <20181227105731.GR14286@scaer>
 <CADvTj4rcDC0hkZZ8Zfjw6Tv26PROUc7AOiuPXn6paBJjxt8szw@mail.gmail.com>
 <20181229093522.GX14286@scaer>
 <CADvTj4ri-LUvySkGaHbstAuOZ+Ez8qhOU8cExZVu3_2f7yw-bQ@mail.gmail.com>
 <20181229113847.GZ14286@scaer>
Message-ID: <CADvTj4qrsN+8o7+9Qwi_h0-9XBu0BJZDQHZWNcw6tUFaTbQCtg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Dec 29, 2018 at 5:38 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> James, All,
>
> On 2018-12-29 04:50 -0600, James Hilliard spake thusly:
> > On Sat, Dec 29, 2018 at 3:35 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > > On 2018-12-27 05:01 -0600, James Hilliard spake thusly:
> > > > On Thu, Dec 27, 2018 at 4:57 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > > > > On 2018-12-27 04:42 -0600, James Hilliard spake thusly:
> > > > > > On Thu, Dec 27, 2018 at 4:40 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > > > > > > I can confirm that, without the hunk in src/systemd/meson.build, I was
> > > > > > > able to build systemd with this defconfig:
> > > > > > >     BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
> > > > > > >     BR2_INIT_SYSTEMD=y
> > > > > > That's without c++ right?
> > >
> > > Your no-C++ patch has been accepted upstream! :-)
> > >
> > > Care to backport that fix in Buildroot, please?
> > Backported in my tree here
> > https://github.com/jameshilliard/buildroot/tree/systemd-boot
>
> Could you please send it soon to the list as a patch to systemd, as it
> is not correlated to systemd-boot at all (it is also needed by systemd
> to build on a non-C++ toolchain)?
>
> > I did a test build selecting only systemd-boot and now I get this error:
> > Program gperf found: NO
> > meson.build:634:0: ERROR:  Program(s) ['gperf'] not found or not executable
>
> Until now, only minor patching was needed (a header and two libs checks)
> that were trivial to patchout. But this new gperf check is less trivial
> to patch-out in a way that is maintainable long-term.
What do you think of this strategy using meson's disabler feature?
https://github.com/systemd/systemd/pull/11294
>
> My opinion now is now joining that of Thomas, that we should not try to
> build a standalone systemd-boot until it is properly supported by
> upstream. Work to that effect should be directed at upstream rather than
> monkey-patching in Buildroot.
>
> Regards,
> Yann E. MORIN.
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
