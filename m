From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Jul 2021 23:16:06 +0200
Subject: [Buildroot] [PATCH 2/4] stm32mp157c_dk2: add non-trusted
 configuration
In-Reply-To: <20210701210006.1171347-3-geomatsi@gmail.com>
References: <20210701210006.1171347-1-geomatsi@gmail.com>
 <20210701210006.1171347-3-geomatsi@gmail.com>
Message-ID: <20210703231606.7afe27a0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  2 Jul 2021 00:00:04 +0300
Sergey Matyukevich <geomatsi@gmail.com> wrote:

> The stm32mp157 supports two different boot chains. Trusted boot chain uses
> TF-A firmare as FSBL and U-Boot as SSBL. Basic boot chain uses U-Boot SPL
> as FSBL and U-Boot as SSBL. Available stm32mp157c_dk2_defconfig provides
> image with trusted boot chain. This commit renames existing defconfig and
> adds another defconfig for basic boot chain. Genimage template and
> post-image script are modified to use appropriate FSBL and SSBL
> to support both build configurations.

Could you comment on the motivation to also support the non-trusted
boot chain? ST is no longer supporting the non-trusted configuration.
Of course, while we don't have to strictly follow vendor-defined
rules/decision, there's the question of what is the benefit of the
non-trusted version, and if it's worth the effort having support for
both configurations as Buildroot defconfigs.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
