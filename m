From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 13 Oct 2014 14:06:09 +0200
Subject: [Buildroot] [PATCH] gst1-plugins-imx: add package
In-Reply-To: <543B52A0.6060007@gmail.com>
References: <1412545628-12153-1-git-send-email-bisson.gary@gmail.com>
 <543A9384.8050803@lucaceresoli.net> <543B52A0.6060007@gmail.com>
Message-ID: <543BC031.60606@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gary,

Gary Bisson wrote:
> Hi Luca,
>
> Thanks for your feedback, below are my comments.
> Sorry Peter I didn't see your patch from March.
>
> On 10/12/2014 07:43 AM, Luca Ceresoli wrote:
>> Dear Gary, Peter,
> [...]
>> It would be better to have only one comment showing all the dependencies
>> at once to avoid cluttering the menuconfig screen when the dependencies
>> are not met. Also, please format it according to the guidelines in
>> http://nightly.buildroot.org/manual.html#dependencies-target-toolchain-options
>>
> Ok I can rework those comments.
>>
>> BTW, the last warning should be shown regardless of the value of
>> BR2_PACKAGE_LIBFSLVPUWRAP, nope?
> The goal here was to show only one comment at a time. Both comments will
> be merged in one.
>> [...]
>> According to Gary, (e)glibc is needed. Peter, did you build-test with
>> uClibc (or musl)?
> Actually this dependency is not required as it is implicit, the real
> eglibc dependency comes from the GPU_VIV package.

I see. A brief comment would be helpful, as it is for all inherited
dependencies. Example:

# Required by gpu-viv-bin-mx6q
comment "gst1-plugins-imx needs an (e)glibc toolchain"
     depends on BR2_arm
     depends on !BR2_TOOLCHAIN_USES_GLIBC

>>
>> How about imx-lib, libfslparser and libfslcodec?
> No, Peter's dependencies seem to have some legacy from the old gstreamer
> plugin, see package/gstreamer/gst-fsl-plugins/Config.in. Moreover it is
> missing the GPU_VIV package dependency required to have the imxg2d and
> imxegl plugins and also narrows this plugin to iMX6 platforms only.
>>
>> It would be great if you could have a list that really matches the
>> package. It's probably going to be a mix of the two, but I don't know
>> exactly which pieces should be picked.
> The best is to compare the dependencies from the Yocto recipe:
> https://github.com/Freescale/meta-fsl-arm/blob/master/recipes-multimedia/gstreamer/gstreamer1.0-plugins-imx_0.9.9.bb

Ok.

>
> This is what I've based my package on.
>> [...]
>> Can you merge the two statements?
> I can add the Kernel header comment but regarding the VPU I've offered a
> patch for the firmware to be selected when imx-vpu package is enabled:
> http://lists.busybox.net/pipermail/buildroot/2014-October/107894.html

Ouch, I almost forgot that patch. I just added my Reviewed-by:.

>> [...]
>> Use the github helper macro:
>> http://nightly.buildroot.org/manual.html#github-download-url
> Ok.
>> [...]
>> Peter's version does not depend on host-python, yours does.
>>
>> Actually that dependency is needed becase waf does not work with
>> recent python3 interpreters. That's why all Buildroot packages that use
>> waf (jack2, midori, samba4) depend on it.
> Yes host-python is required.
>> [...]
>> ...and you support X11 and Wayland, which is good.
>>
>> Overall your patch looks better, except Peter lists more mandatory
>> dependencies (perhaps some or all are actually neede), has a more
>> informative package description and uses the github helper. Merging
>> the two patches to get the best of each would be good, and it would be
>> great if you could cooperate to do that!
>>
>> I'm afraid I haven't much experience on i.MX to help, but I'll be glad
>> to test your work (but please keep me in Cc:).
>>
> No problem I'll keep you in cc. But what is the plan now? Should I offer
> a v2 or let Peter integrate the remarks above in his patch?

Well, you can send your own patch, or if Peter wants to cooperate then
he may be helpful. But he's not been active in the latest months, so
unless he gets in touch I'd go on anyway if I were you.

-- 
Luca
