From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 7 Nov 2014 13:42:32 +0000
Subject: [Buildroot] [PATCH 3/7] dhcpcd: install binary to /sbin
In-Reply-To: <1415281013-1077-4-git-send-email-gustavo@zacarias.com.ar>
References: <1415281013-1077-1-git-send-email-gustavo@zacarias.com.ar>
 <1415281013-1077-4-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <545CCC48.9070106@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On 11/06/2014 01:36 PM, Gustavo Zacarias wrote:
> Debian ifupdown expects dhcpcd to be in /sbin rather than /usr/sbin
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/dhcpcd/dhcpcd.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
> index f4b821a..60ac129 100644
> --- a/package/dhcpcd/dhcpcd.mk
> +++ b/package/dhcpcd/dhcpcd.mk
> @@ -37,7 +37,7 @@ endef
>  
>  define DHCPCD_INSTALL_TARGET_CMDS
>  	$(INSTALL) -D -m 0755 $(@D)/dhcpcd \
> -		$(TARGET_DIR)/usr/sbin/dhcpcd
> +		$(TARGET_DIR)/sbin/dhcpcd
>  	$(INSTALL) -D -m 0644 $(@D)/dhcpcd.conf \
>  		$(TARGET_DIR)/etc/dhcpcd.conf
>  	$(INSTALL) -D -m 0755 $(@D)/dhcpcd-run-hooks \
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
