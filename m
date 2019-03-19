From: Mark Corbin <mark.corbin@embecosm.com>
Date: Tue, 19 Mar 2019 11:54:13 +0000
Subject: [Buildroot] [PATCH v3 2/3] boot/opensbi: Initial commit of
 OpenSBI for RISC-V
In-Reply-To: <20190318224309.11805-2-alistair.francis@wdc.com>
References: <20190318224309.11805-1-alistair.francis@wdc.com>
 <20190318224309.11805-2-alistair.francis@wdc.com>
Message-ID: <ce95dc40-f08b-b1f8-7d0b-cbcd6db7e0d1@embecosm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Alistair

On 18/03/2019 22:44, Alistair Francis wrote:
> diff --git a/boot/opensbi/opensbi.mk b/boot/opensbi/opensbi.mk
> new file mode 100644
> index 0000000000..87e4b5c455
> --- /dev/null
> +++ b/boot/opensbi/opensbi.mk
> @@ -0,0 +1,32 @@
> +################################################################################
> +#
> +# OpenSBI
> +#
> +################################################################################
> +
> +OPENSBI_VERSION = ca20ac0cd4c099006d4eea4d9ac7bd7b58e2ae0f
> +OPENSBI_SITE = git://github.com/riscv/opensbi.git
It makes things clearer for me if you use the v0.3 tag here instead of
the commit hash for v0.3.


OPENSBI_VERSION = v0.3
OPENSBI_SITE = $(call github,riscv,opensbi,$(OPENSBI_VERSION))

Regards

Mark

-- 
Mark Corbin
Embecosm Ltd.
https://www.embecosm.com
