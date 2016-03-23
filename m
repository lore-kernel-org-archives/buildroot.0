From: Jan Viktorin <viktorin@rehivetech.com>
Date: Wed, 23 Mar 2016 13:57:41 +0100
Subject: [Buildroot] [PATCH v2 2/7] boot/uboot: compute CRC on SPLs for
 Altera SoC FPGA
In-Reply-To: <20160322235428.48851315@free-electrons.com>
References: <1445340745-1000-1-git-send-email-viktorin@rehivetech.com>
 <1445340745-1000-3-git-send-email-viktorin@rehivetech.com>
 <20160322235428.48851315@free-electrons.com>
Message-ID: <20160323135741.1c133fed@pcviktorin.fit.vutbr.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I am surprise a bit by applying those quite old patchs. I've forgotten
about this patch series entirely. I am afraid, they've fixed this in
U-Boot upstream (2016.01?) by generating *.sfp files. I was testing
this some time ago with:

BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y                                               
BR2_TARGET_UBOOT_SPL=y                                                          
BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl-dtb.sfp"

and it seems to work. I didn't have time to sync this with Buildroot
upstream, sorry.

Regards
Jan

On Tue, 22 Mar 2016 23:54:28 +0100
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Hello,
> 
> On Tue, 20 Oct 2015 13:32:20 +0200, Jan Viktorin wrote:
> > Signed-off-by: Jan Viktorin <viktorin@rehivetech.com>
> > ---
> >  boot/uboot/Config.in | 10 ++++++++++
> >  boot/uboot/uboot.mk  |  9 +++++++++
> >  2 files changed, 19 insertions(+)
> > 
> > diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
> > index 8643dab..b2a69f3 100644
> > --- a/boot/uboot/Config.in
> > +++ b/boot/uboot/Config.in
> > @@ -338,6 +338,16 @@ config BR2_TARGET_UBOOT_ZYNQ_IMAGE
> >  	 for u-boot-dtb.img file so this U-Boot format is required
> >  	 to be set.
> >  
> > +config BR2_TARGET_UBOOT_SOCFPGA_IMAGE_CRC  
> 
> I've added ALTERA in the option name.
> 
> > +	bool "CRC SPL image for SoC FPGA"  
> 
> In the prompt.
> 
> > +	depends on BR2_arm
> > +	depends on BR2_TARGET_UBOOT_SPL
> > +	help
> > +	  Generate SPL image fixed by the mkpimage tool to enable
> > +	  booting on the SoC FPGA based platforms. The tool is
> > +	  available at https://github.com/maximeh/mkpimage.
> > +	  It requires a Go language compiler installed on your host.  
> 
> I've tweaked this description to longer refer to Maxime's tool since
> you're not using it. I've also s/SoC FPGA/Altera SoC FPGA/. SoC FPGA is
> really a poor choice from Altera, since it's just two generic terms put
> next to each other, so we really need to write "Altera SoC FPGA"
> everywhere, otherwise it's confusing.
> 
> Applied with those things fixed.
> 
> Best regards,
> 
> Thomas



-- 
   Jan Viktorin                  E-mail: Viktorin at RehiveTech.com
   System Architect              Web:    www.RehiveTech.com
   RehiveTech
   Brno, Czech Republic
