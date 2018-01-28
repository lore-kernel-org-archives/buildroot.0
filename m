From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 28 Jan 2018 05:24:24 +0200
Subject: [Buildroot] [PATCH 2/2] ltp-testsuite: drop redundant arch
 dependency entries
In-Reply-To: <20180127230707.450300b0@windsurf>
References: <944db376505dab7095cf32949160c0d024d92926.1516964598.git.baruch@tkos.co.il>
 <2f61c63d53f8ba4ea0b65942b57f67a156fbf778.1516964598.git.baruch@tkos.co.il>
 <20180127230707.450300b0@windsurf>
Message-ID: <20180128032424.uetwxjkw2pvzjiad@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sat, Jan 27, 2018 at 11:07:07PM +0100, Thomas Petazzoni wrote:
> On Fri, 26 Jan 2018 13:03:18 +0200, Baruch Siach wrote:
> > BR2_TOOLCHAIN_HAS_SYNC_4 is enabled for all these architectures except
> > arc. There is no need to list them explicitly.
> > 
> > Cc: Romain Naour <romain.naour@gmail.com>
> > Cc: Petr Vorel <petr.vorel@gmail.com>
> > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> > ---
> >  package/ltp-testsuite/Config.in | 5 -----
> >  1 file changed, 5 deletions(-)
> > 
> > diff --git a/package/ltp-testsuite/Config.in b/package/ltp-testsuite/Config.in
> > index 4c00e40f330e..711c859e6caf 100644
> > --- a/package/ltp-testsuite/Config.in
> > +++ b/package/ltp-testsuite/Config.in
> > @@ -5,11 +5,6 @@ config BR2_PACKAGE_LTP_TESTSUITE_ARCH_SUPPORTS
> >  	# provided in ltp-testsuite
> >  	default y if BR2_TOOLCHAIN_HAS_SYNC_4
> >  	default y if BR2_arc
> > -	default y if BR2_i386
> > -	default y if BR2_powerpc
> > -	default y if BR2_powepc64
> > -	default y if BR2_powerpc64le
> > -	default y if BR2_x86_64
> 
> Is this really a correct patch ? It's not because
> BR2_TOOLCHAIN_HAS_SYNC_4 already covers
> i386/powerpc/powerpc64/powerpc64le/x86_64 that it makes sense to use
> BR2_TOOLCHAIN_HAS_SYNC_4 instead.
> 
> What if an architecture gets added to BR2_TOOLCHAIN_HAS_SYNC_4, but
> isn't supported by ltp-testsuite ?

My understanding, based on the commit log of 583f59702bdd 
(package/ltp-testsuite: refine architecture dependency), is that when the 
toolchain implements __sync_add_and_fetch() there is no need for the 
architecture specific fallback implementation that ltp-testsuite provides. 
This is the case already for e.g. ARM. So as long as the added architecture is 
covered by BR2_TOOLCHAIN_HAS_SYNC_4, we should be fine.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
