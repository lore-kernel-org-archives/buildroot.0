From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Mar 2016 14:06:32 +0100
Subject: [Buildroot] [PATCH v2 2/7] boot/uboot: compute CRC on SPLs for
 Altera SoC FPGA
In-Reply-To: <20160323135741.1c133fed@pcviktorin.fit.vutbr.cz>
References: <1445340745-1000-1-git-send-email-viktorin@rehivetech.com>
 <1445340745-1000-3-git-send-email-viktorin@rehivetech.com>
 <20160322235428.48851315@free-electrons.com>
 <20160323135741.1c133fed@pcviktorin.fit.vutbr.cz>
Message-ID: <20160323140632.3f9299c2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 23 Mar 2016 13:57:41 +0100, Jan Viktorin wrote:

> I am surprise a bit by applying those quite old patchs. I've forgotten
> about this patch series entirely. I am afraid, they've fixed this in
> U-Boot upstream (2016.01?) by generating *.sfp files. I was testing
> this some time ago with:
> 
> BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y                                               
> BR2_TARGET_UBOOT_SPL=y                                                          
> BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl-dtb.sfp"
> 
> and it seems to work. I didn't have time to sync this with Buildroot
> upstream, sorry.

No problem. Before applying, I looked in U-Boot if there was a tool
called mkpimage, and there wasn't, so I assumed it was still needed.

In this case, could you send some follow-up patches that revert the
changes that are no longer needed, and that update the two Altera
defconfigs to use newer U-Boot versions that have this capability?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
