From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Dec 2017 22:42:47 +0100
Subject: [Buildroot] [PATCH v2 branch/next] uboot-tools: fix dtc
 invocation
In-Reply-To: <20171201124020.4475-1-yegorslists@googlemail.com>
References: <20171201124020.4475-1-yegorslists@googlemail.com>
Message-ID: <20171201224247.7ac76c44@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  1 Dec 2017 13:40:20 +0100, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Since uboot 2017.09 path to dtc will be configured via Kconfig. As BR
> skips this step for uboot-tools building one has to provide
> CONFIG_MKIMAGE_DTC_PATH=dtc on the build command line. Otherwise
> mkimage will not be able to create FIT images, i.e.:
> 
> mkimage -f kernel-fit.its kernel-fit.itb
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
> Changes v1 -> v2:
>   - pass CONFIG_MKIMAGE_DTC_PATH=dtc on the build command line
>     instead of patching the Makefile (suggested by Thomas Petazzoni)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
