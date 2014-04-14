From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Apr 2014 18:18:12 +0200
Subject: [Buildroot] Asking a favor
In-Reply-To: <db58e085aec8b3d6153effbff253e376@paravisioner.com>
References: <ea83c79e30b1bba43b6fe3de6096e8e7@paravisioner.com>
 <20140413212851.GA6582@free.fr> <20140414091249.09b2db65@skate>
 <db58e085aec8b3d6153effbff253e376@paravisioner.com>
Message-ID: <20140414181812.21e12b0c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Parsa Panahi,

On Mon, 14 Apr 2014 20:45:16 +0430, Parsa Panahi wrote:
>  
> 
> Hi Thomas I knew that , but it doesn't matter if I select Device Tree
> blob or not, it always gives me the error ! 

You do have Device Tree support selected. From your .config file:

BR2_LINUX_KERNEL_DTS_SUPPORT=y
BR2_LINUX_KERNEL_USE_INTREE_DTS=y
# BR2_LINUX_KERNEL_USE_CUSTOM_DTS is not set
BR2_LINUX_KERNEL_INTREE_DTS_NAME=""
BR2_LINUX_KERNEL_INSTALL_TARGET=y

So here, you have selected Device Tree support
(BR2_LINUX_KERNEL_DTS_SUPPORT=y), indicated you wanted to use a Device
Tree source that is part of the kernel sources
(BR2_LINUX_KERNEL_USE_INTREE_DTS=y), but you haven't told Buildroot
*which* Device Tree to use (BR2_LINUX_KERNEL_INTREE_DTS_NAME is empty).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
