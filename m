From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 2 Apr 2019 09:06:50 +0200
Subject: [Buildroot] [PATCH v3 3/4] support/testing: test can use the
 locally generated qemu host tool
In-Reply-To: <5c9ee2b9d0ea5_29f73fa56c112b2c43513@ultri5.mail>
References: <20190322095818.19914-3-etienne.carriere@linaro.org>
 <5c9ee2b9d0ea5_29f73fa56c112b2c43513@ultri5.mail>
Message-ID: <20190402090650.645aeef7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Ricardo and Etienne,

On Sat, 30 Mar 2019 00:30:01 -0300
Ricardo Martincoski <ricardo.martincoski@gmail.com> wrote:

> I am not strongly against it.
> But let me ask:
> Are you or someone else having trouble with any other test case when using
> "old" qemu versions from host?
> 
> If the answer is no, maybe we should keep things simple and use a patch very
> similar to v2 of this one, just adding the host-qemu to the test case config
> fragment and the 'local' argument to Emulator.run.
> I say similar to v2 because I think your implementation in v3 with the
> 'qemu_bin' variable is better than v2.

I totally agree here. Having this option --local-emulator doesn't make
much sense. We would have to use it for some tests, but not for some
other tests.

Instead, we want each test to know whether it needs a recent enough
version of Qemu, or whether the system-provided Qemu version is good
enough.

> Another approach "to have an generic option to script run-tests to build the
> emulator within the test config" (quoting your reply to v2) would be:
> Instead of adding a command line argument to run-tests, create a new flag in
> the test case class, perhaps named "build_emulator". If that flag is True, the
> host-qemu is automatically added to the config fragment by the test infra. The
> same flag could be propagated to the Emulator.init so we don't need to pass
> 'local' to Emulator.run.

Yes, something like that sounds good.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
