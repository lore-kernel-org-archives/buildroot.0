From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Tue, 08 Jul 2008 12:22:28 +0200
Subject: [Buildroot] [buildroot 0003994]: Default ngw100-base config
 fails with invalid directory when compiling gcc
In-Reply-To: <95e7cc33deeab93d180cf51ba6b2a69e@busybox.net>
References: <95e7cc33deeab93d180cf51ba6b2a69e@busybox.net>
Message-ID: <48733FE4.2000709@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

bugs at busybox.net skrev:
> The following issue has been SUBMITTED. 
> ====================================================================== 
> http://busybox.net/bugs/view.php?id=3994 
> ====================================================================== 
> Reported By:                mpfj
> Assigned To:                buildroot
> ====================================================================== 
> Project:                    buildroot
> Issue ID:                   3994
> Category:                   Architecture Specific
> Reproducibility:            always
> Severity:                   major
> Priority:                   normal
> Status:                     assigned
> ====================================================================== 
> Date Submitted:             07-08-2008 03:02 PDT
> Last Modified:              07-08-2008 03:02 PDT
> ====================================================================== 
> Summary:                    Default ngw100-base config fails with invalid
> directory when compiling gcc
> Description: 
> Checked out latest svn copy
> 
> # make atngw100-base_defconfig
> # make
> 
> Fails with the following ...
> 
> # Apply any files named gcc-*.patch from the source directory to gcc
> toolchain/patch-kernel.sh
> /usr/local/dev/avr32/buildroot-cvs/toolchain_build_avr32/gcc-4.2.2-avr32-2.1.5
> Atmel/avr32/gcc-4.2.2-avr32-2.1.5 \*.patch
> Aborting.  'Atmel/avr32/gcc-4.2.2-avr32-2.1.5' is not a directory.
> make: ***
> [/usr/local/dev/avr32/buildroot-cvs/toolchain_build_avr32/gcc-4.2.2-avr32-2.1.5/.patched]
> Error 1
> 
> This can be temporarily fixed with ...
> 

> # mkdir Atmel
> # cd Atmel
> # ln -s ../toolchain_build_avr32 avr32

The config contains

# BR2_TOOLCHAIN_SYSROOT is not set

This should be set for this toolchain.
I.E:
BR2_TOOLCHAIN_SYSROOT=y

> 
> ====================================================================== 
> 
> Issue History 
> Date Modified   Username       Field                    Change               
> ====================================================================== 
> 07-08-08 03:02  mpfj           New Issue                                    
> 07-08-08 03:02  mpfj           Status                   new => assigned     
> 07-08-08 03:02  mpfj           Assigned To               => buildroot       
> ======================================================================
> 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD8DBQFIcz/jAyRRH5cXxqwRAvTqAJ9+PpE3Xug/isnjV9CFu066Bwx3MQCgjia1
WJXpm/fXLl0tnYFhXgnsZU8=
=3t7y
-----END PGP SIGNATURE-----
