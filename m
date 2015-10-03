From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Sat, 3 Oct 2015 13:33:07 +0100
Subject: [Buildroot] [PATCH 2/2] dhcpcd: move libexecdir
In-Reply-To: <1443868098-15805-2-git-send-email-gustavo@zacarias.com.ar>
References: <1443868098-15805-1-git-send-email-gustavo@zacarias.com.ar>
 <1443868098-15805-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <560FCB03.9030306@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On 03/10/15 11:28, Gustavo Zacarias wrote:
> The default is $PREFIX/libexec which ends up in an ugly and non-standard
> /libexec dir in the target.
> Move it to $PREFIX/lib/dhcpcd which is far more nicer and suitable.
>
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

It does install the libexec files into that directory:

$ find output/target/lib/dhcpcd/
output/target/lib/dhcpcd/
output/target/lib/dhcpcd/dhcpcd-run-hooks
output/target/lib/dhcpcd/dhcpcd-hooks
output/target/lib/dhcpcd/dhcpcd-hooks/50-yp.conf
output/target/lib/dhcpcd/dhcpcd-hooks/10-wpa_supplicant
output/target/lib/dhcpcd/dhcpcd-hooks/02-dump
output/target/lib/dhcpcd/dhcpcd-hooks/15-timezone
output/target/lib/dhcpcd/dhcpcd-hooks/01-test
output/target/lib/dhcpcd/dhcpcd-hooks/20-resolv.conf
output/target/lib/dhcpcd/dhcpcd-hooks/50-ntp.conf
output/target/lib/dhcpcd/dhcpcd-hooks/29-lookup-hostname
output/target/lib/dhcpcd/dhcpcd-hooks/30-hostname

Regards,

Vincent.

> ---
>   package/dhcpcd/dhcpcd.mk | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
> index de169b5..66928e2 100644
> --- a/package/dhcpcd/dhcpcd.mk
> +++ b/package/dhcpcd/dhcpcd.mk
> @@ -23,6 +23,7 @@ define DHCPCD_CONFIGURE_CMDS
>   	(cd $(@D); \
>   	$(TARGET_CONFIGURE_OPTS) ./configure \
>   		--os=linux \
> +		--libexecdir=/lib/dhcpcd \
>   		$(DHCPCD_CONFIG_OPTS) )
>   endef
>
>
