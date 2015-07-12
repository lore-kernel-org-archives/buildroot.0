From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 12 Jul 2015 23:03:09 +0300
Subject: [Buildroot] [PATCH 2/7] package/linux: don't enforce check for
 DTS when not building
In-Reply-To: <ff5a9ea519a5c72dd917369e6409674b9d4a340f.1436702899.git.yann.morin.1998@free.fr>
References: <cover.1436702899.git.yann.morin.1998@free.fr>
 <ff5a9ea519a5c72dd917369e6409674b9d4a340f.1436702899.git.yann.morin.1998@free.fr>
Message-ID: <20150712200309.GB2451@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Sun, Jul 12, 2015 at 02:11:24PM +0200, Yann E. MORIN wrote:
> Currently, this is triggering the error message:
>     make randconfig
>     make source
> 
> Limit the checks that enforce a DTS is set and at most one DTB is
> appended to when we are actually building, like is done for the
> configuration-file variables.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

[snip]

> -ifeq ($(BR2_LINUX_KERNEL_DTS_SUPPORT)$(KERNEL_DTS_NAME),y)
> +ifeq ($(BR_BUILDING)$(BR2_LINUX_KERNEL_DTS_SUPPORT)$(KERNEL_DTS_NAME),yy)

yy means that exactly two of these must be 'y'. Is that intended?

baruch


-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
