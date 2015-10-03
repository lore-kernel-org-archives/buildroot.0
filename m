From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Sat, 3 Oct 2015 13:24:37 +0100
Subject: [Buildroot] [PATCH 1/2] dhcpcd: bump to version 6.9.3
In-Reply-To: <1443868098-15805-1-git-send-email-gustavo@zacarias.com.ar>
References: <1443868098-15805-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <560FC905.2090107@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On 03/10/15 11:28, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Build test for MIPS architecture:

$ grep ^DHCPCD_VERSION package/dhcpcd/dhcpcd.mk
DHCPCD_VERSION = 6.9.3

$ file output/target/sbin/dhcpcd
output/target/sbin/dhcpcd: ELF 32-bit MSB executable, MIPS, MIPS32 rel2 
version 1, dynamically linked (uses shared libs), for GNU/Linux 2.6.32, 
with unknown capability 0x41000000 = 0xf676e75, with unknown capability 
0x10000 = 0x70401, not stripped

Regards,

Vincent.

> ---
>   package/dhcpcd/dhcpcd.hash | 2 +-
>   package/dhcpcd/dhcpcd.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/dhcpcd/dhcpcd.hash b/package/dhcpcd/dhcpcd.hash
> index 98351a2..71d0e28 100644
> --- a/package/dhcpcd/dhcpcd.hash
> +++ b/package/dhcpcd/dhcpcd.hash
> @@ -1,2 +1,2 @@
>   # Locally calculated from download (no sig, hash)
> -sha256	c03b750e1fe2890b62ac0e7d7092a1698b598adb6f88b67916586a619f7c066f	dhcpcd-6.9.1.tar.xz
> +sha256	6089471ed695fa62ac8351466b96b4b6365fd14ec455a120a6524663808eae53	dhcpcd-6.9.3.tar.xz
> diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
> index 67ae69f..de169b5 100644
> --- a/package/dhcpcd/dhcpcd.mk
> +++ b/package/dhcpcd/dhcpcd.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>
> -DHCPCD_VERSION = 6.9.1
> +DHCPCD_VERSION = 6.9.3
>   DHCPCD_SOURCE = dhcpcd-$(DHCPCD_VERSION).tar.xz
>   DHCPCD_SITE = http://roy.marples.name/downloads/dhcpcd
>   DHCPCD_DEPENDENCIES = host-pkgconf
>
