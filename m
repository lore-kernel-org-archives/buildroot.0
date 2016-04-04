From: Alistair Francis <alistair.francis@xilinx.com>
Date: Mon, 4 Apr 2016 16:45:54 -0700
Subject: [Buildroot] [PATCH V2] Add Xen 4.6
In-Reply-To: <56FB80AA.1050407@mind.be>
References: <1457483717-17947-1-git-send-email-alistair.francis@xilinx.com>
 <56F7D7FA.40001@mind.be>
 <CAKmqyKOCUKKQJRg6jK5TdJ33XbyATjsWrj41Gdy2zU7FwHz7mg@mail.gmail.com>
 <56FAD6B4.5000706@mind.be>
 <74004942B5DA03468B2B76399A14BF2E7DB1003D@XSJ-PSEXMBX01.xlnx.xilinx.com>
 <56FB80AA.1050407@mind.be>
Message-ID: <CAKmqyKOSaGayGxLy4dWQOMyD+Z6PRgStVD-TjLB63RZ4q4ih3Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Mar 30, 2016 at 12:30 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
> On 03/30/16 01:37, Alistair Francis wrote:
>>>
>>> -----Original Message-----
>>> From: Arnout Vandecappelle [mailto:arnout at mind.be]
>>> Sent: Tuesday, 29 March 2016 12:26 PM
>>> To: Alistair Francis <alistai@xilinx.com>
>>> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>;
>>> buildroot at buildroot.org; maxime.ripard at free-electrons.com
>>> Subject: Re: [PATCH V2] Add Xen 4.6
>>>
>>> On 03/28/16 20:59, Alistair Francis wrote:
>>>>
>>>> On Sun, Mar 27, 2016 at 5:54 AM, Arnout Vandecappelle<arnout@mind.be>
>>>
>>> wrote:
>>> [snip]
>>>>>>
>>>>>>   For some reason, it doesn't seem to be cross-compiling for me, it
>>>>>> uses
>>>>>> "gcc" to build. I think you need to pass TARGET_CONFIGURE_OPTS in
>>>>>> XEN_MAKE_ENV.
>>>>
>>>> I see the same problem. I tried using TARGET_CONFIGURE_OPTS in
>>>> XEN_MAKE_ENV but it still uses GCC.
>>>>
>>>> The configure scripts detects an AArch64 target correctly, but it
>>>> still uses GCC. Any other ideas?
>>>
>>>
>>>    Try passing CROSS_COMPILE in XEN_MAKE_ENV.
>>>
>>>    You may also need to set XEN_TARGET_ARCH, AFAICS it is not derived
>>> automatically.
>>
>>
>> Sorry for the poorly formatted reply, I am sending this from my work
>> email.
>>
>> I managed to get it to use aarch64-buildroot-linux-gnu-gcc using the
>> CROSS_COMPILE=$(TARGET_CROSS) option , but now I see a lot of
>> errors as apparently that version of GCC doesn't understand a lot of the
>> command line options.
>>
>> Any idea why that would be? The GCC version is 4.9.3 which should be new
>> enough.
>
>
>  Can you put the build log in a pastebin and post it on the list? It's
> difficult to say anything just like this...
>
>  Did you also pass XEN_TARGET_ARCH?

I managed to get it to work for AArch64, but now it's failing for
ARMv7. I haven't tried the x86 architectures yet.

Here is the error log: http://pastebin.com/znTSCu6s

Here is the Xen.mk I'm using: http://pastebin.com/G33WH3Z9

Thanks,

Alistair

>
>  Regards,
>  Arnout
>
> --
> Arnout Vandecappelle      arnout dot vandecappelle at essensium dot com
> Senior Embedded Software Architect . . . . . . +32-478-010353 (mobile)
> Essensium, Mind division . . . . . . . . . . . . . . http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium . . . . . BE 872 984 063 RPR Leuven
>
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
>
