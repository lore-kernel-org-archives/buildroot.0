From: Christopher Taylor <chtaylo3@gmail.com>
Date: Thu, 15 May 2008 19:20:03 -0400
Subject: [Buildroot] ARM build error with llseek.c
In-Reply-To: <326f33790805112024l75b6e2d5x41f4fb229b982274@mail.gmail.com>
References: <326f33790805081549v3afdc776u56cdeb8e57167782@mail.gmail.com>
	<1CF6EDDF0820924DA43C9A52FE7325950B4DA9C3@MI8NYCMAIL17.Mi8.com>
	<326f33790805081624g2daf1407v15e8e84ad1914b77@mail.gmail.com>
	<1CF6EDDF0820924DA43C9A52FE7325950B4DAA2E@MI8NYCMAIL17.Mi8.com>
	<326f33790805081812sc3b8d29v948f331f7fe84653@mail.gmail.com>
	<326f33790805081813lff2c266wfc23c361119452df@mail.gmail.com>
	<326f33790805112024l75b6e2d5x41f4fb229b982274@mail.gmail.com>
Message-ID: <2590773a0805151620r18b9f1b3qb81e255beee1ad71@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Whops, replied to poster not to list ... sorry everyone ....


I've had bad luck figuring out what parts of the tool chain I need to
make clean when I make a change to uclibc.  Look for LFS, large file
support and other things like that in
menuconfig
uclibc-menuconifg
busybox-menuconfig
linux26-menuconifg

by suggestion is then to go to the build dir for each of the major
components (buildroot, uclibc, busybox, and the kernel) and do a make
clean.

You should have better luck from there.


if that doesn't work, try d/l buildroot again, copy over your config
files and rebuild

HTH
Chris
- Show quoted text -


On Sun, May 11, 2008 at 11:24 PM, Arun Reddy <reddyac@gmail.com> wrote:
> Hey everyone,
>
> I was just curious if anyone had any more suggestions on this problem? I am
> still finding myself stuck with it. Thank you.
>
> On Thu, May 8, 2008 at 6:13 PM, Arun Reddy <reddyac@gmail.com> wrote:
>>
>> CC'd buildroot list
>>
>> On Thu, May 8, 2008 at 6:12 PM, Arun Reddy <reddyac@gmail.com> wrote:
>>>
>>> Thank you for your help. If anyone would like to chime in on how to
>>> define _syscall5 or just with dealing with this problem you would be helping
>>> a lot!
>>>
>>> On Thu, May 8, 2008 at 4:30 PM, hartleys <hartleys@visionengravers.com>
>>> wrote:
>>>>
>>>> Unfortunately no... Like I said I have not yet tried to build a
>>>> toolchain from source. Sorry
>>>> ________________________________
>>>> From: Arun Reddy [mailto:reddyac at gmail.com]
>>>> Sent: Thursday, May 08, 2008 4:24 PM
>>>> To: hartleys
>>>> Cc: Buildroot List
>>>> Subject: Re: [Buildroot] ARM build error with llseek.c
>>>>
>>>> Thanks for the information hartleys. Do you know how I can go about
>>>> defining _syscall5? Will I need to go into uClibc's menuconfig and select it
>>>> first?
>>>>
>>>> On Thu, May 8, 2008 at 4:11 PM, hartleys <hartleys@visionengravers.com>
>>>> wrote:
>>>>>
>>>>> This is just a guess but...
>>>>>
>>>>> I'm still using a prebuilt external toolchain and haven't tried
>>>>> building one from source yet so I'm not sure how to fix it. But, maybe this
>>>>> information to help.
>>>>>
>>>>> It appears you have a problem with your toolchain. That line in
>>>>> llseek.c should be invoving a uClibc macro (_syscall5) but it's not defined
>>>>> so the compiler is dying on the syntax of the "function" _syscall.
>>>>>
>>>>> Just my two cents...
>>>>>
>>>>> ________________________________
>>>>> From: buildroot-bounces at uclibc.org
>>>>> [mailto:buildroot-bounces at uclibc.org] On Behalf Of Arun Reddy
>>>>> Sent: Thursday, May 08, 2008 3:49 PM
>>>>> To: Buildroot List
>>>>> Subject: [Buildroot] ARM build error with llseek.c
>>>>>
>>>>> Hi everyone,
>>>>>
>>>>> I am continuing with my ARM build and I ran into a problem with
>>>>> llseek.c:
>>>>>
>>>>> http://img211.imageshack.us/img211/6387/e2fsprogsph4.jpg
>>>>>
>>>>> I found that this problem was reported before:
>>>>> http://bugs.busybox.net/view.php?id=1548
>>>>>
>>>>> and the solution seemed to involve enabling large file support in
>>>>> buildroot's configuration. I did this, but still get the same error. Does
>>>>> anyone know why LFS needs to be activated and in my case, why it doesn't
>>>>> resolve this issue? Any help on this problem would be appreciated. Thank
>>>>> you.
>>>>>
>>>>
>>>
>>
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>

On Sun, May 11, 2008 at 11:24 PM, Arun Reddy <reddyac@gmail.com> wrote:
> Hey everyone,
>
> I was just curious if anyone had any more suggestions on this problem? I am
> still finding myself stuck with it. Thank you.
>
> On Thu, May 8, 2008 at 6:13 PM, Arun Reddy <reddyac@gmail.com> wrote:
>>
>> CC'd buildroot list
>>
>> On Thu, May 8, 2008 at 6:12 PM, Arun Reddy <reddyac@gmail.com> wrote:
>>>
>>> Thank you for your help. If anyone would like to chime in on how to
>>> define _syscall5 or just with dealing with this problem you would be helping
>>> a lot!
>>>
>>> On Thu, May 8, 2008 at 4:30 PM, hartleys <hartleys@visionengravers.com>
>>> wrote:
>>>>
>>>> Unfortunately no... Like I said I have not yet tried to build a
>>>> toolchain from source. Sorry
>>>> ________________________________
>>>> From: Arun Reddy [mailto:reddyac at gmail.com]
>>>> Sent: Thursday, May 08, 2008 4:24 PM
>>>> To: hartleys
>>>> Cc: Buildroot List
>>>> Subject: Re: [Buildroot] ARM build error with llseek.c
>>>>
>>>> Thanks for the information hartleys. Do you know how I can go about
>>>> defining _syscall5? Will I need to go into uClibc's menuconfig and select it
>>>> first?
>>>>
>>>> On Thu, May 8, 2008 at 4:11 PM, hartleys <hartleys@visionengravers.com>
>>>> wrote:
>>>>>
>>>>> This is just a guess but...
>>>>>
>>>>> I'm still using a prebuilt external toolchain and haven't tried
>>>>> building one from source yet so I'm not sure how to fix it. But, maybe this
>>>>> information to help.
>>>>>
>>>>> It appears you have a problem with your toolchain. That line in
>>>>> llseek.c should be invoving a uClibc macro (_syscall5) but it's not defined
>>>>> so the compiler is dying on the syntax of the "function" _syscall.
>>>>>
>>>>> Just my two cents...
>>>>>
>>>>> ________________________________
>>>>> From: buildroot-bounces at uclibc.org
>>>>> [mailto:buildroot-bounces at uclibc.org] On Behalf Of Arun Reddy
>>>>> Sent: Thursday, May 08, 2008 3:49 PM
>>>>> To: Buildroot List
>>>>> Subject: [Buildroot] ARM build error with llseek.c
>>>>>
>>>>> Hi everyone,
>>>>>
>>>>> I am continuing with my ARM build and I ran into a problem with
>>>>> llseek.c:
>>>>>
>>>>> http://img211.imageshack.us/img211/6387/e2fsprogsph4.jpg
>>>>>
>>>>> I found that this problem was reported before:
>>>>> http://bugs.busybox.net/view.php?id=1548
>>>>>
>>>>> and the solution seemed to involve enabling large file support in
>>>>> buildroot's configuration. I did this, but still get the same error. Does
>>>>> anyone know why LFS needs to be activated and in my case, why it doesn't
>>>>> resolve this issue? Any help on this problem would be appreciated. Thank
>>>>> you.
>>>>>
>>>>
>>>
>>
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
