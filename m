From: Mark Jackson <mpfj-list@newflow.co.uk>
Date: Thu, 20 Dec 2018 13:27:42 +0000
Subject: [Buildroot] busybox build fail ...
 BUG_off_t_size_is_misdetected()
In-Reply-To: <877eg58g5o.fsf@tkos.co.il>
References: <306d14cd-bc37-0552-6e8d-cb583999d5b1@newflow.co.uk>
 <eeaa721d-51e5-9adc-51ff-cad1156387ab@newflow.co.uk>
 <877eg58g5o.fsf@tkos.co.il>
Message-ID: <abbd4a82-945c-a311-2953-b8fe6811a263@newflow.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/12/2018 19:34, Baruch Siach wrote:
> Hi Mark,
> 
> Mark Jackson writes:
>> On 19/12/2018 11:46, Mark Jackson wrote:
>>> I have an old buildroot setup that I'm trying to coax back into life using the later version.
>>>
>>> I've done:-
>>>
>>> $ git pull
>>> $ make clean
>>> $ make menuconfig (and fixed any deprecated options)
>>> $ make
>>>
>>> All seemed okay until the busybox build, where I got the message:-
>>>
>>>>   CC applets/applets.o
>>>> In file included from include/busybox.h:8:0,
>>>>   from applets/applets.c:9:
>>>> include/libbb.h:304:7: error: size of array ?BUG_off_t_size_is_misdetected? is negative
>>>>   char BUG_off_t_size_is_misdetected[sizeof(off_t) == sizeof(uoff_t) ? 1 : -1];
>>>>   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>> scripts/Makefile.build:197: recipe for target 'applets/applets.o' failed
>>>
>>> If I use the default busybox config, then everything seems to build correctly, so I can only put it down to some mis-match in my custom busybox config.
>>>
>>> I've attached my busybox .config ... if anyone can shed some light on what's wrong, I'd be most grateful.
>>
>> After some web searching [1], I have found that if I enable LFS, it all builds fine.
>>
>> So I assume there's some other applet that assumes LFS is enabled.
>> If so, should there be some dependency check to flag that as an issue ?
>>
>> And how do I build *without* LFS enabled ?
> 
> Buildroot removed support for non-LFS build in version 2015.05. See
> commit 7f96ef3580a ("toolchain/helpers: make LFS mandatory for uclibc
> toolchains").

Fair enough ... but shouldn't there be some sort of warning ?

Yes, I know it failed to compile (which is quite a decent warning !!), but
technically my config was invalid, and it would have been nice if I'd been
pointed at least in the right direction (or simply told outright) ?

Cheers
Mark JACKSON
