From: Andreas Kuehn <Andreas.Kuehn@gin.de>
Date: Wed, 11 Jun 2008 10:38:29 +0200
Subject: [Buildroot] kernel image size depends on toolchain?
In-Reply-To: <87hcc0pfrr.fsf@macbook.be.48ers.dk>
References: <484F8157.2050902@gin.de> <87hcc0pfrr.fsf@macbook.be.48ers.dk>
Message-ID: <484F8F05.2040105@gin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

That is how I found that thing. It simply doesn't fit into my boot flash 
anymore.
And Yes, it is the same, not even a copy, .config file for both trys.

The reason why I need the "new" uclibc is, that I need access to the 
PIOs of my at91sam9261 and at91sam9263 controllers. And the "old" uclibc 
has this mmap bug that creates an page overflow error.

Is there a chance that something in the uclibc like the LARGEFILESUPPORT 
creates some static or incompressable data block?



Peter Korsgaard wrote:
>>>>>> "Andreas" == Andreas Kuehn <Andreas.Kuehn@gin.de> writes:
> 
> Hi,
> 
>  Andreas> Created:      Tue Jun 10 11:45:43 2008
>  Andreas> Image Type:   ARM Linux Kernel Image (uncompressed)
>  Andreas> Data Size:    4528112 Bytes = 4421.98 kB = 4.32 MB
> 
>  Andreas> With an old toolchain I can achive regular sizes:
> 
>  Andreas> Created:      Tue Jun 10 13:44:26 2008
>  Andreas> Image Type:   ARM Linux Kernel Image (uncompressed)
>  Andreas> Data Size:    1412792 Bytes = 1379.68 kB = 1.35 MB
> 
> Strange. And you are sure you're using the exact same kernel config?
> Do both kernel images boot?
> 
