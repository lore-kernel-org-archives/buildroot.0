From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 6 Nov 2019 22:51:25 +0100
Subject: [Buildroot] [PATCH] package/elf2flt: .ARM.exidx RO data section
 is incorrectly mapped to data
In-Reply-To: <20191106211913.21256-1-romain.naour@smile.fr>
References: <20191106211913.21256-1-romain.naour@smile.fr>
Message-ID: <20191106225125.7be919ad@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed,  6 Nov 2019 22:19:13 +0100
Romain Naour <romain.naour@smile.fr> wrote:

> Starting with Binutils 2.33.1, elf2flt segfault while building busybox:
> "ld (ld-elf2flt):
> /opt/armv7m--uclibc--bleeding-edge-2/arm-buildroot-uclinux-uclibcgnueabi/bin/elf2flt
> 
> This was reported to the Binutils mailing list and it's seems
> an elf2flt issue with .ARM.exidx RO data section as explained
> by: https://sourceware.org/ml/binutils/2019-10/msg00132.html
> 
> Apply the patch provided by Greg Ungerer [1] and tested by
> Christophe Priouzeau using stm32f469_disco_defconfig on
> stm32f469-disco board.
> 
> Fixes:
> https://gitlab.com/kubu93/toolchains-builder/-/jobs/319395300
> 
> [1] https://github.com/uclinux-dev/elf2flt/issues/12
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Cc: Christophe Priouzeau <christophe.priouzeau@st.com>

Thanks a lot for this patch! Good to see that some people are active
maintaining elf2flt.

While you're in touch with people with elf2flt knowledge, could you
have a look at
http://lists.busybox.net/pipermail/buildroot/2019-June/253203.html ?
I'm pretty sure for someone with ARM/elf2flt knowledge it's fairly easy
to fix.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
