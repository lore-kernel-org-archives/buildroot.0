From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 22 Feb 2018 18:38:24 +0200
Subject: [Buildroot] [PATCH-FOR-NEXT v1 1/6] package: add libnpsr host
 package
In-Reply-To: <20180222142913.vxokki46l6hemt6e@archlinux.local>
References: <20180221142801.28997-1-gael.portay@savoirfairelinux.com>
 <20180221142801.28997-2-gael.portay@savoirfairelinux.com>
 <20180221222700.7b9b3098@windsurf.lan>
 <20180222142913.vxokki46l6hemt6e@archlinux.local>
Message-ID: <20180222163824.6plxj36evjyfakni@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ga?l,

On Thu, Feb 22, 2018 at 09:29:13AM -0500, Ga?l PORTAY wrote:
> On Wed, Feb 21, 2018 at 10:27:00PM +0100, Thomas Petazzoni wrote:
> > On Wed, 21 Feb 2018 09:27:56 -0500, Ga?l PORTAY wrote:
> > > +ifeq ($(HOSTARCH),x86_64)
> > > +HOST_LIBNSPR_CONF_OPTS += --enable-64bit
> > 
> > x86_64 is not the only 64-bit architecture in the world: we have an
> > autobuilder running on a ppc64 machine for example.
> 
> Okay, great! I did not know that we were supporting other architecture
> than intel for build :)
> 
> BTW, I picked up the "code" from another package. Probably took it from
> wine.mk.
> 
> 	# Wine needs to enable 64-bit build tools on 64-bit host
> 	ifeq ($(HOSTARCH),x86_64)
> 	HOST_WINE_CONF_OPTS += --enable-win64
> 	endif

Wine is a special case. Originally it supported build only on x86 hosts. See 
commit e6803b9f913 (wine: New package). Later, commit 43e7aab08382 (wine: more 
hostarch) added more host architectures. Among these is aarch64. So this code 
is indeed not correct.

> I may filter to %64 instead. Do very 64bits architectures are named
> using 64?

This seems to be the case for the architectures that Buildroot currently 
supports. I don't think this rule holds in the general case. Counterexample: 
alpha.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
