From: Will Newton <will.newton@gmail.com>
Date: Mon, 10 Nov 2014 10:33:07 +0000
Subject: [Buildroot] [PATCH] toolchain-external: update Linaro toolchains
In-Reply-To: <20141110112004.03adebb6@free-electrons.com>
References: <1415613991-19261-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAFbHwiSrjXBpYrVW+O3NqtZ+aToNaS=UQbeb_Do2n6ym0_6Sjg@mail.gmail.com>
 <20141110112004.03adebb6@free-electrons.com>
Message-ID: <CAFbHwiS=0WMnwT91gG5nFcY3qgugCZ0mqp6u+V70E0=O194R_A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Nov 10, 2014 at 10:20 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Will Newton,
>
> On Mon, 10 Nov 2014 10:12:40 +0000, Will Newton wrote:
>
>> > Bump the ARM, ARMeb and AArch64 Linaro toolchains from 14.08 to
>> > 14.09. We can't bump to 14.10, because they completely changed the
>> > toolchains and they are now completely broken: they switched from
>> > Crosstool-NG to a new build tool to generate the toolchain, and now
>> > the sysroot handling is completely borked.
>>
>> Do you have more details on this? If the new tool is causing problems
>> for people then we need to address those.
>
> Yes, I first complained on my G+ (I know, it's silly):
> https://plus.google.com/101327154101389327284/posts/SjFkrX3ow5M. And
> I'm going to fill a bug to the Linaro bug tracker, I just created an
> account today.

Thanks, a bug would be really useful for tracking purposes.

> Basically, the sysroot handling is not done correctly, so the toolchain
> is not relocatable: -print-sysroot and -print-file-name=libc.a return
> invalid values.
>
> Just have a look at the INSTALL-sysroot.sh script inside the toolchain,
> it gives you an idea on how bad the toolchain is.

I'll make sure it gets looked at...
