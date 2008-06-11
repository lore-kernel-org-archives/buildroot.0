From: Andreas Kuehn <Andreas.Kuehn@gin.de>
Date: Wed, 11 Jun 2008 12:20:36 +0200
Subject: [Buildroot] kernel image size depends on toolchain?
In-Reply-To: <87lk1cmi7d.fsf@macbook.be.48ers.dk>
References: <484F8157.2050902@gin.de>
	<87hcc0pfrr.fsf@macbook.be.48ers.dk>	<484F8F05.2040105@gin.de>
	<87lk1cmi7d.fsf@macbook.be.48ers.dk>
Message-ID: <484FA6F4.5010408@gin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Here it comes...

                                           old        actual
-------------------------------------------------------------
linux/System.map                          695909      695917
linux/vmlinux                           27876137    27875949
linux/vmlinux.o                         46429585    46507157
linux/arch/arm/boot/Image                2896464  3224138320
linux/arch/arm/boot/uImage               1412856     4528180
linux/arch/arm/boot/compressed/vmlinux   1480207     4594834
linux/arch/arm/boot/compressed/piggy.gz  1397310     4512806

Obviously, the Image file is a little out of shape.
Who created that monster? I take that as a proof that the toolchain 
hasn't been built properly.  -- Any ideas? --




Peter Korsgaard wrote:
>>>>>> "Andreas" == Andreas Kuehn <Andreas.Kuehn@gin.de> writes:
> 
> Hi,
> 
>  Andreas> That is how I found that thing. It simply doesn't fit into my boot
>  Andreas> flash anymore.
>  Andreas> And Yes, it is the same, not even a copy, .config file for both trys.
> 
>  Andreas> The reason why I need the "new" uclibc is, that I need access to the
>  Andreas> PIOs of my at91sam9261 and at91sam9263 controllers. And the "old"
>  Andreas> uclibc has this mmap bug that creates an page overflow error.
> 
>  Andreas> Is there a chance that something in the uclibc like the
>  Andreas> LARGEFILESUPPORT creates some static or incompressable data block?
> 
> That doesn't sound likely. Are the vmlinux files also different in
> sizes? Try comparing output of $CROSS-nm on the vmlinux files.
> 
