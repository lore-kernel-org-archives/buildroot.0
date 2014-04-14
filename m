From: Parsa Panahi <panahi.parsa@paravisioner.com>
Date: Mon, 14 Apr 2014 21:50:53 +0430
Subject: [Buildroot] Asking a favor
In-Reply-To: <20140414181812.21e12b0c@skate>
References: <ea83c79e30b1bba43b6fe3de6096e8e7@paravisioner.com>
 <20140413212851.GA6582@free.fr> <20140414091249.09b2db65@skate>
 <db58e085aec8b3d6153effbff253e376@paravisioner.com>
 <20140414181812.21e12b0c@skate>
Message-ID: <182de9096cb1b88ec1e69efd698351b5@paravisioner.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 

Dear Thomas, I've Selected the "Use a device tree present in the kernel"
in the "Kernel -> Device tree support" and I don't know why it shows 

BR2_LINUX_KERNEL_INTREE_DTS_NAME="" !!!

what are my options in here so I could manually type it in the .config
file ?

On 2014-04-14 20:48, Thomas Petazzoni wrote: 

> Dear Parsa Panahi,
> 
> On Mon, 14 Apr 2014 20:45:16 +0430, Parsa Panahi wrote:
> 
>> Hi Thomas I knew that , but it doesn't matter if I select Device Tree blob or not, it always gives me the error !
> 
> You do have Device Tree support selected. From your .config file:
> 
> BR2_LINUX_KERNEL_DTS_SUPPORT=y
> BR2_LINUX_KERNEL_USE_INTREE_DTS=y
> # BR2_LINUX_KERNEL_USE_CUSTOM_DTS is not set
> BR2_LINUX_KERNEL_INTREE_DTS_NAME=""
> BR2_LINUX_KERNEL_INSTALL_TARGET=y
> 
> So here, you have selected Device Tree support
> (BR2_LINUX_KERNEL_DTS_SUPPORT=y), indicated you wanted to use a Device
> Tree source that is part of the kernel sources
> (BR2_LINUX_KERNEL_USE_INTREE_DTS=y), but you haven't told Buildroot
> *which* Device Tree to use (BR2_LINUX_KERNEL_INTREE_DTS_NAME is empty).
> 
> Best regards,
> 
> Thomas

-- 

Parsa Panahi
D?partement de g?nie ?lectrique
?tudiant de l'?lectronique num?rique
Sharif Universit? de Technologie - T?h?ran - Iran

 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140414/b6bb6c6b/attachment.html>
