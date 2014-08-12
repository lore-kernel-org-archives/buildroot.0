From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 12 Aug 2014 12:10:15 +0300
Subject: [Buildroot] [PATCH 2/2] lightning: Added package
In-Reply-To: <53E625E3.7030707@crapouillou.net>
References: <1407279610-15589-1-git-send-email-paul@crapouillou.net>
 <1407279610-15589-2-git-send-email-paul@crapouillou.net>
 <20140806031244.GN2322@tarshish> <53E625E3.7030707@crapouillou.net>
Message-ID: <20140812091015.GB20528@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Paul,

On Sat, Aug 09, 2014 at 03:45:07PM +0200, Paul Cercueil wrote:
> Le 06/08/2014 05:12, Baruch Siach a ?crit :
> >On Wed, Aug 06, 2014 at 01:00:10AM +0200, Paul Cercueil wrote:
> >>+ifeq ($(BR2_PACKAGE_BINUTILS),y)
> >>+LIGHTNING_DEPENDENCIES += binutils
> >>+LIGHTNING_CONF_OPT += --enable-disassembler
> >>+endif
> >
> >Have you tested external toolchains?
> 
> No I did not, as I don't use one. Furthermore, I only tested the package on
> mipsel, the list of archs specified in this package is taken from
> lightning's web page and may be incorrect (hopefully not).

You can easily test external toolchains using the minimal configs at 
http://autobuild.buildroot.net/toolchains/configs/. You'll also find a few 
mipsel variants there.

If this package is not compatible with external toolchain (and so I suspect) 
then it should depend on BR2_TOOLCHAIN_BUILDROOT.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
