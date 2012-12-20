From: Steve Calfee <stevecalfee@gmail.com>
Date: Wed, 19 Dec 2012 16:26:29 -0800
Subject: [Buildroot] Any way to override .config settings?
In-Reply-To: <50D259DC.7090509@mind.be>
References: <CAE21AQpSdqfXmX1Kv97LHQP_kqEqC9FH+rwU70ZZAPS-Xt4_DA@mail.gmail.com>
 <50D255F0.8030107@mind.be>
 <CAE21AQrTh=bTke7awGUDfp+SfJJx5K1L6HVVhMs5F4eXAaZaTA@mail.gmail.com>
 <50D259DC.7090509@mind.be>
Message-ID: <CAJJ6jxuyeGH0iGkZ-UgaufGMKkuK8Ena80KjMfyLkzjou9t99w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Dec 19, 2012 at 4:20 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 20/12/12 01:13, Charles Manning wrote:

>
>>>> 1) Is there a built in mechanism in buildroot to include extra symbols
>>>> and override those in .config?
>>>
>>>
>>>
>>>   Yes, the package override file: BR2_PACKAGE_OVERRIDE_FILE, defaults to
>>> $(TOPDIR)/local.mk. I use this to include a bunch of project-specific .mk
>>> files that add packages without requiring a Config.in.
>>
>>
>> In a separate thread to this, I submitted a patch that follows the
>> package overriding idea to override the config
>
>
>  Since it does exactly the same as BR2_PACKAGE_OVERRIDE_FILE, I don't see
> the point... Unless you want to start overriding toolchain configs.
>
>  Actually, I don't see much point to override the .config - why not just
> save a different .config?
>

I agree. From a maintenance point of view, having one file (.config or
defconfig) that describes how something is built is much nicer than
having a .config and various makefiles that hack at it.

Also, the buildroot make system is a mechanism that can easily be
extended by an external script or makefile. We should resist the
temptation to complicate the buildroot system just to fit a subset of
people's strange build desires. Keeping it simple and clean and
limiting the number of targets is good.

Regards, Steve
