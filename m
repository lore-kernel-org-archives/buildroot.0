From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 7 Nov 2014 13:42:49 +0000
Subject: [Buildroot] [PATCH 4/7] dhcpcd: bump to version 6.6.0
In-Reply-To: <1415281013-1077-5-git-send-email-gustavo@zacarias.com.ar>
References: <1415281013-1077-1-git-send-email-gustavo@zacarias.com.ar>
 <1415281013-1077-5-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <545CCC59.4000805@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On 11/06/2014 01:36 PM, Gustavo Zacarias wrote:
> Also add hash file.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/dhcpcd/dhcpcd.hash | 2 ++
>  package/dhcpcd/dhcpcd.mk   | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)
>  create mode 100644 package/dhcpcd/dhcpcd.hash
> 
> diff --git a/package/dhcpcd/dhcpcd.hash b/package/dhcpcd/dhcpcd.hash
> new file mode 100644
> index 0000000..fd64ebe
> --- /dev/null
> +++ b/package/dhcpcd/dhcpcd.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated from download (no sig, hash)
> +sha256	16b94272cbb9ca22cb74c4421ee745f56850121613f6256587adb4e988c17fd0	dhcpcd-6.6.0.tar.bz2
> diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
> index 60ac129..fe3c8d2 100644
> --- a/package/dhcpcd/dhcpcd.mk
> +++ b/package/dhcpcd/dhcpcd.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -DHCPCD_VERSION = 6.4.7
> +DHCPCD_VERSION = 6.6.0
>  DHCPCD_SOURCE = dhcpcd-$(DHCPCD_VERSION).tar.bz2
>  DHCPCD_SITE = http://roy.marples.name/downloads/dhcpcd
>  DHCPCD_DEPENDENCIES = host-pkgconf
> 

Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Compile test on MIPS architecture plus checking the files are installed
in target and have been built for the right architecture:

$ file output/target/sbin/dhcpcd
output/target/sbin/dhcpcd: ELF 32-bit MSB executable, MIPS, MIPS32 rel2
version 1 (SYSV), dynamically linked (uses shared libs), for GNU/Linux
2.6.16, with unknown capability 0x41000000 = 0xf676e75, with unknown
capability 0x10000 = 0x70403, stripped

Best regards,
-- 
Vicente Olivert Riera
Graduate Software Engineer, MIPS Processor IP
Imagination Technologies Limited
t: +44 (0)113 2429814
www.imgtec.com
