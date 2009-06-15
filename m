From: pwalters21 at cox.net <pwalters21@cox.net>
Date: Mon, 15 Jun 2009 12:36:07 -0400 (EDT)
Subject: [Buildroot] ARCH not being sent by make menuconfig for "geode" -
 kernel compile fails to start
Message-ID: <26645697.32155.1245083767476.JavaMail.pwalters21@127.0.0.1>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


When "Target Architecture Variant" is selected as 'geode', BR2_ARCH in 
.config is not set at all, and as result the toolchain fails to build.

I've seen this topic here about a year ago along with a patch to fix it. 
Unfortuantely the fix has never been adopted. ( 
http://lists.busybox.net/pipermail/buildroot/2007-July/003704.html )

Please can we get this patch into target/Config.in.arch?

Patch against buildroot-2009.05 file: target/Config.in.arch attached 
below:

*** old/Config.in.arch 2009-06-15 09:04:25.000000000 -0700
--- Config.in.arch 2009-06-15 09:05:07.000000000 -0700
***************
*** 465,470 ****
--- 465,471 ----
   default "i486" if BR2_x86_i486
   default "i586" if BR2_x86_i586
   default "i586" if BR2_x86_pentium_mmx
+ default "i586" if BR2_x86_geode
   default "i686" if BR2_x86_i686
   default "i686" if BR2_x86_pentium2
   default "i686" if BR2_x86_pentium3
