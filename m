From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 14 Aug 2015 00:40:50 +0200
Subject: [Buildroot] [PATCH] kconfig: support read-only Buildroot source
 directories
In-Reply-To: <1439504572-20085-1-git-send-email-hollis_blanchard@mentor.com>
References: <1439504572-20085-1-git-send-email-hollis_blanchard@mentor.com>
Message-ID: <20150813224050.GE3522@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hollis, All,

On 2015-08-13 15:22 -0700, Hollis Blanchard spake thusly:
> merge_config.sh currently tries to create a .tmp file in the top-level
> Buildroot source tree. This fails when that directory is read-only, leading
> to unexpected .config file contents (affecting the configuration of Buildroot
> itself, Linux, and Busybox).
> 
> Fix it by using mktemp --tmpdir to create the .tmp file in $TMPDIR or /tmp.
> 
> Signed-off-by: Hollis Blanchard <hollis_blanchard@mentor.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  support/kconfig/merge_config.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/kconfig/merge_config.sh b/support/kconfig/merge_config.sh
> index 81b0c61..19d968b 100755
> --- a/support/kconfig/merge_config.sh
> +++ b/support/kconfig/merge_config.sh
> @@ -82,7 +82,7 @@ shift;
>  
>  MERGE_LIST=$*
>  SED_CONFIG_EXP="s/^\(# \)\{0,1\}\(CONFIG_[a-zA-Z0-9_]*\)[= ].*/\2/p"
> -TMP_FILE=$(mktemp ./.tmp.config.XXXXXXXXXX)
> +TMP_FILE=$(mktemp --tmpdir .tmp.config.XXXXXXXXXX)
>  
>  echo "Using $INITFILE as base"
>  cat $INITFILE > $TMP_FILE
> -- 
> 2.3.2
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
