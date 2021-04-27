From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 27 Apr 2021 08:58:50 +0200
Subject: [Buildroot] [PATCH] boot: introduce at91bootstrap4
In-Reply-To: <3dba2a91-26d5-12fa-ec05-adc6395f5e59@microchip.com>
References: <20210423070822.1351638-1-eugen.hristev@microchip.com>
 <20210426220343.003df308@windsurf>
 <3dba2a91-26d5-12fa-ec05-adc6395f5e59@microchip.com>
Message-ID: <20210427085850.5ee8f336@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 27 Apr 2021 06:07:22 +0000
<Eugen.Hristev@microchip.com> wrote:

> > Why would we need a new package for this? It still like just a new
> > version of at91bootstrap. I just had a look a the differences between
> > at91bootstrap3/ and at91bootstrap4/ and here are the only meaningful
> > differences:  
> 
> One big reason for this is the fact that some MPUs are no longer 
> supported. We have to keep the 3.x series available for MPUs like 9x5, 
> 9260, etc, which are not supported in bootstrap4.
> 
> Bootstrap4 only supports sama5d2, sama5d3, sama5d4, sam9x60 and sama7g5.
> For these variants only, the user could possibly use either 
> at91bootstrap3 or at91bootstrap4.
> But all the older boards still need bootstrap3.
> 
> How would you manage this ?
> I thought the easiest way is to have two separate packages, rather than 
> trying to obtain two pretty much different versions of bootstrap in the 
> same recipe.
> And buildroot does not really have the 'machine concept' like yocto 
> project does. So you don't really know for which machine you are 
> building a package, inside that package's recipe. And probably in 
> buildroot you don't even want to know and you don't care.
> 
> So, what do you think ?

Well, I think what I suggested in my previous e-mail: to have a single
package, which allows to chose between the 3.x series and the 4.x
series.

> > So, shouldn't we instead have a single package covering both? Perhaps
> > with a sub-option to select "latest 3.x version" and "latest 4.x
> > version" ?  
> 
> 3.x versions series will be phased out. I mean, no longer updated . And 
> not in long term, but , very soon.

No longer updated by Microchip maybe. But no longer used by Buildroot
users, certainly not. There are plenty of people that still have AT91
platforms around, in production, and that continue to update them.

> > (Side note: I find it somewhat annoying that such vendor-provided
> > solutions tend to drop support for older platforms... It seems that
> > open-source communities do a better job at maintaining long-term
> > support for older platforms. What would you say if you had to use a
> > decade old Buildroot or Yocto to build a system for an AT91SAM9263
> > processor ?)  
> 
> Well. This happens with everything. Even in open source. Some old 
> architectures are being removed. You cannot use kernel 5.12 for 
> computers with floppy disks anymore. Such is life... things get 
> obsoleted. There are still buildroot and yocto available for older 
> processors, just not the latest versions.

Well, it depends on the speed at which things get phased out, and
whether they are still used in production. Linux 5.12 still has support
for AT91RM9200, and all ARMv5 AT91 processors, for example. And so has
the latest U-Boot release. For your own product line, Linux, U-Boot,
Buildroot, in their latest versions all continue to have support for
your oldest products, and AT91Bootstrap is the first component to phase
out support for these platforms, and ironically, it's the
vendor-provided software component.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
