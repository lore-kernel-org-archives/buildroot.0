From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 30 Jan 2019 09:03:01 +0100
Subject: [Buildroot] [PATCH 2/2] support/testing: add atop test
In-Reply-To: <5c510deba126a_42713fb91e0de6f447919@ultri5.mail>
References: <20190129222539.54bafd2a@windsurf>
 <5c510deba126a_42713fb91e0de6f447919@ultri5.mail>
Message-ID: <20190130090301.1736f95d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 30 Jan 2019 00:37:31 -0200
Ricardo Martincoski <ricardo.martincoski@gmail.com> wrote:

> No. My mistake, sorry.
> I should had used the prebuilt armv7 kernel.
> I guess I can remove all lines from BR2_TARGET_GENERIC_GETTY_PORT to
> BR2_LINUX_KERNEL_INTREE_DTS_NAME.
> 
> I was (wrongly) pretty sure we always use prebuilt kernel 3.11.0 .
> That's because all *-run.log for the python test cases.
> 
> This new version of atop needs kernel headers >= 3.14.
> So I decided to not take the risk of having weird behaviors using an older (than
> 3.14) kernel.
> Then I saw that the rust test case compiles kernel 4.x and decided to do the
> same. I just copied the current kernel version from qemu_arm_vexpress_defconfig.
> 
> What I missed is that only the armv5 prebuilt kernel is 3.11.0 . The armv7 one
> is 4.0.0 (as we can see on all *-run.log for the perl test cases) and therefore
> it should work here.

OK. We could actually switch the armv5 prebuilt kernel to a newer
kernel version as well.

> Should I send a followup patch switching to prebuilt kernel?

Yes, please. It makes the test case a lot faster to build/test.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
