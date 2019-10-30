From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 30 Oct 2019 21:53:45 +0100
Subject: [Buildroot] [PATCH 1/1] package/rng-tools: needs NPTL
In-Reply-To: <CANQCQpYrDEpf3b7xdYNMtrD0=NdUdp-D0oGptTe8SYXTp7xTDQ@mail.gmail.com>
References: <20191030055850.6069-1-bernd.kuhls@t-online.de>
 <CANQCQpZdUkkUSfd3RKkBDMG57=3mRt1hBU=w++gzK8PcQRpChw@mail.gmail.com>
 <CANQCQpYrDEpf3b7xdYNMtrD0=NdUdp-D0oGptTe8SYXTp7xTDQ@mail.gmail.com>
Message-ID: <0286f372-1322-3141-9afe-5c83a0b2766e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 30/10/2019 10:44, Matthew Weber wrote:
> Bernd,
> 
> On Wed, Oct 30, 2019 at 4:38 AM Matthew Weber
> <matthew.weber@rockwellcollins.com> wrote:
>>
>> Bernd,
>>
>>
>> On Wed, Oct 30, 2019 at 12:58 AM Bernd Kuhls <bernd.kuhls@t-online.de> wrote:
>>>
>>> Fixes:
>>> http://autobuild.buildroot.net/results/e18/e1815b96997fb7def688e0aeb5d342fc64dbb64d/
>>>
>>> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
>>
>> $  ./utils/check-package package/rng-tools/*
>> 99 lines processed
>> 0 warnings generated
>>
>> Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>
> 
> Looks like the next thread related build failure will be musl related.
> 
> ./utils/test-pkg -p rng-tools -d testbuild
>                              br-arm-full [1/6]: OK
>                   br-arm-cortex-a9-glibc [2/6]: OK
>                    br-arm-cortex-m4-full [3/6]: SKIPPED
>                           br-x86-64-musl [4/6]: FAILED
>                       br-arm-full-static [5/6]: OK
>                             sourcery-arm [6/6]: OK
> 
> 
> rngd_jitter.c:(.text+0x7da): undefined reference to `pthread_yield'

 man pthread_yield:

This call is nonstandard, but present on several other systems.  Use the
standardized sched_yield(2) instead.

 Should be simple enough to patch.

 Regards,
 Arnout

> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
