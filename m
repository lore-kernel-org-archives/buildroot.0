From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 23 Nov 2018 22:15:14 +0100
Subject: [Buildroot] [PATCH v4 2/3] test-pkg: Use the correct config
 prefix when merging
In-Reply-To: <20181114074605.13390-1-afshin.nasser@gmail.com>
References: <20181114074605.13390-1-afshin.nasser@gmail.com>
Message-ID: <20181123211514.GF14050@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Nasser, All,

On 2018-11-14 11:16 +0330, Nasser Afshin spake thusly:
> From: Nasser Afshin <Afshin.Nasser@gmail.com>
> 
> We should use an empty prefix as we do not have any prefix.
> Note that BR2_ is mere a convention.
> 
> Signed-off-by: Nasser Afshin <Afshin.Nasser@gmail.com>
> Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  utils/test-pkg | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/utils/test-pkg b/utils/test-pkg
> index aa91ee02cf..e4f68ed061 100755
> --- a/utils/test-pkg
> +++ b/utils/test-pkg
> @@ -129,7 +129,7 @@ build_one() {
>  
>      mkdir -p "${dir}"
>  
> -    support/kconfig/merge_config.sh -O "${dir}" \
> +    CONFIG_= support/kconfig/merge_config.sh -O "${dir}" \
>          "${toolchainconfig}" "support/config-fragments/minimal.config" "${cfg}" \
>          >> "${dir}/logfile" 2>&1
>      # We want all the options from the snippet to be present as-is (set
> -- 
> 2.15.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
