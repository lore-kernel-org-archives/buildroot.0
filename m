From: Lee, Tommy <Tommy_Lee@alliedtelesis.com>
Date: Thu, 24 Sep 2015 15:53:28 -0700
Subject: [Buildroot] Building system for the Marvell's ARMADA A385 borad
 to resolve the VLAN trunk issue
In-Reply-To: <871tdno5er.fsf@dell.be.48ers.dk>
References: <944894A3EB1D044A9003B2F944389BB20474C34B0F@svr-wa-exch1.atg.lc>
 <5600612C.5060300@mind.be>	<20150923170613.75f5e7e4@free-electrons.com>
 <871tdno5er.fsf@dell.be.48ers.dk>
Message-ID: <944894A3EB1D044A9003B2F944389BB20474C34C8C@svr-wa-exch1.atg.lc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I do not know any other ARMADA A38x issues hanging there. My issue is the boot-time enabling of two eth interfaces on the DB-88F6820-GP board - eth0 for DHCP; eth1 for static.

Yesterday I used one of four Marvell's DTB files with my 4.0.4 system zImage built with mvebu_v7_defconfig. The boot process automatically enabled only eth0.

Unfortunately I do not have the DTS file for building that DTB file. I am reviewing the relevant DTS files, in the 2015.05 and Marvell's 2012.11 file systems, to try to resolve the eth1 enabling issue now.

Tommy

-----Original Message-----
From: Peter Korsgaard [mailto:jacmet at gmail.com] On Behalf Of Peter Korsgaard
Sent: Thursday, September 24, 2015 2:48 PM
To: Thomas Petazzoni
Cc: Arnout Vandecappelle; buildroot at busybox.net; Lee, Tommy
Subject: Re: Building system for the Marvell's ARMADA A385 borad to resolve the VLAN trunk issue

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 > The reason why I didn't submit a defconfig is because there is no  > full-featured publicly available bootloader for these platforms. The  > bootloader provided by Marvell is not publicly available (you have to  > be a customer, and use an account to access their Extranet and download  > the U-Boot sources). There is now some U-Boot support in the mainline  > U-Boot, but I haven't tried it yet.

Ok, but I guess missing open u-boot support shouldn't be a deal breaker. We already have a few defconfigs without bootloader config (lego_ev3, openblocks_a6, s6lx9_microboard, ..).


 > So I could submit a huge bunch of defconfigs for all the Armada 370,  > XP, 375, 38x and 39x platforms that I have (it would probably be 15 to  > 20 defconfigs), but they would only differ by the name of the Device  > Tree in the defconfig. All the rest would be exactly the same. So I  > wasn't sure it was really worth adding 15 to 20 more defconfigs for a  > configuration that doesn't include the bootloader and where all  > configurations would be almost identical.

Couldn't we just do a single defconfig that builds all the dtb files and then add a README describing what dtb / how to boot on the various boards?

--
Bye, Peter Korsgaard

This e-mail message is for the sole use of the intended recipient(s) and may contain confidential and privileged information. Any unauthorized review, use, disclosure or distribution is prohibited. If you are not the intended recipient, please contact the sender by reply e-mail and destroy all copies of the original message. If you are the intended recipient, please be advised that the content of this message is subject to access, review and disclosure by the sender's e-mail System Administrator.
