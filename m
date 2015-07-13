From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 13 Jul 2015 06:37:18 +0300
Subject: [Buildroot] [PATCH 2/7] package/linux: don't enforce check for
 DTS when not building
In-Reply-To: <55A2FBDF.9070808@mind.be>
References: <cover.1436702899.git.yann.morin.1998@free.fr>
 <ff5a9ea519a5c72dd917369e6409674b9d4a340f.1436702899.git.yann.morin.1998@free.fr>
 <20150712200309.GB2451@tarshish> <55A2FBDF.9070808@mind.be>
Message-ID: <20150713033718.GE2451@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Mon, Jul 13, 2015 at 01:44:31AM +0200, Arnout Vandecappelle wrote:
> On 07/12/15 22:03, Baruch Siach wrote:
> > On Sun, Jul 12, 2015 at 02:11:24PM +0200, Yann E. MORIN wrote:
> >> Currently, this is triggering the error message:
> >>     make randconfig
> >>     make source
> >>
> >> Limit the checks that enforce a DTS is set and at most one DTB is
> >> appended to when we are actually building, like is done for the
> >> configuration-file variables.
> >>
> >> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > 
> > [snip]
> > 
> >> -ifeq ($(BR2_LINUX_KERNEL_DTS_SUPPORT)$(KERNEL_DTS_NAME),y)
> >> +ifeq ($(BR_BUILDING)$(BR2_LINUX_KERNEL_DTS_SUPPORT)$(KERNEL_DTS_NAME),yy)
> > 
> > yy means that exactly two of these must be 'y'. Is that intended?
> 
>  Yes it is, because KERNEL_DTS_NAME is a string, not a boolean, so it
> essentially checks that it is empty and DTS_SUPPORT is selected. But admittedly
> it's not very transparent, it would make sense to add delimiters in-between at
> least.

Thanks for the explanation. A comment would be helpful here, I guess.

Shouldn't we protect the code against someone naming a DTS just 'y'?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
