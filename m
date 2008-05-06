From: Arnar Mar Sig <antab@valka.is>
Date: Tue, 6 May 2008 13:23:37 +0000
Subject: [Buildroot] Ulf, you broke AVR32, why?
In-Reply-To: <008a01c8af69$7d5d1be0$5e8d910a@atmel.com>
References: <d6cda7730805051134j245a8687o66eaa6fc9d3c93ae@mail.gmail.com>
	<013a01c8aef9$5aa98d10$070514ac@atmel.com>
	<d6cda7730805051634p6bb3a5c4mb9e584e6059cb693@mail.gmail.com>
	<008a01c8af69$7d5d1be0$5e8d910a@atmel.com>
Message-ID: <FB55BA20-F1DB-43D5-B40A-8897ED97FAC8@valka.is>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On May 6, 2008, at 9:57 AM, Ulf Samuelsson wrote:
>> On Mon, May 5, 2008 at 6:41 PM, Ulf Samuelsson <ulf.samuelsson@atmel.com 
>> > wrote:
>>>> You removed something that was working in favor of something that  
>>>> is
>>>> not for no reason.
>>>
>>> The Atmel patches adds way too much bloat to the svn.
>>
>> Google's entire svn history has 3Mb, including the AVR32 patches plus
>> careless local svn mv's. How is that too much bloat?
>>
>
> The AVR32 patches are larger than that, just for one version.
> Adding patches for several versions of the toolchain will make this  
> worse.

antab at imbakassi:~/v100sc2$ du -sch buildroot-upstream/
131M	buildroot-upstream/

antab at imbakassi:~/v100sc2/buildroot-fork/toolchain/gcc$ du -ch 4.2.2/ 
*avr32*
900K	4.2.2/900-gcc-4.2.2.atmel.1.0.8.patch.avr32
4.0K	4.2.2/901-avr32-no-cond-exec-before-reload-by-default.patch.avr32
904K	total

Thats under 1MB for one version, and thous patches dont change that  
often. I dont mind that patches are removed for old toolchains, but  
IMO they should not be removed. It pisses me alot more to have to  
download a 43MB with the prepatched toolchain source from a dead slow  
server every time its updated.
I also build for x86 and now i have to keep and download source for 2  
toolchains, thats 86MB while it could have been 44MB...

>>
>> You didn't even care to test your changes, and despite protests
>> removed the toolchain support anyway. You are taking away our freedom
>> to update, fix, do whatever with the toolchain from within buildroot.
>
> If you check above, you see it is not like that.
> You can modify the external toolchain by applying patches,
> so you have the freedom you want.
>
> If you can find another host where the stuff can be located
> then it is easy to move it. I just put it on that server for  
> convenience
> and I see only drawbacks that it cannot be updated by other
> members of the buildroot community.

I'm can donate a server for storing thous patches, could be setup up  
as a SVN repo so members can easy add to it (and keeping track of  
everything), and then a script that checks that stuff out and makes it  
accessable via FTP and HTTP at the same site.

Greets
	Arnar mar Sig
