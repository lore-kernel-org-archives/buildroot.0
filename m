From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Sep 2015 23:48:12 +0200
Subject: [Buildroot] Building system for the Marvell's ARMADA A385 borad
	to resolve the VLAN trunk issue
In-Reply-To: <20150923170613.75f5e7e4@free-electrons.com> (Thomas Petazzoni's
 message of "Wed, 23 Sep 2015 17:06:13 +0200")
References: <944894A3EB1D044A9003B2F944389BB20474C34B0F@svr-wa-exch1.atg.lc>
 <5600612C.5060300@mind.be>
 <20150923170613.75f5e7e4@free-electrons.com>
Message-ID: <871tdno5er.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 > The reason why I didn't submit a defconfig is because there is no
 > full-featured publicly available bootloader for these platforms. The
 > bootloader provided by Marvell is not publicly available (you have to
 > be a customer, and use an account to access their Extranet and download
 > the U-Boot sources). There is now some U-Boot support in the mainline
 > U-Boot, but I haven't tried it yet.

Ok, but I guess missing open u-boot support shouldn't be a deal
breaker. We already have a few defconfigs without bootloader config
(lego_ev3, openblocks_a6, s6lx9_microboard, ..).


 > So I could submit a huge bunch of defconfigs for all the Armada 370,
 > XP, 375, 38x and 39x platforms that I have (it would probably be 15 to
 > 20 defconfigs), but they would only differ by the name of the Device
 > Tree in the defconfig. All the rest would be exactly the same. So I
 > wasn't sure it was really worth adding 15 to 20 more defconfigs for a
 > configuration that doesn't include the bootloader and where all
 > configurations would be almost identical.

Couldn't we just do a single defconfig that builds all the dtb files and
then add a README describing what dtb / how to boot on the various
boards?

-- 
Bye, Peter Korsgaard
