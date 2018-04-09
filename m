From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 9 Apr 2018 11:26:55 +0200
Subject: [Buildroot] [PATCH 1/2] gcc: fix
 HOST_GCC_COMMON_WRAPPER_TARGET_FLOAT_ABI typos
In-Reply-To: <20180404155451.15258-1-thomas.petazzoni@bootlin.com>
References: <20180404155451.15258-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180409112655.23b03770@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  4 Apr 2018 17:54:50 +0200, Thomas Petazzoni wrote:
> The HOST_GCC_COMMON_WRAPPER_TARGET_FLOAT_ABI variable was incorrectly
> used as HOST_GCC_COMMON_WRAPPER_TARGET_FLOATABI_, which would always
> be empty.
> 
> In practice, this block of code is only used on Blackfin (which has
> BR2_GCC_ARCH_HAS_CONFIGURABLE_DEFAULTS unset) and Blackfin doesn't use
> float-abi, so this block of code is in fact useless. But even if it's
> useless, it's better to have it without typos.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/gcc/gcc.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Both patches applied.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
