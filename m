From: Kunal Chauhan <atkunalchauhan@gmail.com>
Date: Sat, 9 May 2020 23:44:25 +0530
Subject: [Buildroot] Help: to understand build root
In-Reply-To: <d1e5de0ccecc4ca2020f5efbe473cb2d@umbiko.net>
References: <mailman.3803.1589018066.59095.buildroot@busybox.net>
 <d1e5de0ccecc4ca2020f5efbe473cb2d@umbiko.net>
Message-ID: <CACEFAc1yzctCtQ5ErMS_NR1R3TAMDU+8JddbisTLKakTeLGURg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi team,

Please need some clarity on some points

1.  If as a developer can i compile a single binary and test it without
running or compiling whole firware image.?

2. How firmware image extracts all binaries to system or to target harware?

Thanks
Kunal


On 9 May 2020 9:02 p.m., "Andreas Ziegler" <br015@umbiko.net> wrote:

> Hi Kunal,
>
> Message: 1
>> Date: Wed, 6 May 2020 12:24:57 +0530
>> From: Kunal Chauhan <atkunalchauhan@gmail.com>
>> To: buildroot at busybox.net
>> Subject: Re: [Buildroot] Help: to understand build root (Andreas
>>         Ziegler)
>>
>
> 1.Team just gone through the url given but still I am confused what is the
>> main purpose of making build_root directory, when we can compile our
>> source
>> in different way.
>> 2. May be I am not understanding the concept as I am  new to
>> firmware concept. but question is also how the code is built and test as a
>> developer
>>
>
> As an embedded developer you would normally be seriously limited by the
> production hardware (where the finished product is supposed to run): not
> enough memory, no persistent storage, and just a serial console for talking
> to the machine. This is why people use different hardware for development
> and test/production.
>
> On your development machine you would write code, do development tests, if
> necessary by using mock-ups for missing physical interfaces, and check in
> after you are satisfied.
>
> The integration step pulls the software from the repository, packages it
> with other necessary binaries and generates a firmware image. This is where
> Buildroot comes into the picture. Buildroot is not a development
> environment, but an integration tool.
>
> After deploying your image for integration testing on the target hardware,
> your options for debugging are limited. You could use, for example,
> instrumentation of the code or gdb (supports remote debugging) for this
> purpose.
>
> It might make things easier if you told us something of your intended use
> case.
>
> Kind regards,
> Andreas
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200509/51a25355/attachment.html>
