From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 13 Jan 2018 12:07:13 +0100
Subject: [Buildroot] [v2 1/1] merge_config.sh: add br2-external support
In-Reply-To: <1515497863-13204-1-git-send-email-ilya.kuzmich@gmail.com>
References: <20171230175829.GH2921@scaer>
 <1515497863-13204-1-git-send-email-ilya.kuzmich@gmail.com>
Message-ID: <20180113110713.GD3226@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ilya, All,

On 2018-01-09 14:37 +0300, Ilya Kuzmich spake thusly:
> Pass BR2_EXTERNAL value via -e option.
> This will prevent merge_config.sh from silently eating any symbols defined in
> external trees on a clean buildroot tree invocation.
> 
> Signed-off-by: Ilya Kuzmich <ilya.kuzmich@gmail.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2:
> Simplifications
> 
> Signed-off-by: Ilya Kuzmich <ilya.kuzmich@gmail.com>
> ---
>  support/kconfig/merge_config.sh | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/support/kconfig/merge_config.sh b/support/kconfig/merge_config.sh
> index 8a1708b..e1d7ffa 100755
> --- a/support/kconfig/merge_config.sh
> +++ b/support/kconfig/merge_config.sh
> @@ -33,6 +33,7 @@ usage() {
>  	echo "  -n    use allnoconfig instead of alldefconfig"
>  	echo "  -r    list redundant entries when merging fragments"
>  	echo "  -O    dir to put generated output files"
> +	echo "  -e    colon-separated list of br2-external trees to use (optional)"
>  }
>  
>  MAKE=true
> @@ -71,6 +72,11 @@ while true; do
>  		shift 2
>  		continue
>  		;;
> +	"-e")
> +		EXTERNAL_ARG="BR2_EXTERNAL=$2"
> +		shift 2
> +		continue
> +		;;
>  	*)
>  		break
>  		;;
> @@ -131,7 +137,7 @@ fi
>  # Use the merged file as the starting point for:
>  # alldefconfig: Fills in any missing symbols with Kconfig default
>  # allnoconfig: Fills in any missing symbols with # CONFIG_* is not set
> -make KCONFIG_ALLCONFIG=$TMP_FILE $OUTPUT_ARG $ALLTARGET
> +make KCONFIG_ALLCONFIG=$TMP_FILE $EXTERNAL_ARG $OUTPUT_ARG $ALLTARGET
>  
>  
>  # Check all specified config values took (might have missed-dependency issues)
> -- 
> 2.7.4
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
