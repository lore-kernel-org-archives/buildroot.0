From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 9 Aug 2017 18:49:18 +0300
Subject: [Buildroot] Compiling buildroot for Arm "Armada 166E" Target
In-Reply-To: <CANK3ZEdaEdw6YuyN-offP1M4F88zdgy_Eg7qikQ5uzUDC2-XKQ@mail.gmail.com>
References: <CANK3ZEdaEdw6YuyN-offP1M4F88zdgy_Eg7qikQ5uzUDC2-XKQ@mail.gmail.com>
Message-ID: <20170809154918.tthy3t2p6d3hsqon@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Aweem,

On Wed, Aug 09, 2017 at 06:00:55PM +0530, Aseem Sharma wrote:
> I am naive to buildroot & processor world trying to compile
> "buildroot-2017.02.5" for "Marvell ARM Armada 166E processor (compatible to
> ARMv5TE instruction-set)" based old system. However, I do not understand
> the options to be selected in "make menuconfig" for
> 1. Target options->Target Architecture {think should be ARM - little endian}
> 2. Target options->Target Architecture variant
> 
> Thanks in advance for your help.

Based on the Armada 16x Datasheet[1], the mainline kernel 
arch/arm/mach-mmp/Kconfig (CONFIG_CPU_PXA168) and arch/arm/Kconfig 
(CONFIG_IWMMXT), it seems like you need the iwmmxt ARM variant for your Armada 
166E processor.

[1] http://www.marvell.com.cn/application-processors/armada-100/assets/armada_16x_datasheet.pdf

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
