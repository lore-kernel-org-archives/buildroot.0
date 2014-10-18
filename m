From: Eric =?ISO-8859-1?B?QuluYXJk?= <eric@eukrea.com>
Date: Sat, 18 Oct 2014 22:05:44 +0200
Subject: [Buildroot] [PATCH] mx53loco_defconfig: refresh
In-Reply-To: <20141018183534.0fa51566@free-electrons.com>
References: <1413558308-30081-1-git-send-email-vincent.stehle@freescale.com>
 <20141018183534.0fa51566@free-electrons.com>
Message-ID: <20141018220544.7046401e@e6520eb.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Hi Vincent,

Le Sat, 18 Oct 2014 18:35:34 +0200,
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> a ?crit :

> On Fri, 17 Oct 2014 17:05:08 +0200, Vincent Stehl? wrote:
> > Force gcc to version 4.5, as versions 4.7 and 4.8 break the boot.
> > 
> > Switch to VFPv3(d32), as i.MX53 Cortex-A8 supports it (MVFR0 = 0x11110222).
> 
> This is quite worrying. Gcc 4.5 is very old now, and we would like to
> get rid of it in Buildroot rather than adding more defconfig that use
> it.
> 
> Is there some hope to get a fix in a more recent gcc such as 4.9.x ?
> Has the specific gcc bug been identified and reported ?
> 
if you switch to imx_2.6.35_maintain branch instead of older
rel_imx_2.6.35_11.09.01 actually used in the defconfig, you will get
(among other fixes) these patches :
http://git.freescale.com/git/cgit.cgi/imx/linux-2.6-imx.git/commit/?h=imx_2.6.35_maintain&id=96a7591a6f72db6d7bb337e78d61c53f670d9793
http://git.freescale.com/git/cgit.cgi/imx/linux-2.6-imx.git/commit/?h=imx_2.6.35_maintain&id=a0de0f94dd9868d2280aa8cdb8295231e00d5ef6
and I believe the kernel built with recent gcc will run as it runs fine
on i.MX53 when built with Yocto.

Best regards,
Eric
