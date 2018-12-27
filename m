From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 27 Dec 2018 04:42:24 -0600
Subject: [Buildroot] [PATCH 5/5 v5] boot/systemd-boot: new package
In-Reply-To: <20181227104029.GP14286@scaer>
References: <20181226222329.18046c1c@windsurf> <20181226214100.GK14286@scaer>
 <CADvTj4rPZqjx_iNHF7Q8DKa63P+OOX=v-YuhCfUZMR4VOa-zsw@mail.gmail.com>
 <CADvTj4ognr24o+CU-gBsCkH2K=KqbwAtrNv2Vv+9L_97HFUQhg@mail.gmail.com>
 <CADvTj4pMMmcwaij-ApcgHQB0ZSAyh3vQHQ_VEb-rQGtraxHuwA@mail.gmail.com>
 <CADvTj4r=OkPbwSyN2ZUmFxraHQYp07ciW700574-ZD2Xzjqihw@mail.gmail.com>
 <20181227084902.GN14286@scaer>
 <CADvTj4qwOPD774mrqNOWK+FZ1wWVX8jAhsYnW3fQ0b7-nTaswA@mail.gmail.com>
 <20181227091134.GO14286@scaer>
 <CADvTj4oEdXRcOScrou=L0-AWG1pGu3kD9PLj=j9WoeJUBUG8bA@mail.gmail.com>
 <20181227104029.GP14286@scaer>
Message-ID: <CADvTj4rdOXyUF-WN+ZATt6v1L9QH7pEA2iQhP7YtfHdQRG3AjA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Dec 27, 2018 at 4:40 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> James, All,
>
> On 2018-12-27 03:13 -0600, James Hilliard spake thusly:
> > On Thu, Dec 27, 2018 at 3:11 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > > On 2018-12-27 03:07 -0600, James Hilliard spake thusly:
> > > > On Thu, Dec 27, 2018 at 2:49 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > > > > On 2018-12-26 19:27 -0600, James Hilliard spake thusly:
> > > > > > On Wed, Dec 26, 2018 at 4:52 PM James Hilliard
> > > > > > > > > meson.build:293:8: ERROR:  Unknown compiler(s):
> > > > > > > > > [['/home/buildroot/buildroot/output/host/bin/i586-buildroot-linux-uclibc-g++']]
> > > > > > > Upstream bug report https://github.com/systemd/systemd/issues/11278
> > > > > > Potential fix: https://github.com/systemd/systemd/pull/11279
> > > > > That unfortunately does not work:
> > > > > ERROR: No specified compiler can handle file src/libsystemd/sd-bus/test-bus-vtable-cc.cc
> > > > > But if you also add:
> > > > >     -if cxx.found()
> > > > >     +if cxx_cmd != ''
> > > > > Then it works.
> > > > Pushed that fix and one other I found, didn't realize cxx.found() was
> > > > being used other places(I only tested that pull request against a c
> > > > only cross toolchain).
> > >
> > > It worked for me without the hunk in src/systemd/meson.build. However,
> > > for our case in Buildroot (just building systemd-boot standalone), we
> > > don't need a 100% perfect patch, as long as it allows building.
> > That patch I think is needed to build systemd itself when using a
> > cross toolchain without c++, not just systemd-boot.
>
> I can confirm that, without the hunk in src/systemd/meson.build, I was
> able to build systemd with this defconfig:
>
>     BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
>     BR2_INIT_SYSTEMD=y
That's without c++ right?
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
