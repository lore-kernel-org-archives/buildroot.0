From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Oct 2016 09:12:27 +0200
Subject: [Buildroot] Autobuilder for powerpc64le?
In-Reply-To: <20161026051532.GA13988@tungsten.ozlabs.ibm.com>
References: <20161026051532.GA13988@tungsten.ozlabs.ibm.com>
Message-ID: <20161026091227.7eb2f99f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Sam,

On Wed, 26 Oct 2016 16:15:32 +1100, Sam Bobroff wrote:

> (I'm guessing from all the autobuilder email that you're the right person to
> talk to!)

Indeed :)

> Are you interested in having an autobuilder for powerpc64le and possibly
> powerpc64 (big endian)?

Are you talking about:

 1. Using powerpc64le/power64 as the *build* machine
 2. Using powerpc64le/powerpc64 as the *target*

I'd say that both are useful, though (2) looks more interesting to me.

> If so, what would be involved in setting it up?

Depends if you're talking about (1) or (2), so let's talk about both.

 (1) Requires you to have a machine available to do builds. You install
     the autobuild-run script from
     https://git.buildroot.org/buildroot-test/tree/scripts/autobuild-run
     on this machine, and simply run it. By default, it simply does
     some builds and keeps the build results around. This way, you can
     check if everything looks OK and you don't have bogus results due
     to missing things on the build machine. Once you have run this for
     about a day and checked that there doesn't seem to be any bogus
     result, then I can create credentials for you so that
     autobuild-run can upload the build results on
     http://autobuild.buildroot.org.

 (2) Requires adding some base toolchain configurations in
     https://git.buildroot.org/buildroot-test/tree/web/toolchains/configs/.
     One .config file per toolchain configuration, and each of them
     should be referenced in toolchain-configs.csv.

Also, if you're interested in powerpc64 and powerpc64le and we indeed
add toolchain configurations in the autobuilders, it would be nice if
you could add:

N:	Sam Bobroff <sam.bobroff@au1.ibm.com>
F:	arch/Config.in.powerpc

to the DEVELOPERS file. This way, you will receive a daily e-mail with
the failures that occurred on powerpc, powerpc64 and powerpc64le (i.e
all BR2_ARCH values described in arch/Config.in.powerpc).

Thanks! 

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
