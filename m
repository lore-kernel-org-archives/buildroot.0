From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 10 Dec 2019 14:31:11 +0100
Subject: [Buildroot] [PATCH] package/libnss: fix build failure on
 powerpc without <sys/auxv.h>
In-Reply-To: <3e33365c-5e48-b5c7-f67f-74e60c93d4c8@benettiengineering.com>
References: <20191210121322.120920-1-giulio.benetti@benettiengineering.com>
 <20191210140949.72b3cf96@windsurf>
 <3e33365c-5e48-b5c7-f67f-74e60c93d4c8@benettiengineering.com>
Message-ID: <20191210143111.0051e59f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 10 Dec 2019 14:23:02 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> > I'm not really a big fan of solutions that simply consist in "it wants
> > this file, this file is not available, so let's make it ignore it",
> > without a deeper investigation.  
> 
> Upstream already use this solution in the same file, i.e. arm/aarch64:
> https://hg.mozilla.org/projects/nss/file/tip/lib/freebl/blinit.c#l100
> 
> and only if <sys/auxv.h> is present then they probe with getauxval() to 
> check which HWCAP_ is present, otherwise they consider(i.e.) 
> arm_neon_support not present, that is not true in any case. But at the 
> time of this writing they seem to consider this enough, probably they 
> will improve it later.

OK, if this is indeed used on other architectures, then I guess doing
the same on PowerPC doesn't hurt. Thanks for the additional explanation!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
