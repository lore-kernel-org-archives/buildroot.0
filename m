From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 17 Aug 2015 06:37:29 +0000
Subject: [Buildroot] [PATCH] u-boot: 2015.07 - fix creation of .config
In-Reply-To: <1439761399.2406.3.camel@embedded.rocks>
References: <1438351475-14447-1-git-send-email-abrodkin@synopsys.com>
 <20150731161818.2056383e@free-electrons.com>
 <1438355649.4848.41.camel@synopsys.com>
 <1438600559.13201.4.camel@synopsys.com>
 <1439295600.3252.2.camel@synopsys.com>
 <20150812102334.15742776@free-electrons.com>
 <1439761399.2406.3.camel@embedded.rocks>
Message-ID: <1439793449.3667.7.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jorg,

On Sun, 2015-08-16 at 23:43 +0200, J?rg Krause wrote:
> Hi Thomas, Alexey,
> 
> On Mi, 2015-08-12 at 10:23 +0200, Thomas Petazzoni wrote:
> > Dear Alexey Brodkin,
> > 
> > On Tue, 11 Aug 2015 12:20:01 +0000, Alexey Brodkin wrote:
> > 
> > > Any chance for this one to be applied?
> > > Note without this change or anything similar U-Boot from
> > > snsp_axs10x_defconfig fails to config.
> > 
> > I haven't had the time to look into this in detail. It would be great
> > if Yann, or J?rg could have a look. I remain unhappy with solving
> > such
> > a problem by using a patch against U-Boot 2015.07, because it means
> > anyone specifying a slightly different U-Boot version (but based on
> > 2015.07) will still have the problem.
> 
> It looks like upstream [1] does not revert this patch but fixes the
> problem with this patch [2]. Alexey, does this patch solves your
> problem?
> 
> Best regards
> J?rg Krause
> 
> 
> [1]
> https://www.mail-archive.com/u-boot at lists.denx.de/msg179681.html 
> 
> [2]
> http://patchwork.ozlabs.org/patch/502793/

The thing is [2] solves problem only for ARM, while other arches are still
affected. And that means ARC is not cured by that patch.

Indeed proper fix is to patch all arches in the same way,
i.e. select default option for each and every architecture in U-Boot.

But speaking about Buildroot that approach has at least 2 downsides:
 1) Not all arches are fixed upstream so in Buildroot we'll have patches
    that are not there in upstream yet.

 2) We'll have quite a few patches in Buildroot for U-boot each fixing
    a separate arch.

If (1) and (2) are OK for Buildroot I'll try to come up with those patches ASAP.

My initial approach was IMHO the cleanest and simplest. But if it doesn't work
we'll do another fix :)

-Alexey
