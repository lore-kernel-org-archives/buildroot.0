From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 08 Feb 2014 12:40:10 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <CAEBucnCzut=j3006fXSJaMhBfOO4wE_7Zu4JPDsVdn8jFS+y3g@mail.gmail.com>
References: <20140207073009.C5A85100E3A@stock.ovh.net>
 <20140207135324.4c7cbe3f@skate>
 <CAEBucnCzut=j3006fXSJaMhBfOO4wE_7Zu4JPDsVdn8jFS+y3g@mail.gmail.com>
Message-ID: <52F6179A.8070207@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Spenser, all
>>> microblaze |                     gpm-1.20.7 | NOK | http://autobuild.buildroot.net/results/5915af9e00fc29e48764778916ea6f806d6dceb8/
>> Not sure what's going on:
>>
>> /home/test/test/3/output/host/usr/bin/microblaze-buildroot-linux-gnu-gcc libgpm.so.2 \
>>           -L/home/test/test/3/output/build/gpm-1.20.7/src  -o lib/libgpm.so.2.1.0 lib/liblow.lo lib/libhigh.lo lib/libxtra.lo lib/report-lib.lo tools.lo  -lc
>> microblaze-buildroot-linux-gnu-gcc: error: libgpm.so.2: No such file or directory
> Me neither.  I'll try replicating it then take a look.
>
>
It seems to related to the toolchain where __ELF__ is not defined.

checking whether system is ELF... no

Then shared lib libgpm.so.2 is not build but still used in Makefile's 
target all...

I'm not sure about the right solution here but force the ELF format in 
gpm.mk fixe the build.
GPM_CONF_OPT += itz_cv_sys_elf=yes

Best regards,
Romain Naour
