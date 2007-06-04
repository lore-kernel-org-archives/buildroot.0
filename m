From: Ulf Samuelsson <ulf@atmel.com>
Date: Mon, 04 Jun 2007 21:43:25 +0200
Subject: [Buildroot] BR2_STAGING_DIR config?
In-Reply-To: <20070601213849.GG12010@aon.at>
References: <465EF8D5.30902@gmail.com> <20070531164543.GA22322@aon.at>
	<46607980.9060606@atmel.com> <20070601213849.GG12010@aon.at>
Message-ID: <46646B5D.1040408@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernhard Fischer skrev:
> On Fri, Jun 01, 2007 at 09:54:40PM +0200, Ulf Samuelsson wrote:
>>> The last patch is here:
>>> http://uclibc.org/~aldot/buildroot.mine.cow.20070515-1321.diff.bz2
>>>
>>> But i am hesitating to fix this, since the outdated, deprecated gcc-3.4
>>> series will break with these changes (and i didn't see yet how to fix
>>> that without touching this ancient gcc, which i refuse to do).
>>>
>>> From my POV, it would be fine to discontinue gcc-3.4, not sure what
>>> people think about this, though.
>>>
>> Are we talking about which host compilers we support,
>> or which compilers we can build with buildroot?
> 
> We are talking about which target compilers are "supported" ?).
> 
>> Some people tell me that some AT91 bootcode fails to execute correctly
>> when built with arm gcc-4.x.x but works with arm gcc-3.4.6,
>> so I would like to keep that.
> 
> If you feel like maintaining gcc-3.x support, let me ask to have a look
> at the patch mentioned above. It looks like only the specs need to be
> touched, or even simpler stuff (i.e. no source-code changes at all but
> just buildroot internal fiddling to satisfy gcc-3.x).
>> I would not mind if the host compiler has to be gcc-4.x.x

I dont have any rights yet to apply patches.
Eric set me up, but the instructions to generate a key using ssh-keygem
on the buildroot web page seems outdated.

Does not say that you should generate a passphrase, so I didn't.
ssh-keygen seems to have generated a passphrase on its own,
and I have no clue what it is so I can't access the svn server using ssh.

When I try to log in, I also get a Password request, even though Eric tells
me that he set me up without a password.

I generated a new key with a known password and sent it to Eric's
but he is off the line again and I have no clue when he catches up.

On the gcc 3 issue, I think the best approach would be to
simply split up the exiting gcc make fragment into two files
where one is dedicated to gcc-3 and the other to gcc-4
and developmet is stopped for the gcc-3 branch, but still in the buildroot tree.
I.E: minimal effort...

Eventually I will come to a point where I do not need gcc-3, but just not yet.

> 
> I don't care much about the host compiler. AFAICS currently any C89
> capable host compiler is supposed to do. C99 is of course the preferred
> platform.
> 
> ?) at the time of this writing, we are at (from http://gcc.gnu.org/):
> Status
> 
> Current release series: GCC 4.2.0 (changes)
>     Status: 2007-05-28 (regression fixes & docs only).
>     Serious regressions. All regressions. 
> Previous release series: GCC 4.1.2
>     Status: 2007-05-28 (regression fixes and docs only).
>     Serious regressions. All regressions. 
> Active development: GCC 4.3.0 (changes)
>     Status: Stage 1; 2007-05-28
>     Serious regressions. All regressions. 
> 
> If you're willing to maintain those hunks of buildroot that are
> concerned about gcc-3.x (i.e. toolchain/gcc/gcc-uclibc-3.x.mk) then
> please let me know.
> 
> PS: please feel free to follow-up on the list. Thanks


-- 
Best Regards,
Ulf Samuelsson                ulf at atmel.com
Atmel Nordic AB
Mail:  Box 2033, 174 02 Sundbyberg, Sweden
Visit:  Kavalleriv?gen 24, 174 58 Sundbyberg, Sweden
Phone +46 (8) 441 54 22     Fax +46 (8) 441 54 29
GSM    +46 (706) 22 44 57

Technical support when I am not available:
AT90 AVR Applications Group: mailto:avr at atmel.com
AT91 ARM Applications Group: mailto:at91support at atmel.com
links: www.avrfreaks.net; www.at91.com; avr32linux.org
-------------- next part --------------
A non-text attachment was scrubbed...
Name: ulf.vcf
Type: text/x-vcard
Size: 301 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070604/57de16cb/attachment.vcf 
