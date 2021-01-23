From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 23 Jan 2021 21:27:46 +0100
Subject: [Buildroot] [PATCH] linux: add support for Image.gz kernel
 format
In-Reply-To: <20210122103949.8867-1-peter@korsgaard.com>
References: <20210122103949.8867-1-peter@korsgaard.com>
Message-ID: <20210123212746.3fb6ec19@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 22 Jan 2021 11:39:49 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

> arm64 / riscv supports building a gzip compressed 'Image' format kernel,
> which is sometimes useful. From arch/arm64/Makefile:
> 
> all:	Image.gz
> 
> Image: vmlinux
> 	$(Q)$(MAKE) $(build)=$(boot) $(boot)/$@
> 
> Image.%: Image
> 	$(Q)$(MAKE) $(build)=$(boot) $(boot)/$@
> 
> (and similar logic for riscv)
> 
> Future architectures may or may not copy this logic, so for robustness add
> an explicit Image.gz format rather than copying both Image and Image.gz when
> the Image format is used.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  linux/Config.in | 4 ++++
>  linux/linux.mk  | 2 ++
>  2 files changed, 6 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
