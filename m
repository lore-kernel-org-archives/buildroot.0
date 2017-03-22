From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Mar 2017 14:06:39 +0100
Subject: [Buildroot] [PATCH] support/script/check-bin-arch: ignore
	/usr/share
In-Reply-To: <87inn1k9bb.fsf@dell.be.48ers.dk>
References: <1490128516-31437-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <87inn1k9bb.fsf@dell.be.48ers.dk>
Message-ID: <20170322140639.5c8c5149@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 22 Mar 2017 09:24:56 +0100, Peter Korsgaard wrote:

> http://autobuild.buildroot.net/results/4e2/4e27559827f3ed75a12f13bd595998bf661b2aaf/build-end.log
> http://autobuild.buildroot.net/results/99e/99e4ed21116c721faf9f1d0349f312b357d333ee/build-end.log
> 
> I wonder if we shouldn't turn the tests around, E.G. instead of
> searching for elf files with a machine different from target, search for
> a files with machine == host.

Indeed, that's an option. We would need to have only the readelf
machine string for the most common build architectures (x86, x86-64),
and if Buildroot is used on a different architecture, we simply don't
do the check.

> If we do this then we need to disable the test when host == target (but
> the current tests aren't really helpful either for such setups).

Correct.

> This can naturally still fail if somebody adds a package (E.G. in
> br2-external) that installs a i386/x86-64 binary. Presumably this could
> happen if you want to include a PC application to inside the firmware
> (E.G. downloadable through the web interface and used for controlling
> the firmware or similar), but it doesn't get caught up in all these
> build issues about various other firmware files or slightly different
> machine strings (sparc / sparcv9, arcompat / arcv2)..

I must say I still like the fact that we detect sparc vs. sparcv9,
arcompat vs arcv2. I.e why do we have some binaries that have a
different machine number than most of the binaries being produced?

But I agree it's of limited usefulness, so if you want me to change the
mechanism by inverting the logic, I can cook some patches.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
