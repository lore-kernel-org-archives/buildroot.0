From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 10 Mar 2017 12:34:07 +0200
Subject: [Buildroot] [PATCH 2/2] libnl: bump to version 3.2.29
In-Reply-To: <1b9e911c-d7ee-dd96-383f-c28fee26353f@zacarias.com.ar>
References: <e21edac8997da04d86a420d580120f5311734191.1489136084.git.baruch@tkos.co.il>
 <4ebba581b256855a7e36993f044ef2b6a6cdfd72.1489136084.git.baruch@tkos.co.il>
 <061cbb4c-8b53-4f32-9d03-344b1ff0c009@zacarias.com.ar>
 <1b9e911c-d7ee-dd96-383f-c28fee26353f@zacarias.com.ar>
Message-ID: <20170310103407.mzk5azkvlr3jc2ok@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,

On Fri, Mar 10, 2017 at 06:57:10AM -0300, Gustavo Zacarias wrote:
> On 10/03/17 06:56, Gustavo Zacarias wrote:
> > On 10/03/17 05:54, Baruch Siach wrote:
> > 
> > > -LIBNL_VERSION = 3.2.27
> > > +LIBNL_VERSION = 3.2.29
> > 
> > Did you try with older headers?
> > Beacuse last time i tried 3.2.{28,29} weren't happy at least with 3.2.x
> > hence i refrained from bumping and carrying that dependency along a few
> > packages.
> 
> That's kernel headers at least 3.2.x, coffee isn't it yet, sorry.
> Regards.

Right. Build breaks with our 3.5 headers based CodeSourcery SH toolchain:

In file included from ../include/linux-private/linux/ipv6.h:5:0,
                 from ../include/netlink-private/netlink.h:55,
                 from addr.c:30:
.../output/host/usr/sh4a-buildroot-linux-gnu/sysroot/usr/include/linux/in6.h:30:8: error: redefinition of 'struct in6_addr'

[... many more errors of this type]

The x86_64 toolchain (also using 3.5 headers) is most likely also affected.

Have you investigated this issue any further? Do you know which libnl commit 
introduced it?

Adding kernel headers dependency to all reverse dependencies of libnl would 
not be nice. So unless we find an acceptable solution we'll have to revert 
this bump.

Thanks for your input.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
