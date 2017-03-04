From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sat, 4 Mar 2017 12:31:00 +0100
Subject: [Buildroot] [PATCH] linux: Add CIP SLTS easy selection option
In-Reply-To: <20170304111105.03e2ffe2@free-electrons.com>
References: <1488577816-19047-1-git-send-email-angelo.compagnucci@gmail.com>
 <20170303234636.0dbf4fd6@free-electrons.com>
 <7663394e-1ac6-07ae-a226-159605ac4011@mind.be>
 <20170304000243.35b8b146@free-electrons.com>
 <ecfd4a44-a1b8-19c9-f6c0-ba7998be2c85@mind.be>
 <20170304111105.03e2ffe2@free-electrons.com>
Message-ID: <CA+TH9Vkxm4VdeBrTWAzWX6YGxrHT2-+OsMpGO0HaNeAHmQAYaw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni, Arnout Vandecappelle

2017-03-04 11:11 GMT+01:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Hello,
>
> On Sat, 4 Mar 2017 00:43:20 +0100, Arnout Vandecappelle wrote:
>
>> > I don't really see how that would be useful. What would it bring
>> > exactly?
>>
>>  Advertising that this repository exists and show how it can be used with
>> Buildroot. The latter part is of course trivial for us but still useful for
>> newcomers I think.
>
> But is this repository any more useful than hundreds of other vendor
> kernel trees? Why would this one have a defconfig, while it's not tied
> to handling a particular HW platform?

Probably there's some missing informations here ...

From the CIP website:

"Development will begin shortly on SLTS kernel version 4.4. Until the
announcement of the next version of the SLTS kernel, which the CIP
community anticipates will happen in two to three years, feature
backports from the upstream Linux kernel may be merged with the CIP
kernel. The CIP community plans to maintain 4.4 for security and bug
fixes for more than 10 years."

So, it's a vanilla kernel? Yes
It's security patched? Yes
It's a join effort project from the Linux Foundation and other big
players? Yes [1]
It's tied to a special development platform or board? No, it's a
vanilla kernel after all.

So in the end I think this kernel should have a mention in buildroot.

Buildroot users are usually corporations that want to build software
for their products.
If I were a corp right now, I will base my Linux product on an SLTS
kernel, because it assures me that I don't have to rewrite all my
kernel code for at least 10 years and the testing I do isn't trashed
every time a new kernel revision is out [2].

Ironically, we could base most of our configs (the ones that use a
vanilla kernel) on CIP SLTS kernel and never think again to kernel
bumps for another 10 years!

I think that we should support this vanilla super long term support
kernel for the benefits of our users. Choosing the right kernel for a
product is a tough decision and knowing that there is a kernel I can
trust for 10 years is surely something to not underestimate.

Sincerely, Angelo


[1] https://www.linuxfoundation.org/news-media/announcements/2016/04/linux-foundation-launches-first-linux-based-civil-infrastructure
[2] https://wiki.linuxfoundation.org/civilinfrastructureplatform/cipkernelmaintenance
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
