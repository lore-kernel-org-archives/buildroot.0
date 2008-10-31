From: Mike Sander <msander@ripnet.com>
Date: Thu, 30 Oct 2008 22:01:15 -0500
Subject: [Buildroot] AT91SAM9G20 support?
In-Reply-To: <103020081936.29280.490A0CB70005979E0000726022007504380401010C0A00009A9C@comcast.net>
References: <103020081936.29280.490A0CB70005979E0000726022007504380401010C0A00009A9C@comcast.net>
Message-ID: <490A74FB.7020705@ripnet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

suffecool at comcast.net wrote:
> Yeah, that's what I am discovering.  I am now looking at various kernel releases to see if and when 9G20 support was added (if at all).
>
> Google searching found this link:
> http://lkml.org/lkml/2008/6/13/62
>
> where it appears that somebody back in June 2008 did a lot of work patching the kernel to get the 9G20 to be supported.  I'm downloading the 2.6.27 kernel now to see if it was added  into that one.
>
> --kev
>
>   

Kevin,
 
You will need the 2.6.27 kernel.  I got a g20 on Friday and successfully 
booted it.  I used an oct 22 buildroot snapshot, and selected the 2.6.27 
kernel. I initially did the buildroot configuration for the 9260.    
After everything was completed I went back and did a kernel "make 
at91sam9g20ek_defconfig, and redid the top level "make".  From what I 
can see, there is no g20 support outside of the kernel (as of a few 
weeks ago).  

For my initial testing I grabbed pre build bootstrap & u-boot for the 
9g20 from linux4sam
(ftp://www.linux4sam.org/pub/uboot/u-boot-1.1.5_atmel_1.7/u-boot-1.1.5_atmel_1.7-at91sam9g20ek-dataflash.bin).      

(ftp://www.linux4sam.org/pub/at91bootstrap/AT91Bootstrap_9g20/dataflash_at91sam9g20ek.bin)

I suspect the buildroot bootstrap & u-boot will work fine, but I have 
not tested them.

HTH

Mike
