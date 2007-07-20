From: Rick Foos <rick@synchromeshcomputing.com>
Date: Fri, 20 Jul 2007 17:04:43 -0500
Subject: [Buildroot] Fixdep and extra line feeds in cygwin
References: <20070720143902.0D57C3006F@busybox.net>
	<E496871456016F4CA8959BE4105D2A890E8B84@troe2k1.cs.myharris.net>
Message-ID: <008301c7cb19$fb3e1800$8200000a@k2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Run cygwin setup. Change the "Default Text Type" to Unix / binary, aboujt 
three next buttons in.

Tried it just this morning and it worked for me.

The kernel and a few other places have case sensitive files that will be 
overwritten on DOS filesystems. This can cause some problems that might 
prevent a number of configurations from working.

Regards,
Rick Foos

----- Original Message ----- 
From: "Crane, Matthew" <mcrane03@harris.com>
To: <buildroot@uclibc.org>
Sent: Friday, July 20, 2007 3:53 PM
Subject: [Buildroot] Fixdep and extra line feeds in cygwin


>
>
> Hi,
>
> Is there a patch or a simple change I can make to cause fixdep not to
> create dependencies with Dos type line feeds?
>
> This is causing the error where the extra line feeds cause macro line
> continuations to have an extra line and break.
>
> Any help much apreciated, thanks.
>
> Matt
>
> make[1]: Entering directory
> `/usr/local/src/hd2/buildroot-20070718/project_build_arm_nofpu/uclibc/bu
> sybox-1.6.1'
>  HOSTCC  scripts/basic/split-include
>  HOSTCC  scripts/basic/docproc
>  SPLIT   include/autoconf.h -> include/config/*
>  GEN     include/bbconfigopts.h
>  HOSTCC  applets/usage
>  GEN     include/usage_compressed.h
>  CC      applets/applets.o
> fixdep:
> : No such file or directory
> make[2]: *** [applets/applets.o] Error 2
> make[1]: *** [applets] Error 2
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
>
>
> -- 
> No virus found in this incoming message.
> Checked by AVG Free Edition.
> Version: 7.5.476 / Virus Database: 269.10.10/908 - Release Date: 7/19/2007 
> 6:10 PM
>
> 
