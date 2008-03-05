From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Wed, 5 Mar 2008 10:20:43 +0100
Subject: [Buildroot] build problems
References: <234005.33609.qm@web58214.mail.re3.yahoo.com>
Message-ID: <00ac01c87ea5$abcde440$0c0514ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> ----- Original Message ----
>> From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
>> To: Steve Calfee <nospamcalfee@yahoo.com>
>> Sent: Tuesday, March 4, 2008 4:21:09 PM
>> Subject: Re: [Buildroot] build problems
>> 
>> Hi, I am continually having problems building.
>> > I have the latest svn sources.
>> > 
>> > Does anybody know which of the arm926 projects ie xxxx_defconfig currently is 
>> buildable. I would like to get an existing build to work before I customize it. 
>> I am running on ubuntu Feisty.
>> > 
>> > As a second question, if I wish to change the package selection, do I need to 
>> do a make clean? or will another make only deal with the current package 
>> selections? If I do a make menuconfig, does it blitz the existing .config back 
>> to defaults, or can I change packages at will starting with whatever prebuilt 
>> xxx-defconfig I used?
>> > 
>> > Thanks, Steve
>> > 
>> > 
>> 
>> 
>> I think that 
>> 
>> $ touch .config
>> $ make at91sam9260dfc_defconfig
>> $ make
>> 
>> should complete the build, but it was some time
>> since I downloaded to a target, so I do not know if it will run.
>> 
>> I run OpenSuSE 10.2
>> 
> 
> Thanks for the help. I had tried that before. the file package download site version had changed and I fixed that. Now when I do the build I get:
> 
> gzip -d -c /usr/local/install/downloads/libdaemon-0.12.tar.gz | tar -C /home/calfee/buildroot/arm/buildroot/build_arm   -xf -
> toolchain/patch-kernel.sh /home/calfee/buildroot/arm/buildroot/build_arm/libdaemon-0.12 package/libdaemon/ \*.patch
> 
> Applying libdir-la.patch using plaintext: 
> patching file ltmain.sh
> Hunk #1 succeeded at 273 (offset 42 lines).
> Hunk #2 succeeded at 2408 with fuzz 2 (offset 128 lines).
> Hunk #3 succeeded at 2896 (offset 135 lines).
> Hunk #4 succeeded at 5623 (offset 465 lines).
> Hunk #5 succeeded at 5948 (offset 468 lines).
> 
> Applying xcompile-setpgrp.patch using plaintext: 
> patching file configure.ac
> cp -f package/gnuconfig/config.sub package/gnuconfig/config.guess /home/calfee/buildroot/arm/buildroot/build_arm/libdaemon-0.12
> touch /home/calfee/buildroot/arm/buildroot/build_arm/libdaemon-0.12/.unpacked
> (cd /home/calfee/buildroot/arm/buildroot/build_arm/libdaemon-0.12 && rm -rf config.cache && autoreconf)
> configure.ac:41: error: possibly undefined macro: AC_PROG_LIBTOOL
>      If this token and others are legitimate, please use m4_pattern_allow.
>      See the Autoconf documentation.
> autoreconf2.50: /usr/bin/autoconf failed with exit status: 1
> make: *** [/home/calfee/buildroot/arm/buildroot/build_arm/libdaemon-0.12/.configured] Error 1
> calfee at squiggy-linux:~/buildroot/arm/buildroot$ 
> 
> 
> I have tried several other defconfig packages, and they all seem to have their own peculiar failures. This failed after the busybox build, so I guess it is a selected package. I know you don't have time to diagnose my problem, that is why I am looking for someone who has a recent arm926 package building with pure buildroot files. Maybe there isn't any?
> 
> Thanks for the suggestion, Steve
> 


I think this is more the PC configuration.
You may have to upgrade your Autotools.


Best Regards
Ulf Samuelsson
