From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 5 Nov 2014 12:08:53 +0000
Subject: [Buildroot] [PATCH] btrfs-progs: bump to version 3.17.1
In-Reply-To: <1415185854-9663-1-git-send-email-gustavo@zacarias.com.ar>
References: <1415185854-9663-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <545A1355.4060007@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On 11/05/2014 11:10 AM, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/btrfs-progs/btrfs-progs.hash | 2 +-
>  package/btrfs-progs/btrfs-progs.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/btrfs-progs/btrfs-progs.hash b/package/btrfs-progs/btrfs-progs.hash
> index 497f142..0f207b2 100644
> --- a/package/btrfs-progs/btrfs-progs.hash
> +++ b/package/btrfs-progs/btrfs-progs.hash
> @@ -1,2 +1,2 @@
>  # From https://www.kernel.org/pub/linux/kernel/people/kdave/btrfs-progs/sha256sums.asc
> -sha256	ecafbf71e729c7e907dac488c2e0c94983dd38420f56dce85e2a4310a06bf0a0	btrfs-progs-v3.17.tar.xz
> +sha256	6c01579c7b858c175aaed6b3b087dadaa38efb8e590a6928f1afe86bb8faaaab	btrfs-progs-v3.17.1.tar.xz
> diff --git a/package/btrfs-progs/btrfs-progs.mk b/package/btrfs-progs/btrfs-progs.mk
> index 67d2e37..d16fa0d 100644
> --- a/package/btrfs-progs/btrfs-progs.mk
> +++ b/package/btrfs-progs/btrfs-progs.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -BTRFS_PROGS_VERSION = 3.17
> +BTRFS_PROGS_VERSION = 3.17.1
>  BTRFS_PROGS_SITE = https://www.kernel.org/pub/linux/kernel/people/kdave/btrfs-progs
>  BTRFS_PROGS_SOURCE = btrfs-progs-v$(BTRFS_PROGS_VERSION).tar.xz
>  BTRFS_PROGS_DEPENDENCIES = acl attr e2fsprogs lzo util-linux zlib
> 

Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Compile-test on MIPS architecture plus checking the files are actually
installed in target and were built for the right architecture.

$ file output/target/usr/bin/btrfs
output/target/usr/bin/btrfs: ELF 32-bit MSB executable, MIPS, MIPS32
rel2 version 1 (SYSV), dynamically linked (uses shared libs), for
GNU/Linux 2.6.16, with unknown capability 0x41000000 = 0xf676e75, with
unknown capability 0x10000 = 0x70401, stripped

Best regards,
-- 
Vicente Olivert Riera
Graduate Software Engineer, MIPS Processor IP
Imagination Technologies Limited
t: +44 (0)113 2429814
www.imgtec.com
