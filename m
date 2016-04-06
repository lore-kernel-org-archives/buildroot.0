From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 6 Apr 2016 06:27:15 +0300
Subject: [Buildroot] [PATCH] mosh: fix build with the Codescape IMG
 toolchain
In-Reply-To: <57043281.5050104@mind.be>
References: <95907701a43145654f7962319823a0f7fe73551b.1459879412.git.baruch@tkos.co.il>
 <57043281.5050104@mind.be>
Message-ID: <20160406032715.GY3088@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Tue, Apr 05, 2016 at 11:47:45PM +0200, Arnout Vandecappelle wrote:
> On 04/05/16 20:03, Baruch Siach wrote:
> >The Codescape IMG toolchain does not provide the ssp library even though it's
> >a glibc toolchain, and thus selects BR2_TOOLCHAIN_HAS_SSP. Add a patch that
> >changes the compile test for -fstack-protector-all to a build test that
> >correctly fails when ssp is missing.
> >
> >This makes the seeding of ssp related configure variables unnecessary.
> 
>  So, this fixes the issue for mosh, but not for libpam-tacplus,
> powerpc-utils, psmisc, ruby, sox, and stunnel...
> 
>  Wouldn't it be better to fix BR2_TOOLCHAIN_HAS_SSP itself instead?
> Otherwise there isn't much point in having this symbol... So it shouldn't be
> selected by glibc/musl itself, but by the individual external toolchains.
> Cfr. the previous discussion for sox [1].
> 
>  That said, it would of course be a great idea to upstream the patch to mosh
> so we can remove our workaround at some point.

Upstream status of the mosh patch is at 
https://github.com/mobile-shell/mosh/pull/744.

> [1] http://patchwork.ozlabs.org/patch/590047/

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
