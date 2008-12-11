From: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
Date: Thu, 11 Dec 2008 13:52:50 +0100
Subject: [Buildroot] dropbear & openssh transfers are limited to about
 800k !?
In-Reply-To: <4940EDF4.7040400@gin.de>
References: <4940C961.7080602@gin.de> <87ljunkojx.fsf@macbook.be.48ers.dk>
	<4940EDF4.7040400@gin.de>
Message-ID: <49410D22.1010206@cetrtapot.si>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andreas Kuehn wrote:
> 
> Peter Korsgaard wrote:
>>>>>>> "Andreas" == Andreas Kuehn <Andreas.Kuehn@gin.de> writes:
>>  Andreas> Hi!
>>
>>  Andreas> I'm using buildroot revision 23203. After all seems to work
>>  Andreas> on my at91sam9263 based board, I figured out that scp
>>  Andreas> transferes not more than 800kByte in one file. This is not
>>  Andreas> acceptable and I tried openssh instead of dropbear. Still,
>>  Andreas> the maximum transferable file size is less than 800k.
>>
>> Works here:
>>
>> scp binutils-2.18.tar.bz2 root at 150.158.210.109:/tmp/
>> root at 150.158.210.109's password:
>> binutils-2.18.tar.bz2                         100%   14MB   2.0MB/s   00:07
>>

Here too.

> disappear. Any other ideas?
> 
> Not knowing the cause is somewhat uncomfortable. (I hate keeping fingers
> crossed. Last time I dropped my coffee pot!)

Try running scp and/or dropbear on target under strace or better gdbserver.
Does it also limit file size if you transfer file from target to host or only other way around?

Regards,
Hinko

-- 
Hinko Ko?evar, OSS developer
?ETRTA POT, d.o.o.
Planina 3, 4000 Kranj, SI EU
tel     ++386 (0) 4 280 66 03
e-mail  hinko.kocevar at cetrtapot.si
http    www.cetrtapot.si
