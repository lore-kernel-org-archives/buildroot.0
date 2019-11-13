From: Romain Naour <romain.naour@smile.fr>
Date: Wed, 13 Nov 2019 12:10:34 +0100
Subject: [Buildroot] [PATCH] package/x11r7/xserver_xorg-server: Fix ARM
 build
In-Reply-To: <77353588-bf06-8112-4afe-41f488dbaa66@codethink.co.uk>
References: <20191111124807.1151582-1-thomas.preston@codethink.co.uk>
 <20191111153657.1a56760e@windsurf.home>
 <c7a19ef5-03ee-64c5-bf1b-e84d220561ef@codethink.co.uk>
 <08d749aa-743d-d05c-7aae-b98e70862617@codethink.co.uk>
 <20191112212446.21cbdbca@windsurf>
 <77353588-bf06-8112-4afe-41f488dbaa66@codethink.co.uk>
Message-ID: <1debcd70-de93-f709-a313-f358572c3048@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas?, All,

Le 13/11/2019 ? 11:39, Thomas Preston a ?crit?:
> On 12/11/2019 20:24, Thomas Petazzoni wrote:
>> Hello Thomas,
>>
>> On Mon, 11 Nov 2019 17:12:13 +0000
>> Thomas Preston <thomas.preston@codethink.co.uk> wrote:
>>
>>> I don't think there are any defconfigs (except with my changes) which
>>> meet these conditions:
>>>
>>> 	$ git grep -l BR2_arm=y configs | xargs grep -l GLIBC | xargs grep XORG_SERVER
>>> 	configs/raspberrypi3_defconfig:BR2_PACKAGE_XSERVER_XORG_SERVER=y
>>>
>>> So this condition is never reproduced in the autobuilder.
>>
>> The autobuilders are completely unrelated to the defconfigs.
>>
>> We have two completely distinct CI mechanisms:
>>
>>  (1) Gitlab CI. This one does the kind of traditional CI that most
>>      projects have. In the case of Buildroot, it does build the defconfigs
>>      and runs the runtime tests on a regular basis.
>>
>>  (2) Autobuilders. These generate random configurations, and build
>>      those random configurations. We have a number of machines (about
>>      5-6 machines) that do this 24/7 and report the results at
>>      http://autobuild.buildroot.org. This gives a much wider testing
>>      coverage than building defconfigs, as our defconfigs are almost all
>>      minimal.
>>
>> So, when I say "autobuilders", I'm referring to (2) above. And I don't
>> get why this sys/io.h doesn't occur in the autobuilders.
> 
> Got it, thanks. Is it possible to search the autobuilder configurations for
> the above case? Maybe it never came up. Or maybe it *has* been tested, just
> before this bug was introduced.

@Thomas Petazzoni: Maybe we need to rebuild the arm bleeding edge toolchain used
by the autobuilders using the current glibc version (2.30).

The current prebuilt toolchain are from 06/2019 but glibc 2.30 has been released
08/2019.

There is only one internal toolchain for arm and it use uclibc-ng by default.

Maybe we can add a new internal toolchain for glibc and musl ?

Best regards,
Romain


> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
