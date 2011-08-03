From: Diego Iastrubni <diegoiast@gmail.com>
Date: Wed, 3 Aug 2011 15:37:20 +0300
Subject: [Buildroot] [PATCH 1/3] bump udev and clean up
In-Reply-To: <CALR4fEL2EY3sU74wXUUW=c3z5MOrYNHfMki-VEKgFCn_7yZGvg@mail.gmail.com>
References: <4E298D06.4050107@visionsystems.de>
 <4E298E70.50200@visionsystems.de>
 <871uxe10hq.fsf@macbook.be.48ers.dk> <4E2E67C8.7090208@visionsystems.de>
 <CALR4fEK2r2pL6X09pVUG970PUHxY+a52dvNdjjfVaoGLRnn3Mw@mail.gmail.com>
 <871uxcuqg0.fsf@macbook.be.48ers.dk>
 <CALR4fEKGFH5tq-25=j3DW-CVD5Uc-QxUeLoec-JLwSxNUhQw-w@mail.gmail.com>
 <87sjpst92p.fsf@macbook.be.48ers.dk>
 <CALR4fEKxDB+xH1_X+0xY9KWQXAz_g6zbrQHqzOB81J2jpOcnOg@mail.gmail.com>
 <CALR4fEL2EY3sU74wXUUW=c3z5MOrYNHfMki-VEKgFCn_7yZGvg@mail.gmail.com>
Message-ID: <CALR4fEJ7ymSGNW39VeaY5iWQ7zTCLMFm0eAApkFi4PyJaBpAhA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With the update of 173... lets bring this up again...

I am having problems in my setup: I see the /dev/ directory quite
empty. I found out that you removed the call to udevstart in S10udev,
calling it manually fixed the "emptiness problem" and /dev/ is filled
up as I expect.

Is the problem caused by my side (I am using tmpfs, and not udevfs,
and my kernel is *way* old). What is the equivalent of udevstart in
udev?


On Wed, Jul 27, 2011 at 3:53 PM, Diego Iastrubni <diegoiast@gmail.com> wrote:
> On Wed, Jul 27, 2011 at 1:19 PM, Diego Iastrubni <diegoiast@gmail.com> wrote:
>> You are probably right, qouting from
>> http://www.spinics.net/lists/hotplug/msg04998.html :
>>
>> It's generally not a good idea to build new low-level tools against
>> outdated kernels or run new low-level tools against them. Things can
>> easily go wrong. We usually only test the other way around: new
>> kernels on old userspace. That should work fine for quite a while.
>>
>> So, this patch demands:
>>
>> 1) newer toolchains
>> 2) kernel 2.6.33 and above.
>>
>> (2) is bad, since 2.6.32 is still maintained. For (1), I have a patch
>> in the works, I will test and report.
>
> See patch attached. Just put it inside packages/udev and rebuild.
> Works for me, and should not break other things, at least I hope.
>
