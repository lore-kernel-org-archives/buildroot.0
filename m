From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 29 Dec 2018 04:50:36 -0600
Subject: [Buildroot] [PATCH 5/5 v5] boot/systemd-boot: new package
In-Reply-To: <20181229093522.GX14286@scaer>
References: <CADvTj4pMMmcwaij-ApcgHQB0ZSAyh3vQHQ_VEb-rQGtraxHuwA@mail.gmail.com>
 <CADvTj4r=OkPbwSyN2ZUmFxraHQYp07ciW700574-ZD2Xzjqihw@mail.gmail.com>
 <20181227084902.GN14286@scaer>
 <CADvTj4qwOPD774mrqNOWK+FZ1wWVX8jAhsYnW3fQ0b7-nTaswA@mail.gmail.com>
 <20181227091134.GO14286@scaer>
 <CADvTj4oEdXRcOScrou=L0-AWG1pGu3kD9PLj=j9WoeJUBUG8bA@mail.gmail.com>
 <20181227104029.GP14286@scaer>
 <CADvTj4rdOXyUF-WN+ZATt6v1L9QH7pEA2iQhP7YtfHdQRG3AjA@mail.gmail.com>
 <20181227105731.GR14286@scaer>
 <CADvTj4rcDC0hkZZ8Zfjw6Tv26PROUc7AOiuPXn6paBJjxt8szw@mail.gmail.com>
 <20181229093522.GX14286@scaer>
Message-ID: <CADvTj4ri-LUvySkGaHbstAuOZ+Ez8qhOU8cExZVu3_2f7yw-bQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Dec 29, 2018 at 3:35 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> James, All,
>
> On 2018-12-27 05:01 -0600, James Hilliard spake thusly:
> > On Thu, Dec 27, 2018 at 4:57 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > > On 2018-12-27 04:42 -0600, James Hilliard spake thusly:
> > > > On Thu, Dec 27, 2018 at 4:40 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > > > > I can confirm that, without the hunk in src/systemd/meson.build, I was
> > > > > able to build systemd with this defconfig:
> > > > >     BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
> > > > >     BR2_INIT_SYSTEMD=y
> > > > That's without c++ right?
>
> Your no-C++ patch has been accepted upstream! :-)
>
> Care to backport that fix in Buildroot, please?
Backported in my tree here
https://github.com/jameshilliard/buildroot/tree/systemd-boot

I did a test build selecting only systemd-boot and now I get this error:
Program gperf found: NO

meson.build:634:0: ERROR:  Program(s) ['gperf'] not found or not executable
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
