From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 3 Apr 2019 22:32:35 +0200
Subject: [Buildroot] [PATCH] package/uboot-tools: fix
 CONFIG_FIT_SIGNATURE_MAX_SIZE build failure
In-Reply-To: <20190331202029.97561-1-giulio.benetti@micronovasrl.com>
References: <20190331202029.97561-1-giulio.benetti@micronovasrl.com>
Message-ID: <20190403223235.7d04da12@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 31 Mar 2019 22:20:29 +0200
Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:

> When CONFIG_FIT_SIGNATURE is enabled for building,
> CONFIG_FIT_SIGNATURE_MAX_SIZE must be defined since it's a dependency of
> CONFIG_FIT_SIGNATURE. Using uboot Kconfig, CONFIG_GIT_SIGNATURE_MAX_SIZE
> is set to its default(0x10000000) according to Kconfig, but Buildroot
> doesn't use uboot Kconfig, it passes directly CONFIG_* as make
> arguments.
> 
> Append CONFIG_FIT_SIGNATURE_MAX_SIZE=0x10000000 after
> CONFIG_FIT_SIGNATURE=y to UBOOT_TOOLS_MAKE_OPTS and
> HOST_UBOOT_TOOLS_MAKE_OPTS.
> 
> Fixes:
> http://autobuild.buildroot.net/results/612/6126848e08d9273911e7d5b0151847aa2293ed87/
> http://autobuild.buildroot.net/results/b49/b49ae4977b605ed24783161618f383551f1662b8/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
>  package/uboot-tools/uboot-tools.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks. Long term I think we should try to use the
Kconfig stuff even for uboot-tools, but for a short term solution, your
patch is fine.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
