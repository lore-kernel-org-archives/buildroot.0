From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 9 Oct 2015 12:02:33 +0100
Subject: [Buildroot] [PATCH] ethtool: bump to version 4.2
In-Reply-To: <1444387953-12850-1-git-send-email-gustavo@zacarias.com.ar>
References: <1444387953-12850-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <56179EC9.9030209@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On 10/09/2015 11:52 AM, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Build test for MIPS architecture:

$ grep ^ETHTOOL_VERSION package/ethtool/ethtool.mk
ETHTOOL_VERSION = 4.2

$ file output/target/usr/sbin/ethtool
output/target/usr/sbin/ethtool: ELF 32-bit MSB executable, MIPS, MIPS32
rel2 version 1, dynamically linked (uses shared libs), for GNU/Linux
2.6.32, with unknown capability 0x41000000 = 0xf676e75, with unknown
capability 0x10000 = 0x70401, not stripped

Regards,

Vincent.

> ---
>  package/ethtool/ethtool.hash | 2 +-
>  package/ethtool/ethtool.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/ethtool/ethtool.hash b/package/ethtool/ethtool.hash
> index 5fde687..53f31d0 100644
> --- a/package/ethtool/ethtool.hash
> +++ b/package/ethtool/ethtool.hash
> @@ -1,2 +1,2 @@
>  # From https://www.kernel.org/pub/software/network/ethtool/sha256sums.asc
> -sha256	904887acc7d2f9c35dec04eb0e8a727a3205f346af4f4c95560ea3798de5ecff	ethtool-4.0.tar.xz
> +sha256	8cb854bcf71ef8b484b5d2a0e6bf056ae1fbf12cfb19e4907b74b7b21da91e87	ethtool-4.2.tar.xz
> diff --git a/package/ethtool/ethtool.mk b/package/ethtool/ethtool.mk
> index c358c62..c56eeb9 100644
> --- a/package/ethtool/ethtool.mk
> +++ b/package/ethtool/ethtool.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -ETHTOOL_VERSION = 4.0
> +ETHTOOL_VERSION = 4.2
>  ETHTOOL_SOURCE = ethtool-$(ETHTOOL_VERSION).tar.xz
>  ETHTOOL_SITE = $(BR2_KERNEL_MIRROR)/software/network/ethtool
>  ETHTOOL_LICENSE = GPLv2
> 
