From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Jun 2015 20:02:35 +0200
Subject: [Buildroot] Buildroot runtime test infrastructure prototype
Message-ID: <20150625200235.083eaf34@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Our http://autobuild.buildroot.org tests are great, but they are only
build-time tests, and they only test random configurations of packages.
Things like bootloader packages, filesystem images, kernel build are
never tested in an automated way, and no runtime testing is done. I
also want to be able to build small test programs exercising specific
features and run them on the target.

Since a while, I wanted to setup a small infrastructure to be able to
describe specific test cases: a Buildroot configuration to build, with
the ability to boot some of those configurations automatically in Qemu.

So I finally went ahead and create such a small infrastructure. It's
very basic and minimal right now, and should be considered as an
experiment. It's available at:

   https://github.com/tpetazzoni/buildroot-runtime-test

It's based on the Python unittest mechanism, and allows to describe
test cases that consist in a Buildroot defconfig, plus a Python
function that can do some checks on the resulting build, boot the
system under Qemu, run some commands inside the Qemu system and check
their results.

I've written a few tests to show how it could work: simple tests for
Dropbear and Python (on the package side) and several tests for
filesystem images: ext2/3/4, squashfs, jffs2, ubi, iso9660, yaffs2 (all
of them are boot tested, except yaffs2).

For now, it's very crude and basic. The README file explains how it
works, and gives a TODO listing some of the things that for sure need
to be improved.

Currently, this runtime test infrastructure is not set up to be
executed every day on the latest Git, but it is obviously the goal.

Contributions, comments and suggestions are welcome.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
