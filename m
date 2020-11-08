From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 8 Nov 2020 10:24:38 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2020-11-06
In-Reply-To: <5fa65657.1c69fb81.b78c4.0f1bSMTPIN_ADDED_MISSING@mx.google.com>
References: <5fa65657.1c69fb81.b78c4.0f1bSMTPIN_ADDED_MISSING@mx.google.com>
Message-ID: <4d36836c-0c98-5937-7eba-7cfa03a7feca@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Le 07/11/2020 ? 09:09, Thomas Petazzoni a ?crit?:
> Hello,
> 
> Autobuilder failures
> ====================
> 
> Below is a list of build failures reported by the Buildroot
> autobuilders in relation to packages or CPU
> architectures you are in charge of. Please help us
> improving the quality of Buildroot by investigating
> those build failures and sending patches to fix
> them.Thanks!
> 
> Results for the '2020.02.x' branch
> ----------------------------------
> 
> Build failures related to your packages:
> 
>     arch     |             reason             |                                       url                                      
> -------------+--------------------------------+---------------------------------------------------------------------------------
>     m68k     |         binutils-2.32          | http://autobuild.buildroot.net/results/34e5a8d68751ab228a835cc5b28bf92882dab486
> 
> 

I guess it's because the toolchain has been built before this patch:

https://git.buildroot.net/buildroot/commit/?id=aa3622758bb08fa517a3054076fca89f7697e550

The issue is only on 2020.02.x:
http://autobuild.buildroot.net/?reason=binutils-2.32

That's because the toolchain has been updated with a working elf2flt binary:
s/br-m68k-5208-full-2019.11.tar.bz2/br-m68k-5208-full-2020.02.tar.bz2/

https://git.buildroot.net/buildroot/commit/?id=152f8ff424980116c03f3232d44a162a64cbe584

Since it's the LTS branch, I'm not sure if we want to use
br-m68k-5208-full-2020.02.tar.bz2 or simply remove the broken
br-m68k-5208-full-2019.11.tar.bz2 from the toolchains used by autobuilders?

Best regards,
Romain
