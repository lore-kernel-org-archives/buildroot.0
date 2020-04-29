From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 29 Apr 2020 14:48:19 +0200
Subject: [Buildroot] When building the net-next kernel,
 buildroot is asking for all the kernel config options one by one to
 enable
In-Reply-To: <1588163575379-0.post@n4.nabble.com>
References: <1588163575379-0.post@n4.nabble.com>
Message-ID: <20200429144819.74adf0b0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 29 Apr 2020 07:32:55 -0500 (CDT)
Ganesh <ganesh45in@gmail.com> wrote:

> My board is an SAMA5D3 (ARM ) board.
> 
> I have done the following steps before starting the kernel build:
> 
> 1. Put my defconfig inside the kernel/arch/arm/config 
> 2. Go to buildroot directory, make <my_project_defconfig>
> 3. make 
> 
> my_project_defconfig has the following lines of concern:
> 
> BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="<kernel path of the defconfig>"
> BR2_LINUX_KERNEL_DTS_SUPPORT=y
> BR2_LINUX_KERNEL_INTREE_DTS_NAME="My_dts.dts"
> 
> After giving the make, am getting a series of prompts from the buildroot
> like enabling drivers for a specific product, starting with the GCC thing
> and most of which I do not know .
> What I expected was that I have already specified the defconfig and that
> buildroot should be able to enable the necessary things automatically.
> 
> Can anyone tell me where I have gone wrong?

This simply means that your kernel configuration file is not
"up-to-date" with the kernel version you're using. Due to this, some
options exist in the kernel for which the values are not specified in
the kernel configuration file you are providing. So the kernel has to
ask you whether you want to enable or disable those options.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
