From: Romain Naour <romain.naour@openwide.fr>
Date: Fri, 17 Jul 2015 13:55:24 +0200
Subject: [Buildroot] [PATCH] ARC: update tools to arc-2015.06 release
In-Reply-To: <55A8EAF7.5060506@openwide.fr>
References: <1436964678-24352-1-git-send-email-abrodkin@synopsys.com>
 <55A8EAF7.5060506@openwide.fr>
Message-ID: <55A8ED2C.4000805@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 17/07/2015 13:45, Romain Naour a ?crit :
> Hi Alexey,
> 
> Le 15/07/2015 14:51, Alexey Brodkin a ?crit :
>> I'm happy to update GNU tools for ARC cores to the most recent
>> arc-2015.06 release.
>>
>> This release brings following major improvements:
>>  * GCC: source update to v4.8.4
>>  * GCC: C ABI compatibility between MetaWare and GNU toolchains
>>  * uClibc: support for thread local storage and Native Pthread Library (NPTL)
>>  * GDB: updated to version 7.9.1
>>
>> Also a lot of fixes and improvements has been done, please refer to
>> https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/tag/arc-2015.06
>> for more details.
>>
>> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
>> Cc: Anton Kolesov <akolesov@synopsys.com>
>> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>> Cc: Peter Korsgaard <peter@korsgaard.com>
>> Cc: Romain Naour <romain.naour@openwide.fr>
>> ---
>>
>> I hope this time all required pieces are in place :)
> 
> Your patch looks good, but I have a build failure with uclibc:
> 
> make O=test/arc/ toolchain 2>&1 | tee build-arc-toolchain.log
> 
>>>> uclibc arc-2015.06 Patching
> support/kconfig/merge_config.sh -m -O /home/naourr/git/buildroot/test/arc/build/uclibc-arc-2015.06 package/uclibc/uClibc-snapshot.config 
> Using package/uclibc/uClibc-snapshot.config as base
> #
> # merged configuration written to /home/naourr/git/buildroot/test/arc/build/uclibc-arc-2015.06/.config (needs make)
> #
>   MKDIR include/config
>   MKDIR include/generated
>   MKDIR extra/config/lxdialog
>   HOSTCC-o extra/config/conf.o
>   GEN extra/config/zconf.tab.c
>   GEN extra/config/zconf.lex.c
>   GEN extra/config/zconf.hash.c
> /bin/sh: test/arc//extra/config/zconf.hash.c: No such file or directory
> Makefile:70: recipe for target 'test/arc//extra/config/zconf.hash.c' failed
> make[3]: *** [test/arc//extra/config/zconf.hash.c] Error 1
> make[3]: *** Waiting for unfinished jobs....
> /bin/sh: test/arc//extra/config/zconf.tab.c: No such file or directory
> /bin/sh: test/arc//extra/config/zconf.lex.c: No such file or directory
> Makefile:70: recipe for target 'test/arc//extra/config/zconf.tab.c' failed
> make[3]: *** [test/arc//extra/config/zconf.tab.c] Error 1
> Makefile:70: recipe for target 'test/arc//extra/config/zconf.lex.c' failed
> make[3]: *** [test/arc//extra/config/zconf.lex.c] Error 1
> Assembler messages:
> Fatal error: can't create test/arc//extra/config/conf.o: No such file or directory
> Makefile:64: recipe for target 'test/arc//extra/config/conf.o' failed
> make[3]: *** [test/arc//extra/config/conf.o] Error 1
> Makefile.in:465: recipe for target 'test/arc//extra/config/conf' failed
> make[2]: *** [test/arc//extra/config/conf] Error 2
> package/uclibc/uclibc.mk:485: recipe for target '/home/naourr/git/buildroot/test/arc/build/uclibc-arc-2015.06/.config' failed
> make[1]: *** [/home/naourr/git/buildroot/test/arc/build/uclibc-arc-2015.06/.config] Error 2
> Makefile:36: recipe for target 'toolchain' failed
> make: *** [toolchain] Error 2
> 
> It seems a issue related of out of tree build...
> The same issue happen with 2015.06-rc1/
> 
> However, it build fine without 'O='.
> 
> Humm, I tried to build different version of uClibc (-ng, -snapshot and -arc)
> and the out of tree build is broken.
> 
> Yann, have you an idea, is it a kconfig-package issue ?

I'm on master 0daffc0b65aa86d6d5bc6916736e0cffcdf540cc (setools: Add missing
bison dependency). So after "core/out-of-tree: fix Makefile wrapper".

Romain

> 
> Best regards,
> Romain
> 
>>
