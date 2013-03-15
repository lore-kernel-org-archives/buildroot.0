From: Gilles Talis <gilles.talis@gmail.com>
Date: Fri, 15 Mar 2013 13:02:25 -0700
Subject: [Buildroot] [PATCH] iozone: new package
In-Reply-To: <20130315111130.27f6aeeb@skate>
References: <1363195917-13185-1-git-send-email-gilles.talis@gmail.com>
 <20130315111130.27f6aeeb@skate>
Message-ID: <CAKcgs2zYDEvWAviZGTcXneoMLmgyJitgm8Ovcdyvh0ZHTC_6ug@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

>> +IOZONE_VERSION = $(IOZONE_MAJOR_VERSION)_$(IOZONE_MINOR_VERSION)
>
> Any reason to split major and minor versions here? I only see
> IOZONE_VERSION used below.
No reason. I just felt it looked neater. But you're right, I'll just
use IOZONE_VERSION.


>> +else ifeq ($(BR2_x86_64),y)
>> +IOZONE_TARGET = linux-ia64
>
> This seems wrong IA64 is the Itanium architecture from Intel, and not
> the x86-64 architecture.
Alright. I think I have to do some homework here.


>> +else ifeq ($(BR2_powerpc),y)
>> +IOZONE_TARGET = linux-powerpc
>> +else ifeq ($(BR2_sparc),y)
>> +IOZONE_TARGET = linux-sparc
>> +else
>> +IOZONE_TARGET = linux
>> +endif
>
> What happens for other architectures? Does it still build? What
> are the differences between those per-architecture make targets?
Funnily enough, the only other targets I tested were i386 and PPC64
and it could build (target = linux)
Now, it fails to build for AVR32 and MIPS, as it can't find the async
IO header file from uClibc.
IOzone can be built without aio though, using a "generic" target. Will
see how to add this one in.

Also to answer your other question, the differences lie around file
operations flags and functions (e.g usage of O_DIRECT or pread()).

Thanks
Gilles.
