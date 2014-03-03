From: Lionel Orry <lionel.orry@gmail.com>
Date: Mon, 3 Mar 2014 09:14:44 +0100
Subject: [Buildroot] [PATCH 1/1] zeromq: bump to version 4.0.1
In-Reply-To: <20140303084702.7790637d@skate>
References: <1381509097-5424-1-git-send-email-jerzy.grzegorek@trzebnica.net>
 <20140301232520.4ee4b22b@skate>
 <CAKAx1cj3DKFEcSjtw2-d1y3sZSO9y6kpvE6ZGjRdycnNAAugMw@mail.gmail.com>
 <20140303084702.7790637d@skate>
Message-ID: <CAKAx1chY=kd3Y_N2-HRqmtELox8gSA9+hVUmaEAT4BNv_mXb9g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

On Mon, Mar 3, 2014 at 8:47 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Lionel Orry,
>
> On Mon, 3 Mar 2014 07:51:45 +0100, Lionel Orry wrote:
>
>> > I tried to apply this patch, but unfortunately, it apparently breaks
>> > the build of mongrel2:
>> >
>> > src/superpoll.c: In function 'SuperPoll_poll':
>> > src/superpoll.c:229:53: error: 'ZMQ_POLL_MSEC' undeclared (first use in this function)
>> > src/superpoll.c:229:53: note: each undeclared identifier is reported only once for each function it appears in
>> >
>> > I've checked the other reverse dependencies of zeromq, and they seem to
>> > build fine.
>> >
>> > Can you find a solution to the mongrel2 problem, and resubmit the
>> > appropriate patch?
>>
>> Such a patch would fix compilation, but the fact is this version of
>
> What do you mean by "such a patch" ? Maybe you forgot to attach a patch
> to your e-mail?

um no, I meant the "appropriate patch" you were suggesting Jerzy to
prepare so that mongrel2 compiles. If I understood correctly.

>
>> Mongrel2 was not tested with ZeroMQ v4 and greater
>> and I don't know if we can simply bump its version like that. Maybe we
>> can but I am not 100% sure.
>>
>> On another hand, mongrel2 development is becoming active again and
>> they are trying to prepare a release, so I will try to check there if
>> they ensure zeromq4 compliance and tested it. I will get back to you
>> when I can on this subject.
>
> Ok, thanks!
>
> Does ZeroMQ v4 changes the API/behavior a lot compared to v3 ?

The v2 -> v3 transistion has been a nightmare more many devs, but they
learnt from it and it seems the v3->v4 is much smoother.

By the way, I noticed the mongrel2 devs tagged a v1.9.0 a month ago,
and this release includes a zeromq4 compliance, plus other fixes and
enhancements. May I suggest we simply bump the mongrel2 version ?

>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com

BR,
Lionel
