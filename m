From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Jul 2015 09:31:42 +0200
Subject: [Buildroot] Autobuilder toolchain updates
In-Reply-To: <87zj36mj6a.fsf@dell.be.48ers.dk>
References: <20150707232812.603af01f@free-electrons.com>
 <87zj36mj6a.fsf@dell.be.48ers.dk>
Message-ID: <20150709093142.177044e2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Wed, 08 Jul 2015 23:30:21 +0200, Peter Korsgaard wrote:

>  >  * All Buildroot external toolchains have been rebuilt with today's
>  >    master (commit 85945aa). This means that the default compiler
>  >    version used is gcc 4.9.x. Only toolchain,
>  >    br-arm-cortex-a9-glibc-2015.05-496-g85945aa.tar.bz2, is using gcc
>  >    5.1.x, so that we have at least one toolchain testing this new
>  >    compiler version. One toolchain, the NIOS II, could not be rebuilt
>  >    with the current master as the build fails (it was working on
>  >    2015.05).
> 
> Great, thanks! Does the nios issue look fixable?

It is apparently the bump from gcc 4.9.2 to 4.9.3 that caused the
problem. At least, that's the conclusion of a git bisect done by Yann.

The failure is that some NIOS II specific linux-atomic.c file tries to
include <asm/unistd.h>, but that file doesn't exist. More investigation
is needed.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
