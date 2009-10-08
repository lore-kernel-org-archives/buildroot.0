From: Jon Smirl <jonsmirl@gmail.com>
Date: Thu, 8 Oct 2009 15:34:36 -0400
Subject: [Buildroot] Compiler for arm7tdmi
In-Reply-To: <9e4733910910081232m15e0fc36p15d20691f30efa82@mail.gmail.com>
References: <9e4733910910081155p1e1101abofef056aa21ce82db@mail.gmail.com>
	<20091008191038.GC2266@mx.loc>
	<9e4733910910081216j5adec595t68299a8dcde6ff6@mail.gmail.com>
	<9e4733910910081220ifa85a13oba79a3012b3bce3b@mail.gmail.com>
	<20091008192254.GD2266@mx.loc>
	<9e4733910910081223l2a3dfa1enafd0babe75efc19c@mail.gmail.com>
	<20091008192846.GE2266@mx.loc>
	<9e4733910910081232m15e0fc36p15d20691f30efa82@mail.gmail.com>
Message-ID: <9e4733910910081234s57e9ccf1wb4a6f54a3dee7fc2@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Oct 8, 2009 at 3:32 PM, Jon Smirl <jonsmirl@gmail.com> wrote:
> On Thu, Oct 8, 2009 at 3:28 PM, Bernhard Reutner-Fischer
> <rep.dot.nop@gmail.com> wrote:
>> On Thu, Oct 08, 2009 at 03:23:58PM -0400, Jon Smirl wrote:
>>>On Thu, Oct 8, 2009 at 3:22 PM, Bernhard Reutner-Fischer
>>><rep.dot.nop@gmail.com> wrote:
>>>> On Thu, Oct 08, 2009 at 03:20:23PM -0400, Jon Smirl wrote:
>>>>>On Thu, Oct 8, 2009 at 3:16 PM, Jon Smirl <jonsmirl@gmail.com> wrote:
>>>>>> On Thu, Oct 8, 2009 at 3:10 PM, Bernhard Reutner-Fischer
>>>>>> <rep.dot.nop@gmail.com> wrote:
>>>>>>> On Thu, Oct 08, 2009 at 02:55:48PM -0400, Jon Smirl wrote:
>>>>>>>>I'm not having any luck building a compiler for arm7tdmi. I have the
>>>>>>>>static_flat file format selected, I couldn't get Elf to build. My goal
>>>>>>>>is to compile Contiki for a Freescale MC1322x.
>>>>>>>
>>>>>>> I don't think that flat support is working in the official repo.
>>>>>>> I once started to add support in my repo.or.cz/w/buildroot tree, but
>>>>>>> even that is not finished yet.
>>>>>>
>>>>>> Which format should I be using for arm7tdmi onto bare hardware?
>>>>>
>>>>>The elf target fails building with:
>>>>>cc1: error: unrecognized command line option "-mfdpic"
>>>>
>>>> sounds like a misconfiguration to me (of uClibc).
>>>
>>>I tool all of the defaults except for setting my CPU to arm/arm7tdmi.
>>>
>>>What should I try changing?
>>
>> make uclibc-menuconfig
>> and then search for FDPIC, i.e. type, literally:
>> /FDPIC
>> (followed by a newline).
>> HTH,
>>
>
> There are four choices for output file format:
> ( ) FDPIC ELF
> ( ) STATIC FLAT
> ( ) STATIC FLAT (sep-data)
> (X) SHARED FLAT
>
> ( ) FDPIC ELF
> This is the default. Causes -mfdpic compile error.
>
> ( ) STATIC FLAT
> I tried this one and got the _fini_array_end compile error.
>
> (X) SHARED FLAT
> This is currently building.

fails with:
cc1: error: unrecognized command line option "-mid-shared-library"

>
>
>
> Jon Smirl
> jonsmirl at gmail.com
>



-- 
Jon Smirl
jonsmirl at gmail.com
