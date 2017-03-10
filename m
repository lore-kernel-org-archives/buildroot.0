From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 10 Mar 2017 16:17:52 +0200
Subject: [Buildroot] [PATCH 2/2] libnl: bump to version 3.2.29
In-Reply-To: <CANCHnQrAipqMe=Y=t5vCkPhDhijFxz4_OZQgnSfVQ6PJeuGzkQ@mail.gmail.com>
References: <e21edac8997da04d86a420d580120f5311734191.1489136084.git.baruch@tkos.co.il>
 <4ebba581b256855a7e36993f044ef2b6a6cdfd72.1489136084.git.baruch@tkos.co.il>
 <061cbb4c-8b53-4f32-9d03-344b1ff0c009@zacarias.com.ar>
 <1b9e911c-d7ee-dd96-383f-c28fee26353f@zacarias.com.ar>
 <20170310103407.mzk5azkvlr3jc2ok@tarshish>
 <20170310125536.eoqglroq76kawtwv@tarshish>
 <CANCHnQrAipqMe=Y=t5vCkPhDhijFxz4_OZQgnSfVQ6PJeuGzkQ@mail.gmail.com>
Message-ID: <20170310141752.sh5i6tzkrvhncpp2@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jeroen,

On Fri, Mar 10, 2017 at 02:05:52PM +0100, Jeroen Roovers wrote:
> You can use this:
> 
> https://dev.gentoo.org/~jer/libnl-3.2.28-in6.patch.xz

We'll probably need to add our local libc-compat.h workaround for musl like we 
have for iproute2 (commit bd9549610f3b), so this patch is most likely not 
enough as is.

Thanks,
baruch

> On 10 March 2017 at 13:55, Baruch Siach <baruch@tkos.co.il> wrote:
> > On Fri, Mar 10, 2017 at 12:34:07PM +0200, Baruch Siach wrote:
> >> On Fri, Mar 10, 2017 at 06:57:10AM -0300, Gustavo Zacarias wrote:
> >> > On 10/03/17 06:56, Gustavo Zacarias wrote:
> >> > > On 10/03/17 05:54, Baruch Siach wrote:
> >> > >
> >> > > > -LIBNL_VERSION = 3.2.27
> >> > > > +LIBNL_VERSION = 3.2.29
> >> > >
> >> > > Did you try with older headers?
> >> > > Beacuse last time i tried 3.2.{28,29} weren't happy at least with 3.2.x
> >> > > hence i refrained from bumping and carrying that dependency along a few
> >> > > packages.
> >> >
> >> > That's kernel headers at least 3.2.x, coffee isn't it yet, sorry.
> >> > Regards.
> >>
> >> Right. Build breaks with our 3.5 headers based CodeSourcery SH toolchain:
> >>
> >> In file included from ../include/linux-private/linux/ipv6.h:5:0,
> >>                  from ../include/netlink-private/netlink.h:55,
> >>                  from addr.c:30:
> >> .../output/host/usr/sh4a-buildroot-linux-gnu/sysroot/usr/include/linux/in6.h:30:8: error: redefinition of 'struct in6_addr'
> >>
> >> [... many more errors of this type]
> >>
> >> The x86_64 toolchain (also using 3.5 headers) is most likely also affected.
> >
> > Adding in6.h and libc-compat.h from the libnl git repo to the tarball seems to
> > fix this error. This has been fixed in upstream commit 6c7f4215003 ("build:
> > distribute in.h in6.h libc-compat.h").
> >
> > I don't have time for a proper patch at the moment, so either revert the bump
> > and I'll send a revised version later, or create an equivalent patch to
> > upstream fix.

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
