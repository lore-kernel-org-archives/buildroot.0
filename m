From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Jul 2018 16:30:32 +0200
Subject: [Buildroot] [PATCH v2,1/1] wampcc: needs atomic
In-Reply-To: <20180710182740.10902-1-fontaine.fabrice@gmail.com>
References: <20180710182740.10902-1-fontaine.fabrice@gmail.com>
Message-ID: <20180716163032.2dac789d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 10 Jul 2018 20:27:40 +0200, Fabrice Fontaine wrote:
> Fixes:
>  - http://autobuild.buildroot.net/results/2f994762d4e01a904c50cf2728a4103e6e79da2a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Thomas Petazzoni):
>  - Add BR2_TOOLCHAIN_HAS_ATOMIC in Config.in

Applied to master, thanks. I believe there's probably quite a few
packages that link with -latomic if BR2_TOOLCHAIN_HAS_LIBATOMIC=y, but
don't depend on BR2_TOOLCHAIN_HAS_ATOMIC. However, it's not as simple
as adding "depends on BR2_TOOLCHAIN_HAS_ATOMIC" to all packages that
link with -latomic, because some packages can use either __sync or
__atomic built-ins.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
