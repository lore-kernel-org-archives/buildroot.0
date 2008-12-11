From: Andreas Kuehn <Andreas.Kuehn@gin.de>
Date: Thu, 11 Dec 2008 16:34:36 +0100
Subject: [Buildroot] dropbear & openssh transfers are limited to about
 800k !?
In-Reply-To: <49410D22.1010206@cetrtapot.si>
References: <4940C961.7080602@gin.de> <87ljunkojx.fsf@macbook.be.48ers.dk>
	<4940EDF4.7040400@gin.de> <49410D22.1010206@cetrtapot.si>
Message-ID: <4941330C.2010205@gin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Okay, I did a complete rebuild of buildroot with the same configuration 
as befor. The transfer limitation is still there. Unfortunately, a have 
no alternative host system to check if the hosts configuration is what 
causes the trouble.
Host: i686/Debian Edge; SSH-2.0-OpenSSH_4.3p2 Debian-9etch3
Box : at91sam9263/buildroot; SSH-2.0-OpenSSH_4.6

Questions, Ideas?

Regards
	akuehn




Hinko Kocevar wrote:
> Andreas Kuehn wrote:
>> Peter Korsgaard wrote:
>>>>>>>> "Andreas" == Andreas Kuehn <Andreas.Kuehn@gin.de> writes:
>>>  Andreas> Hi!
>>>
>>>  Andreas> I'm using buildroot revision 23203. After all seems to work
>>>  Andreas> on my at91sam9263 based board, I figured out that scp
>>>  Andreas> transferes not more than 800kByte in one file. This is not
>>>  Andreas> acceptable and I tried openssh instead of dropbear. Still,
>>>  Andreas> the maximum transferable file size is less than 800k.
>>>
>>> Works here:
>>>
>>> scp binutils-2.18.tar.bz2 root at 150.158.210.109:/tmp/
>>> root at 150.158.210.109's password:
>>> binutils-2.18.tar.bz2                         100%   14MB   2.0MB/s   00:07
>>>
> 
> Here too.
> 
>> disappear. Any other ideas?
>>
>> Not knowing the cause is somewhat uncomfortable. (I hate keeping fingers
>> crossed. Last time I dropped my coffee pot!)
> 
> Try running scp and/or dropbear on target under strace or better gdbserver.
> Does it also limit file size if you transfer file from target to host or only other way around?
> 
> Regards,
> Hinko
> 
