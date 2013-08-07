From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 7 Aug 2013 09:05:30 +0200
Subject: [Buildroot] AVR32 toolchain build failure
In-Reply-To: <CAAXf6LU0oihr6qLh4KA=+fKYWEbk-iOpwvsmo7AWPSjyC7_=KA@mail.gmail.com>
References: <CAAXf6LUhgOkHgj=cRWnkR8tPhAAjT6BhXFvXTBvC5pHfTZ=vww@mail.gmail.com>
 <20130806195402.2f3f94e7@skate>
 <CAAXf6LU0oihr6qLh4KA=+fKYWEbk-iOpwvsmo7AWPSjyC7_=KA@mail.gmail.com>
Message-ID: <CAAXf6LWF=7-cP_=mTRjNK1qki-gxKx+BoR1C_1Bw9QGUUtstmA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tue, Aug 6, 2013 at 9:33 PM, Thomas De Schampheleire
<patrickdepinguin+buildroot@gmail.com> wrote:
> Hi Thomas,
>
> On Tue, Aug 6, 2013 at 7:54 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Dear Thomas De Schampheleire,
>>
>> On Mon, 5 Aug 2013 14:01:51 +0200, Thomas De Schampheleire wrote:
>>
>>> I was looking at an autobuild failure on AVR32 and tried reproducing
>>> it locally. Unfortunately, the AVR32 toolchain that was configured was
>>> pre-built on a 64-bit machine, which I don't have. Hence, the
>>> configured toolchain was not usable.
>>>
>>> Then I tried building my own AVR32 toolchain with the internal
>>> backend, see config attached. Unfortunately, this failed as well:
>>
>> I just tested here on my Ubuntu 13.04 64 bits machine, with the latest
>> Buildroot Git, and the atngw100_defconfig (AVR32) could build a
>> toolchain properly. This toolchain however seems to have a problem as
>> it is not able to link the kernel. This specific regression was, I
>> think, introduced by my patches converting the internal backend to
>> proper packages. I'll try to investigate this one.
>
> I verified the atngw100_defconfig, and the toolchain also builds fine here.
> Comparing the configuration with my failing setup, I see that I had
> enabled C++ support, wchar, largefile and ipv6. Presumably, it's the
> C++ support that is the problem.
>
> I'll verify by enabling just that without wchar, largefile and ipv6.

I can now confirm that the atngw100_defconfig works unchanged, but
when I enable C++ support in the toolchain, host-gcc-final fails with
the aforementioned error about truncated relocations.

I'm not sure how to proceed from here...

Best regards,
Thomas
