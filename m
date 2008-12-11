From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 11 Dec 2008 11:13:06 +0100
Subject: [Buildroot] dropbear & openssh transfers are limited to about
	800k !?
In-Reply-To: <4940C961.7080602@gin.de> (Andreas Kuehn's message of "Thu\,
	11 Dec 2008 09\:03\:45 +0100")
References: <4940C961.7080602@gin.de>
Message-ID: <87ljunkojx.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Andreas" == Andreas Kuehn <Andreas.Kuehn@gin.de> writes:

 Andreas> Hi!

 Andreas> I'm using buildroot revision 23203. After all seems to work
 Andreas> on my at91sam9263 based board, I figured out that scp
 Andreas> transferes not more than 800kByte in one file. This is not
 Andreas> acceptable and I tried openssh instead of dropbear. Still,
 Andreas> the maximum transferable file size is less than 800k.

Works here:

scp binutils-2.18.tar.bz2 root at 150.158.210.109:/tmp/
root at 150.158.210.109's password:
binutils-2.18.tar.bz2                         100%   14MB   2.0MB/s   00:07

 Andreas> Any idea where the limit is bound to?

Maybe you're running out of disk (flash/ramdisk) space?

-- 
Bye, Peter Korsgaard
