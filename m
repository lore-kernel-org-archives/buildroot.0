From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Sep 2020 11:57:01 +0200
Subject: [Buildroot] [PATCH 1/1]
 configs/stm32mp157c_dk2_trusted_defconfig: new platform
In-Reply-To: <20200927061606.10239-1-shlomi.39sd@gmail.com>
References: <20200927061606.10239-1-shlomi.39sd@gmail.com>
Message-ID: <20200927115701.520b50a6@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Shlomi,

+Bartosz in Cc.

Thanks for your contribution.

On Sun, 27 Sep 2020 09:16:06 +0300
Shlomi Vaknin <shlomi.39sd@gmail.com> wrote:

> Adding support for trusted configuration for stm32mp157c-dk2.
> In addtion, the following changes made to the original stm32mp157c_dk2_defconfig:
> 1. Enable gadget support and wifi support in `linux.config`.
> 2. Create a new dts file that contains the bindings for the wifi module. This was
>    copied from the stm32 kernel fork.
> 3. A txt file for the wifi firmware. This was copied from the yocto bsp layer of st.
> 
> Signed-off-by: Shlomi Vaknin <shlomi.39sd@gmail.com>

I am not sure it makes sense to have a separate defconfig for this. The
ATF-based boot is really the one recommended by ST, and it's also the
only one that allows to use the STM32 Cube Programmer for flashing.

So I would rather suggest that we change the existing stm32mp1
defconfigs (both DK1 and DK2) to use ATF instead of U-Boot SPL.

Bartosz, what do you think ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
