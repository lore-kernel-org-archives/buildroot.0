From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Sat, 12 Sep 2015 10:25:45 +0100
Subject: [Buildroot] [PATCH] mdadm: bump to version 3.3.4
In-Reply-To: <1442004768-26732-1-git-send-email-gustavo@zacarias.com.ar>
References: <1442004768-26732-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <55F3EF99.7020407@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On 11/09/15 21:52, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Build test for MIPS architecture.

$ grep ^MDADM_VERSION package/mdadm/mdadm.mk
MDADM_VERSION = 3.3.4

$ file output/target/usr/sbin/mdadm
output/target/usr/sbin/mdadm: ELF 32-bit MSB executable, MIPS, MIPS32 
rel2 version 1 (SYSV), dynamically linked (uses shared libs), for 
GNU/Linux 2.6.32, with unknown capability 0x41000000 = 0xf676e75, with 
unknown capability 0x10000 = 0x70403, stripped

Regards,

Vincent.

> ---
>   package/mdadm/mdadm.hash | 2 +-
>   package/mdadm/mdadm.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/mdadm/mdadm.hash b/package/mdadm/mdadm.hash
> index 45b79dd..7f228d9 100644
> --- a/package/mdadm/mdadm.hash
> +++ b/package/mdadm/mdadm.hash
> @@ -1,2 +1,2 @@
>   # From https://www.kernel.org/pub/linux/utils/raid/mdadm/sha256sums.asc
> -sha256	0f3a7e1a76b13892b79f9fceaf99ecb23513260389a768ac644ffa3ae06e5b8c	mdadm-3.3.2.tar.xz
> +sha256	8ae5f45306b873190e91f410709b00e51997b633c072b33f8efd9f7df022ca68	mdadm-3.3.4.tar.xz
> diff --git a/package/mdadm/mdadm.mk b/package/mdadm/mdadm.mk
> index 88f358f..7558c18 100644
> --- a/package/mdadm/mdadm.mk
> +++ b/package/mdadm/mdadm.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>
> -MDADM_VERSION = 3.3.2
> +MDADM_VERSION = 3.3.4
>   MDADM_SOURCE = mdadm-$(MDADM_VERSION).tar.xz
>   MDADM_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/raid/mdadm
>   MDADM_LICENSE = GPLv2+
>
