From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Dec 2018 09:16:56 +0100
Subject: [Buildroot] Buildroot 2018.11.1 released
In-Reply-To: <87k1k5upbc.fsf@dell.be.48ers.dk>
References: <87k1k5upbc.fsf@dell.be.48ers.dk>
Message-ID: <20181220091656.40397ad9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

+Fabio for Freescale/NXP related build failures, +Ricardo for the
systemd test failure.

On Wed, 19 Dec 2018 23:25:27 +0100, Peter Korsgaard wrote:

> Buildroot 2018.11.1 is released - Go download it at:

Thanks for this release. There was a Gitlab CI run on the 2018.11.1
tag, see
https://gitlab.com/buildroot.org/buildroot/pipelines/40779740/builds.
We have only 3 failures on a total of 262 tests, which is not bad.

Here is a quick analysis:

imx6slevk_defconfig,
https://gitlab.com/buildroot.org/buildroot/-/jobs/136980040

freescale_imx7dsabresd_defconfig,
https://gitlab.com/buildroot.org/buildroot/-/jobs/136980027

Both of these look very similar to what was fixed by commit
1ad9c45a059deaaae65a78a9ed7f78b579fed422 in master, but this commit is
also in 2018.11.x.

However, commit 1ad9c45a059deaaae65a78a9ed7f78b579fed422 does not apply
to the failing defconfigs, as they don't use the patch added in
board/freescale/ by this commit.

Fabio, could you perhaps have a look ?

The last failure is on a systemd test, where it says that the boot
didn't work:

https://gitlab.com/buildroot.org/buildroot/-/jobs/136980206

However, looking at the boot log at
https://gitlab.com/buildroot.org/buildroot/-/jobs/136980206/artifacts/file/test-output/TestInitSystemSystemdRwFull-run.log,
it did boot, the login prompt appears.

Perhaps something for Ricardo ? :-)

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
