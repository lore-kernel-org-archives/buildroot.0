From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 4 Aug 2016 19:09:44 -0700
Subject: [Buildroot] Raspberry Pi OpenGL/Qt5 10x slower than Raspbian
In-Reply-To: <CA+-urNT9xyebymaefVZXbp_A7zDCuEqokimwy9t1yPLjNdHrqA@mail.gmail.com>
References: <CA+-urNTrCwfx4YYZ0S37wyB9ehquKLqacKaOzL6_7yCkt+Q29g@mail.gmail.com>
 <20160804091707.6755bb66@free-electrons.com>
 <CA+-urNQqnUdBvsMERgNxnAKWSGpiUNekvuSZADvyw7_HpYO41A@mail.gmail.com>
 <20160804182825.4c9ff4ff@free-electrons.com>
 <CA+-urNT9xyebymaefVZXbp_A7zDCuEqokimwy9t1yPLjNdHrqA@mail.gmail.com>
Message-ID: <6fc2fbb9-e4ff-6aeb-692d-5893d2f9ec9f@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 8/4/16 10:09 AM, Frank Hunleth wrote:
> Hi Thomas,
> 
> On Thu, Aug 4, 2016 at 12:28 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Hello,
>>
>> On Thu, 4 Aug 2016 08:35:24 -0400, Frank Hunleth wrote:
>>
>>>> Change -Os by -O2 in the Buildroot configuration, by using
>>>> BR2_OPTIMIZE_2. I even believe we should stop using BR2_OPTIMIZE_S by
>>>> default, and switch to BR2_OPTIMIZE_2 instead.
>>>
>>> Done, but no luck for this particular issue. I have another piece of
>>> code that differs in performance from Debian by 5% and is more CPU
>>> bound. I'll try it on that too.
>>
>> Gaah.
>>
>>>> Also, are you sure it's really using OpenGL with the Buildroot build?
>>>
>>> On the Buildroot build, I've tried running the Qt application with
>>> "-platform eglfs", but that seemed to be the default already. I'm not
>>> sure how to check deeper than that.
>>
>> I guess if eglfs support has been built and you're able to use, it
>> means that it's using the GPU.
>>
>>>> Under Raspbian, are you also running the eglfs build of Qt, or is it
>>>> with X.org? I'm not sure Debian has an eglfs capable build of Qt5.
>>>
>>> You're right. On Raspbian, I'm running with X.org. I am naively
>>> assuming that Qt5 w/ eglfs isn't 10x slower than Qt5 w/ X.org. I
>>> really hope that's not the case.
>>
>> I also hope, but using X.org on one side and doing eglfs on the other
>> side is really a very different configuration. I would also assume that
>> there should not be a 10x difference between Qt5/X.org vs Qt5/eglfs,
>> but I have never tested, so I don't know.
> 
> I started a Qt5/eglfs-only build on a Raspberry Pi early this morning.
> I have no clue how long it will take to build, but I'll report back
> when it's done.
> 
>> Which toolchain are you using ? Are you building everything optimized
>> for ARMv6 (assuming you're using Rpi1) ?
> 
> When I first noticed the issue, I was using an ARMv6-optimized
> toolchain built by crosstool-ng. Now I'm using the default one built
> by Buildroot when using the raspberrypi_defconfig.
> 
>> But a 10x difference really feels like acceleration is not used at all.
> 
> I agree.
> 
>> You can also check the CPU consumption while running your Qt app to see
>> what it looks like.
> 
> Will do. I think that the native Raspbian Qt5/eglfs-only build will be
> telling. With any luck the build will complete successfully this
> evening.

Seems like H/W acceleration is missing. I wonder if userland libraries
are compiled correctly.

> 
> Thanks,
> Frank
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
