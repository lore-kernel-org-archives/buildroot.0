From: chris at basementcode.com <chris@basementcode.com>
Date: Tue, 22 Mar 2011 14:06:18 -0500
Subject: [Buildroot] problems compiling crosstools-ng
In-Reply-To: <1300814816.3848.93.camel@sadov-t.linux-ink.vo>
References: <cd12ab38cf1fa34fa4c10dfaf6eec135@basementcode.com>
	<201103221710.32592.yann.morin.1998@anciens.enib.fr>
	<1300814816.3848.93.camel@sadov-t.linux-ink.vo>
Message-ID: <e76b8d6c5f12b51b804484cba5fd787d@basementcode.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 On Tue, 22 Mar 2011 20:26:56 +0300, Oleg Sadov <sadov@linux-ink.ru> 
 wrote:
> 22/03/2011 17:10 +0100, Yann E. MORIN wrote:
>> On Tuesday 22 March 2011 15:24:39 chris at basementcode.com wrote:
>> >  buildroot-2011.02:
>> >  during the configure stage of binutils the configure script 
>> spawns the
>> >  following process over and over until swap is filled and the 
>> system
>> >  crashes:
>> >  makeinfo --force --force --force --force --force --force --force
>> >  --force --force --force --force  ......
>>
>> Yes, I know about this issue. You're not the first one to report it, 
>> but I
>> was not able to reproduce it, not to understand how it can happen 
>> (although
>> I have a small idea, but I'm not sure)
>>
>> I'm doing some changes right now, that should fix the issue if all 
>> goes well.
>
> I've got the same problem on my RHEL-based system. Seems like the 
> root
> of problem in search path for commands setted up by Croostool-NG
> environment -- local script 'makeinfo' placed in path before the real
> 'makeinfo'. This script trying to execute 'makeinfo --force' command
> and, voil? -- we got the infinite recursion!
>
> Quck & dirty solution -- place the real path of makeinfo utility
> (usually /usr/bin/makeinfo) in crosstool-NG.sh. Just put attached to
> this mail patch in directory:
>
> toolchain/toolchain-crosstool-ng
>
> and rerun make -- hopefully your problem will be solved.
 It was solved. Thank you very much for the patch.
>
>> Regards,
>> Yann E. MORIN.
>
> SY
> --Oleg

 Yann, you had asked me some question earlier about this problem I was 
 having. I will get back to you with answers to them as soon as I have a 
 moment to investigate.

 thanks again,
 -Chris
