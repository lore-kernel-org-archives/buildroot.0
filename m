From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 4 Dec 2018 10:15:11 +0200
Subject: [Buildroot] [PATCH v2,
 2/2] lxc: fix build without stack protector
In-Reply-To: <20181204091029.01a78c0e@windsurf>
References: <20181203223855.10152-1-fontaine.fabrice@gmail.com>
 <20181203223855.10152-2-fontaine.fabrice@gmail.com>
 <20181204055439.rhfgmyb6w7ijykx6@sapphire.tkos.co.il>
 <20181204091029.01a78c0e@windsurf>
Message-ID: <20181204081511.3vxelx4rdxykqozt@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Dec 04, 2018 at 09:10:29AM +0100, Thomas Petazzoni wrote:
> +Arnout, Peter, Yann in Cc.
> 
> On Tue, 4 Dec 2018 07:54:39 +0200, Baruch Siach wrote:
> 
> > > +LXC_CONF_ENV = ax_cv_check_cflags__Werror__fstack_protector_strong=no  
> > 
> > Can't we make this depend on BR2_TOOLCHAIN_HAS_SSP? See the packages ntp or 
> > sox, for example.
> 
> The question is whether we want SSP support to be enabled as soon as
> the toolchain *has* SSP support, or only when the user explicitly
> request SSP support using BR2_SSP_{REGULAR,STRONG,ALL} ?
> 
> This is a real policy decision:
> 
>  - Do we let the packages default to what they think is good (of course
>    as long as the toolchain provides what's needed) ?
> 
>  - Or do we enforce the system-level configuration options that
>    Buildroot has ?

I think we should let upstream packages decide when to enable SSP. This patch, 
however, disables SSP unconditionally, AFAICS. I don't think we want to do 
that. So I suggest to force SSP disable only when BR2_TOOLCHAIN_HAS_SSP is 
disabled.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
