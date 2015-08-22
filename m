From: Brendan Heading <brendanheading@gmail.com>
Date: Sat, 22 Aug 2015 23:35:00 +0100
Subject: [Buildroot] [PATCH] package/canfestival: fix build with musl
In-Reply-To: <20150822222544.GB3861@free.fr>
References: <1440279318-19132-1-git-send-email-yann.morin.1998@free.fr>
 <20150822213815.GA3861@free.fr>
 <CA+BsyQ5AaMkDCb7Ldnu5u9ZArNe0swiAhKwxsRgES6RdrxTVoQ@mail.gmail.com>
 <20150822222544.GB3861@free.fr>
Message-ID: <CA+BsyQ53-OSsdm=DONB9AX_K+y0a8AKnzf1SrRV7ykZVUagjkw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>> I was going to take this up with the developers as I can't see a good
>> reason why the behaviour is different for uclibc and non-uclibc
>> environments, and in any case CLOCK_REALTIME is almost certainly not
>> what they want. But I haven't had a spare moment to write a test case
>> to prove that the timer code used in the non-uclibc version would work
>> just as well under uclibc.
>
> That sounds really weird, indeed... :-(

It feels like they ran into some kind of issue with uclibc and hacked
together a fix.

And IME naive coders often make the mistake of using the wrong CLOCK_*
parameters when doing POSIX time related things ..

> OK, I'll try to revisit this later. Thanks for the heads up.

I thought about submitting a patch with another #ifdef __UCLIBC__
around the function declaration - not ideal, but it at least matches
what the upstream were trying to do. But I wasn't sure if such an
approach would pass muster here ?

Brendan
