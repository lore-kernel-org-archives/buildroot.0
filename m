From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 19 Jun 2019 08:48:51 +0200
Subject: [Buildroot] [EXTERNAL] [autobuild.buildroot.net] Your build
 results for 2019-06-13
In-Reply-To: <20190619061619.GC24143@tungsten.ozlabs.ibm.com>
References: <2t43n5cdd4-1@m0098420.ppops.net>
 <20190619061619.GC24143@tungsten.ozlabs.ibm.com>
Message-ID: <20190619084851.5500ad30@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Sam,

On Wed, 19 Jun 2019 16:16:19 +1000
Sam Bobroff <sbobroff@linux.ibm.com> wrote:

> I tried to replicate the modem-manager build failure, but it succeeded
> (I'm using br-reproduce-build). The error is odd as well:
> 
> make[4]: Entering directory '/home/buildroot/build/instance-0/output/build/modem-manager-1.10.0/libmm-glib/generated'
>   GEN      mm-enums-types.h
>   GEN      mm-errors-types.h
>   GEN      mm-gdbus-manager.c
> /bin/sh: line 1: /usr/bin/gdbus-codegen: No such file or directory
>   GEN      mm-gdbus-sim.c
> /bin/sh: line 1: /usr/bin/gdbus-codegen: No such file or directory
>   GEN      mm-gdbus-sms.c
>   GEN      mm-gdbus-call.c
> /bin/sh: line 1: /usr/bin/gdbus-codegen: No such file or directory
> Makefile:1173: recipe for target 'mm-gdbus-sim.c' failed
> make[4]: *** [mm-gdbus-sim.c] Error 127
> make[4]: *** Waiting for unfinished jobs....
> Makefile:1149: recipe for target 'mm-gdbus-manager.c' failed
> make[4]: *** [mm-gdbus-manager.c] Error 127

This issue is already fixed by
https://git.buildroot.org/buildroot/commit/?id=739c581663285db6efb3559969e9e04f873a38f7.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
