From: Andreas Kuehn <Andreas.Kuehn@gin.de>
Date: Thu, 11 Dec 2008 11:39:48 +0100
Subject: [Buildroot] dropbear & openssh transfers are limited to about
 800k !?
In-Reply-To: <87ljunkojx.fsf@macbook.be.48ers.dk>
References: <4940C961.7080602@gin.de> <87ljunkojx.fsf@macbook.be.48ers.dk>
Message-ID: <4940EDF4.7040400@gin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Peter Korsgaard wrote:
>>>>>> "Andreas" == Andreas Kuehn <Andreas.Kuehn@gin.de> writes:
> 
>  Andreas> Hi!
> 
>  Andreas> I'm using buildroot revision 23203. After all seems to work
>  Andreas> on my at91sam9263 based board, I figured out that scp
>  Andreas> transferes not more than 800kByte in one file. This is not
>  Andreas> acceptable and I tried openssh instead of dropbear. Still,
>  Andreas> the maximum transferable file size is less than 800k.
> 
> Works here:
> 
> scp binutils-2.18.tar.bz2 root at 150.158.210.109:/tmp/
> root at 150.158.210.109's password:
> binutils-2.18.tar.bz2                         100%   14MB   2.0MB/s   00:07
> 
>  Andreas> Any idea where the limit is bound to?
> 
> Maybe you're running out of disk (flash/ramdisk) space?
> 
Hey Peter!
Fine hearing that it should work as expected.

About the memory capacity:
Mem: 8612K used, 118892K free, 0K shrd, 320K buff, 5168K cached
rootfs: 119.5M used, 56.0M free

I still expect something like that ext2-fs has some limitation or uClibc
has some buffer length to be adjusted. But if not, it sounds like my
buildroot needs some "make dirclean" and hopefully all the quirks
disappear. Any other ideas?

Not knowing the cause is somewhat uncomfortable. (I hate keeping fingers
crossed. Last time I dropped my coffee pot!)


Regards
	akuehn
