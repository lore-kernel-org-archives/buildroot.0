From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 7 Mar 2013 09:59:39 +0100
Subject: [Buildroot] [uclinux-dist-devel] [Announcement] The 2012R2
 buildroot Linux release for Blackfin
In-Reply-To: <DB904C5425BA6F4E8424B3B51A1414D173F6FB6E58@NWD2CMBX1.ad.analog.com>
References: <DB904C5425BA6F4E8424B3B51A1414D173F6FB6E58@NWD2CMBX1.ad.analog.com>
Message-ID: <20130307095939.1316014e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sonic Zhang,

On Mon, 4 Feb 2013 05:03:22 -0500, Zhang, Sonic wrote:
> The 2012R2 buildroot Linux release for Blackfin
> 
> The new buildroot distribution was introduced in the 2012R1 Linux
> release for BF60x in Aug. 2012. To help BF5xx customers to leverage
> new features in the buildroot distribution, we are pleased to
> announce the 2012R2 buildroot Linux release for both BF5xx and BF60x
> families. Although the uClinux related issues in 2011R1 and former
> releases are still supported via the Linux community on the ADI
> Engineering Zone, the uClinux distribution for BF5xx is discontinued
> since the 2012R2 release. Please upgrade to the buildroot
> distribution in the 2012R2 release for latest features in Linux
> kernel and middle wares. An overview and basic development guide for
> the buildroot can be found at
> http://docs.blackfin.uclinux.org/doku.php?id=buildroot_on_blackfin .

As a Buildroot developer, I'm glad to hear that Analog Devices is now
using it as its official build system.

However, I can only find regrettable that none of the Blackfin changes
that you and your team has made have gotten upstream. This means that
you're now working on a fork of Buildroot that has significantly
derived from the original project. It means that it will be a pain for
you and your team to upgrade to new Buildroot versions, and it removes
the possibility for your users to easily benefit from all the package
updates and new packages that are introduced regularly in the upstream
Buildroot project (where the level of activity is very good).

Could we find a way of getting your changes upstream, so that your
Buildroot is closer to the upstream version?

Also, your page
http://docs.blackfin.uclinux.org/doku.php?id=buildroot:build-system is
incorrect. It says "The buildroot build system is based on GNU
configure and build system". This is completely false: it is based on
the kernel kconfig configuration system, and GNU make.

Then your Wiki page goes on with " The top level Makefile builds the
GNU configuration utility under package/config at first". This is not
true, it is *not* the GNU configuration utility, but the Linux kernel
kconfig system.

The Wiki page then describes a number of Config.in files, as if
modifying them was necessary to change the configuration. This is
obviously completely wrong: users should change the configuration using
'make menuconfig', 'make xconfig, 'make gconfig', and certainly not by
editing Config.in files, whose purpose is to *describe* configuration
options, not to *define* the value of configuration options.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
