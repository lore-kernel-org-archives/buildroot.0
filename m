From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Date: Wed, 06 Aug 2014 09:23:58 +0100
Subject: [Buildroot] [PATCH] gdb: don't block building on AArch64 systems
In-Reply-To: <CAFbHwiRnPZhnXVwZbZreJS-DsO2c8xe1S8=72yH0R7y_bHdFug@mail.gmail.com>
References: <1407244453-3082-1-git-send-email-alex.bennee@linaro.org>
 <20140805162059.26366e25@free-electrons.com>
 <CAFbHwiRnPZhnXVwZbZreJS-DsO2c8xe1S8=72yH0R7y_bHdFug@mail.gmail.com>
Message-ID: <87wqamja43.fsf@linaro.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Will Newton writes:

> On Tue, Aug 5, 2014 at 3:20 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Dear Alex Benn?e,
>>
>> On Tue,  5 Aug 2014 14:14:13 +0100, Alex Benn?e wrote:
>>> There is no real reason to disable the building of GDB. I suspect the
>>> original patch (be084204) which added the restriction did so not
>>> realising that AArch64 has had thread support in it's toolchain for some
>>> time.
>>
>> be084204 did not add the AArch64 exception: it only made sure the
>> comments about threads being needed would not be shown on AArch64,
>> because gdb is never available on AArch64.
>>
>> The real commit who made gdb unavailable on AArch64 is
>> 0e49733b306b353aad3a29a2c7a6faf25841ef0b. I believe at the time (April
>> 2013), AArch64 was maybe not supported in the mainline gdb.

My mistake, I got lost in the maze of GDB Config.in changes.

>>
>> Therefore, could you check when AArch64 support was added in mainline
>> gdb ? We currently allow selecting either gdb 7.6 and 7.7 in Buildroot.
>
> AArch64 has been supported since gdb 7.6 (although 7.8 is much nicer
> to use due to bug fixes).

I'll resubmit with a re-worded commit message.

-- 
Alex Benn?e
