From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 04 Feb 2009 16:11:07 +0100
Subject: [Buildroot] BR-2009.02-rc3 Make Error (./makedepend: 1: Syntax
	error: Unterminated quoted string)
In-Reply-To: <BAY124-DS4F2AA8AFF4C9516A055FDD2C20@phx.gbl>
	(quickx@hotmail.com's message of "Tue\,
	3 Feb 2009 13\:15\:44 -0800")
References: <BAY124-DS4F2AA8AFF4C9516A055FDD2C20@phx.gbl>
Message-ID: <87d4dyck50.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "QuickX" == QuickX  <quickx@hotmail.com> writes:

Hi,

 QuickX> I'm trying to build the at91sam9261ek_defconfig build on a
 QuickX> Kubuntu 8.10 machine.  I issue the following commands and get
 QuickX> the following error:

 QuickX> Note: I notice it seems to be at a perl type section.  I do have perl 
 QuickX> v5.10.0 on the host machine, is there a package I'm missing?

 QuickX> $ tar xf buildroot-2009.02-rc3.tar.gz
 QuickX> $ cd buildroot-2009.02-rc3
 QuickX> $ make menuconfig ((SAVE EXIT))
 QuickX> $ make at91sam9261ek_defconfig
 QuickX> $ make

..

 QuickX> Extracting x2p/Makefile (with variable substitutions)
 QuickX> /home/dustin//buildroot-2009.02-rc3/toolchain_build_arm/bin/sed -i -e 
 QuickX> 's/^.*<command-line>.*//g' 
 QuickX> /home/dustin//buildroot-2009.02-rc3/build_arm/perl-5.8.8/x2p/makefile
 QuickX> /home/dustin//buildroot-2009.02-rc3/toolchain_build_arm/bin/sed: can't read 
 QuickX> /home/dustin//buildroot-2009.02-rc3/build_arm/perl-5.8.8/x2p/makefile: No 

I just tried building it for i686 without problems - I'll try the
atmel config as well.

I don't use perl, but it seems from the above like Ulf's r25032 might
have gotten the file case wrong - It talks about x2p/Makefile but is
then trying to sed x2p/makefile. Could you try changing the $(SED)
line in package/microperl/microperl.mk to use x2p/Makefile?

-- 
Bye, Peter Korsgaard
