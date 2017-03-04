From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sat, 4 Mar 2017 15:38:13 +0100
Subject: [Buildroot] [PATCH] linux: Add CIP SLTS easy selection option
In-Reply-To: <20170304151228.3de59a5c@free-electrons.com>
References: <1488577816-19047-1-git-send-email-angelo.compagnucci@gmail.com>
 <20170303234636.0dbf4fd6@free-electrons.com>
 <7663394e-1ac6-07ae-a226-159605ac4011@mind.be>
 <20170304000243.35b8b146@free-electrons.com>
 <ecfd4a44-a1b8-19c9-f6c0-ba7998be2c85@mind.be>
 <20170304111105.03e2ffe2@free-electrons.com>
 <CA+TH9Vkxm4VdeBrTWAzWX6YGxrHT2-+OsMpGO0HaNeAHmQAYaw@mail.gmail.com>
 <f66ec9e0-6465-d2b8-eb02-5ada90dcbc75@mind.be>
 <CA+TH9VkMUTq7sFR9ED9aLgwUCbnnkXyO5uS7fwTyb5CynW2=bg@mail.gmail.com>
 <20170304151228.3de59a5c@free-electrons.com>
Message-ID: <CA+TH9Vmp+wu4hXw+P_8E=GNBTAM0MGD1n4Gp_VNGEz0dZrZHpg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

2017-03-04 15:12 GMT+01:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Hello,
>
> On Sat, 4 Mar 2017 15:08:06 +0100, Angelo Compagnucci wrote:
>> >  Note that the original patch did have a few issues:
>> > - It should use a tag/sha rather than a branch;
>>
>> Using a tag/sha will defeat the purpose of using this kernel. A
>> developer should ever use the latest release of this kernel each time
>> he compiles a buildroot image.
>
> Clearly *NOT*. We want Buildroot builds to be reproducible. So if you
> take a given Buildroot version and configuration, it should *always*
> provide exactly the same output. So we need to use fixed versions of
> all the components.

Obviously, I know. We could exclude the CIP kernel from the
reproducibility thing.

> Doing otherwise would be absolutely horrible. You do a build one day,
> it works. The next day, your colleague takes your Buildroot version and
> configuration, does a build, and the build fails? Or the build works,
> but it no longer boots/works on the target?

This should not happens, or if this happens, there's fault in the CIP
project. Btw the project doesn't involves only a Linux kernel but all
the necessary infrastructure to be sure that a new minor release
doesn't brake everything.

> So no, we clearly do not want this to use the "latest release each time
> a Buildroot image is compiled".

This is plain wrong with CIP. What an CIP user wants is to have the
latest patched version without thinking. It doesn't have any sense to
say to a developer "hey, we provide CIP but our setting is useless
cause it points to an older unpatched release. If you want to use it,
you should manually change to the latest release."

Yes, it's thinking in another way, like a super long term support
rolling release.

Sincerely, Angelo

>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
