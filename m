From: Thomas Preston <thomas.preston@codethink.co.uk>
Date: Wed, 13 Nov 2019 10:39:38 +0000
Subject: [Buildroot] [PATCH] package/x11r7/xserver_xorg-server: Fix ARM
 build
In-Reply-To: <20191112212446.21cbdbca@windsurf>
References: <20191111124807.1151582-1-thomas.preston@codethink.co.uk>
 <20191111153657.1a56760e@windsurf.home>
 <c7a19ef5-03ee-64c5-bf1b-e84d220561ef@codethink.co.uk>
 <08d749aa-743d-d05c-7aae-b98e70862617@codethink.co.uk>
 <20191112212446.21cbdbca@windsurf>
Message-ID: <77353588-bf06-8112-4afe-41f488dbaa66@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/11/2019 20:24, Thomas Petazzoni wrote:
> Hello Thomas,
> 
> On Mon, 11 Nov 2019 17:12:13 +0000
> Thomas Preston <thomas.preston@codethink.co.uk> wrote:
> 
>> I don't think there are any defconfigs (except with my changes) which
>> meet these conditions:
>>
>> 	$ git grep -l BR2_arm=y configs | xargs grep -l GLIBC | xargs grep XORG_SERVER
>> 	configs/raspberrypi3_defconfig:BR2_PACKAGE_XSERVER_XORG_SERVER=y
>>
>> So this condition is never reproduced in the autobuilder.
> 
> The autobuilders are completely unrelated to the defconfigs.
> 
> We have two completely distinct CI mechanisms:
> 
>  (1) Gitlab CI. This one does the kind of traditional CI that most
>      projects have. In the case of Buildroot, it does build the defconfigs
>      and runs the runtime tests on a regular basis.
> 
>  (2) Autobuilders. These generate random configurations, and build
>      those random configurations. We have a number of machines (about
>      5-6 machines) that do this 24/7 and report the results at
>      http://autobuild.buildroot.org. This gives a much wider testing
>      coverage than building defconfigs, as our defconfigs are almost all
>      minimal.
> 
> So, when I say "autobuilders", I'm referring to (2) above. And I don't
> get why this sys/io.h doesn't occur in the autobuilders.

Got it, thanks. Is it possible to search the autobuilder configurations for
the above case? Maybe it never came up. Or maybe it *has* been tested, just
before this bug was introduced.
