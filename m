From: Alexander Varnin <fenixk19@mail.ru>
Date: Thu, 21 Mar 2013 14:32:02 +0400
Subject: [Buildroot] segfault of test on buildroot system
In-Reply-To: <20130315110303.507c9f8a@skate>
References: <5141FFBD.6050206@mail.ru> <20130315110303.507c9f8a@skate>
Message-ID: <514AE1A2.8020407@mail.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

15.03.2013 14:03, Thomas Petazzoni ?????:
> Dear Alexander Varnin,
>
> On Thu, 14 Mar 2013 20:50:05 +0400, Alexander Varnin wrote:
>
>> I'm using buildroot based system with ARM samsung processor (s3c2443).
>> I've found a case, when i get segfault in my application. Using x86
>> debian compilers doesn't reproduce error.
>> Attaching test program to this letter. There is an exception getting
>> throw from constructor of child-class (DisplayPassDevice). At that time
>> parent destructor (~PassageDevice) getting called. When exiting from
>> parent destructor i got segfault.
>> # ./throw
>> ~PassageDevice
>> Aborted (core dumped)
>>
>> One more necessary condition. The bug appears only when i compile my
>> code with pthread:
>> ../minipos-OS-build/host/usr/bin/arm-linux-g++ throw.cpp -o throw -lpthread
>>
>> When i compile without -lpthread flag, program works OK.
>> # ./throw
>> ~PassageDevice
>> catched
>>
>> I don't know what does this problem belongs to, so i write there for
>> help. Probably you'll just point me, where to report it.
>> Software i use is following: gcc 4.5.4, uClibc 0.9.33.2, linux 3.6.
>> Just in case, i'll attach buildroot config
> I personally don't have much clue for the moment, so the only
> suggestion I can do is to rebuild your system with BR2_ENABLE_DEBUG,
> and then use gdbserver + cross-gdb to figure out where the segmentation
> fault happens (or getting a core file generated and use cross-gdb to
> inspect it).
>
> Best regards,
>
> Thomas

There seems to be stack corruption, so i can't see where fault happens.
