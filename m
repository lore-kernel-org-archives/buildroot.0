From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 1 Jan 2020 22:16:57 +0100
Subject: [Buildroot] [PATCH] DEVELOPERS: add Nicholas Sielicki as
 contact for galileo_defconfig
In-Reply-To: <BN6PR11MB4145B63CE33025809CB99F8490210@BN6PR11MB4145.namprd11.prod.outlook.com>
References: <20190811120739.26539-13-thomas.petazzoni@bootlin.com>
 <20191231152005.GH26395@scaer>
 <MN2PR11MB4160005AC798211088F160C090210@MN2PR11MB4160.namprd11.prod.outlook.com>
 <20200101163416.065d0ace@windsurf> <20200101161120.GL3519@scaer>
 <BN6PR11MB4145B63CE33025809CB99F8490210@BN6PR11MB4145.namprd11.prod.outlook.com>
Message-ID: <20200101211657.GP3519@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ray, All,

On 2020-01-01 21:08 +0000, Kinsella, Ray spake thusly:
> Yup - a make clean and rebuild sorted it out.
> 
> So Yann/Thomas - what do you need someone to sign up to here?
> Is a nightly build or a regular checkin or ... ?

As I explained earlier, there is a weekly build of all the defconfigs on
gitlab-ci [0], and when there is a failure, an automatic my is sent to
whoever is registered in the DEVELOPPERS file for that defconfig.

So, that means no mail until there is a failure, and this is at most
once a week, until the failure is fixed.

Regards,
Yann E. MORIN.

> Ray K
> 
> > -----Original Message-----
> > From: Yann E. MORIN <yann.morin.1998@free.fr>
> > Sent: Wednesday 1 January 2020 16:11
> > To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > Cc: Kinsella, Ray <ray.kinsella@intel.com>; buildroot at buildroot.org;
> > Nicholas Sielicki <sielicki@yandex.com>
> > Subject: Re: [Buildroot] [PATCH] DEVELOPERS: add Nicholas Sielicki as
> > contact for galileo_defconfig
> > 
> > Ray, All,
> > 
> > (removing Padraig from the loop, their email is bouncing)
> > 
> > On 2020-01-01 16:34 +0100, Thomas Petazzoni spake thusly:
> > > On Wed, 1 Jan 2020 11:11:53 +0000
> > > "Kinsella, Ray" <ray.kinsella@intel.com> wrote:
> > > > My buildroot skills are bit rusty, but I have been mean to dust
> > them off.
> > > > So I am  willing to give it a go.
> > > >
> > > > BTW is there a specific failure that is causing a problem at the
> > moment.
> > > > I have grub failing on what look to be Unicode related issues.
> > 
> > Is this really 'grub' (as in grub legacy), or 'grub2'?
> > We do not have the legacy grub in Buildroot anymore.
> > 
> > > > /build/buildroot/output/host/lib/gcc/i586-buildroot-linux-
> > uclibc/8.3.0/../../../../i586-buildroot-linux-uclibc/bin/ld: grub-
> > core/lib/gnulib/libgnu.a(mbrtowc.o): in function `mbrtowc':
> > > > mbrtowc.c:(.text+0x169): undefined reference to `mbtowc'
> > > > /build/buildroot/output/host/lib/gcc/i586-buildroot-linux-
> > uclibc/8.3.0/../../../../i586-buildroot-linux-uclibc/bin/ld:
> > mbrtowc.c:(.text+0x17a): undefined reference to `mbtowc'
> > > > /build/buildroot/output/host/lib/gcc/i586-buildroot-linux-
> > uclibc/8.3.0/../../../../i586-buildroot-linux-uclibc/bin/ld: grub-
> > core/lib/gnulib/libgnu.a(vasnprintf.o): in function `vasnprintf':
> > > > vasnprintf.c:(.text+0x566): undefined reference to `wctomb'
> > 
> > I've just tried to build the galileo_defconfig, and it completed
> > successfully here.
> > 
> > > Could you try enabling BR2_TOOLCHAIN_BUILDROOT_WCHAR and do a full
> > > rebuild? Maybe we're missing this dependency in the grub package.
> > 
> > We already have a dependency on BR2_USE_WCHAR in grub2.
> > 
> > Regards,
> > Yann E. MORIN.
> > 
> > --
> > .-----------------.--------------------.------------------.------------
> > --------.
> > |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> > | conspiracy: |
> > | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
> > |
> > | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There
> > is no  |
> > | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
> > conspiracy.  |
> > '------------------------------^-------^------------------^------------
> > --------'

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
