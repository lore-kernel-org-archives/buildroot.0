From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Dec 2018 09:04:11 +0100
Subject: [Buildroot] Cross compiling kernel module for the target
In-Reply-To: <CA+OsCCTCqQ+Fne+=VtXKgi5E_ezkdTAva-zTk6KaWa9egem0Sg@mail.gmail.com>
References: <CA+OsCCTCqQ+Fne+=VtXKgi5E_ezkdTAva-zTk6KaWa9egem0Sg@mail.gmail.com>
Message-ID: <20181220090411.7ab00f70@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 20 Dec 2018 08:39:26 +0100, ?ukasz Przenios?o wrote:

> obj-m	:= simp.o
> KERNELDIR ?= /home/lukasz/brl/Machine/beaglebone/build/linux-headers-a75d8e93056181d512f6c818e8627bd4554aaf92

This should point to output/build/linux-<version>/ and not
output/build/linux-headers-<version>/.

>   CC [M]  /tmp/test/simp.o
> In file included from <command-line>:0:0:
> ././include/linux/kconfig.h:4:32: fatal error: generated/autoconf.h:
> No such file or directory
>  #include <generated/autoconf.h>

As explained above, this is because you're using the linux-headers
source, which is not "configured" (i.e no kernel configuration has been
applied to it), and building a kernel module requires a configured
source tree.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
