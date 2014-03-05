From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 5 Mar 2014 18:08:49 +0100
Subject: [Buildroot] [PATCH] support: fix typo in mkusers
In-Reply-To: <1394013881-34422-1-git-send-email-philip@paeps.cx>
References: <1394013881-34422-1-git-send-email-philip@paeps.cx>
Message-ID: <20140305170849.GB5066@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Philip, All,

On 2014-03-05 11:04 +0100, Philip Paeps spake thusly:
> This fixes the spurious "[: too many arguments" errors from mkusers.
> 
> Signed-off-by: Philip Paeps <philip@paeps.cx>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  support/scripts/mkusers |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/scripts/mkusers b/support/scripts/mkusers
> index a67356a..90d1df7 100755
> --- a/support/scripts/mkusers
> +++ b/support/scripts/mkusers
> @@ -63,7 +63,7 @@ get_uid() {
>  get_ugid() {
>      local username="${1}"
>  
> -    awk -F:i -v username="${username}"                          \
> +    awk -F: -v username="${username}"                          \
>          '$1 == username { printf( "%d\n", $4 ); }' "${PASSWD}"
>  }
>  
> -- 
> 1.7.10.4
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
