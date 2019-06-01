From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Jun 2019 22:37:35 +0200
Subject: [Buildroot] [PATCH 2/2] arch/arc: arc7x0 always needs -matomic
In-Reply-To: <16241cb355b045ba585ba806f0f4c829f5aea9f8.1559421222.git.yann.morin.1998@free.fr>
References: <cover.1559421222.git.yann.morin.1998@free.fr>
 <16241cb355b045ba585ba806f0f4c829f5aea9f8.1559421222.git.yann.morin.1998@free.fr>
Message-ID: <20190601223735.4057b840@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  1 Jun 2019 22:33:51 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> diff --git a/arch/arch.mk.arc b/arch/arch.mk.arc
> new file mode 100644
> index 0000000000..d324e5c1e1
> --- /dev/null
> +++ b/arch/arch.mk.arc
> @@ -0,0 +1,4 @@
> +# ARC7x0 needs -matomic, always
> +ifeq ($(BR2_arc750d)$(BR2_arc770d),y)
> +ARCH_TOOLCHAIN_WRAPPER_OPTS = -matomic
> +endif

So can we drop 

TARGET_ABI += -matomic

from package/Makefile.in ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
