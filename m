From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Feb 2019 22:43:57 +0100
Subject: [Buildroot] [PATCH v4 6/7] configs/qemu_armv7a_tz_virt: Armv7-A
 emulation with TrustZone services
In-Reply-To: <CAN5uoS-BaiDX8y2-LAsWLjahMtqGNBTvNajW0BReA_0QDEGtCQ@mail.gmail.com>
References: <1548845249-28201-1-git-send-email-etienne.carriere@linaro.org>
 <1548845249-28201-6-git-send-email-etienne.carriere@linaro.org>
 <20190217231234.321ec6e4@windsurf.home>
 <20190218181437.GA30645@scaer>
 <CAN5uoS-BaiDX8y2-LAsWLjahMtqGNBTvNajW0BReA_0QDEGtCQ@mail.gmail.com>
Message-ID: <20190218224357.7f3032f6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 18 Feb 2019 22:28:10 +0100
Etienne Carriere <etienne.carriere@linaro.org> wrote:

> > However, I would not be opposed to having _one_ defconfig that can be
> > used as a reference / starting-point.  
> 
> Is the Qemu emulator the best candidate for such starting point.
> I think it is as one can use it to experience Arm specific OP-TEE
> package without needing specific HW but a standard Linux host.
> 
> I would have preferred proposing a change in the already available
> Qemu Armv7 as qemu_arm_vexpress_defconfig is but I fear enabling
> TrustZone support in Qemu will break other nice Qemu features ones
> are used to (graphics?).
> 
> Maybe I can find a real HW for which BR can store a defconfig that
> enables OP-TEE.

I think Yann didn't say that a Qemu defconfig was not good, he said
quite the opposite: that having one Qemu defconfig that uses OP-TEE
would be useful.

Note: I am not sure I agree because if we go down this road, we would
have lots of Qemu defconfigs demonstrating lots of different features.

> > > Etienne, would you be willing to convert those two configurations to
> > > the runtime test infrastructure ?  
> 
> I think I can prepare that. Or I will ask few help on the ML if I
> can't find my way.

Sure, feel free to ask questions. The runtime test infrastructure is
not documented, but there are numerous existing test cases that you
should help you getting started.

You can list existing tests by doing:

./support/testing/run-tests -l

and run one specific test by doing:

 ./support/testing/run-tests -d /path/to/some/build/dir tests.fs.test_ext.TestExt2

Option -k is really useful during development, as it keeps the build
artifacts instead of removing them once the test is completed.

> The initial intention when adding these defconfig to my patch series
> was to answer a request from patch v3 (i think) review where Thomas
> asked for something that could b used to check OP-TEE at least
> builds, if possible boots, from a BR build. I understand that maybe
> you though more of such runtime test, rather than a defconfig.

Yeah, maybe I wasn't clear back then, sorry about that.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
