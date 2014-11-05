From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 5 Nov 2014 12:08:08 +0000
Subject: [Buildroot] [PATCH] iproute2: bump to version 3.17.0
In-Reply-To: <1415185832-9621-1-git-send-email-gustavo@zacarias.com.ar>
References: <1415185832-9621-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <545A1328.4010108@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On 11/05/2014 11:10 AM, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/iproute2/iproute2.hash | 2 +-
>  package/iproute2/iproute2.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/iproute2/iproute2.hash b/package/iproute2/iproute2.hash
> index 5a8e6ca..3aecbfc 100644
> --- a/package/iproute2/iproute2.hash
> +++ b/package/iproute2/iproute2.hash
> @@ -1,2 +1,2 @@
>  # From https://kernel.org/pub/linux/utils/net/iproute2/sha256sums.asc
> -sha256	1f0a8a6c0e872166f75433f5cbf9766f3002b5c2f13501b3bb8c51846a127b79	iproute2-3.16.0.tar.xz
> +sha256	09e406636e7598e46d5d4f7b928bf5db57049d65dbeb9a496005957ee16f6000	iproute2-3.17.0.tar.xz
> diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
> index 17c3c36..a6ab445 100644
> --- a/package/iproute2/iproute2.mk
> +++ b/package/iproute2/iproute2.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -IPROUTE2_VERSION = 3.16.0
> +IPROUTE2_VERSION = 3.17.0
>  IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
>  IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
>  IPROUTE2_DEPENDENCIES = host-bison host-flex
> 

Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Compile-test on MIPS architecture plus checking the files are actually
installed in target and were built for the right architecture.

$ file output/target/sbin/ip
output/target/sbin/ip: ELF 32-bit MSB executable, MIPS, MIPS32 rel2
version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Linux
2.6.16, with unknown capability 0x41000000 = 0xf676e75, with unknown
capability 0x10000 = 0x70401, stripped

Best regards,
-- 
Vicente Olivert Riera
Graduate Software Engineer, MIPS Processor IP
Imagination Technologies Limited
t: +44 (0)113 2429814
www.imgtec.com
