From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 7 Dec 2018 18:35:22 +0100
Subject: [Buildroot] [PATCH] dl-wrapper: Fix urlencode option never
 being sent to backend
In-Reply-To: <b97d7c67314b9312d4a79aa1a40ec4bd55ed61ff.camel@vitec.com>
References: <b97d7c67314b9312d4a79aa1a40ec4bd55ed61ff.camel@vitec.com>
Message-ID: <20181207173522.GH2561@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Damien, All,

On 2018-12-07 12:41 +0000, Damien Th?bault spake thusly:
> The urlencode parameter is lost in dl-wrapper, because we try to get it
> from backend instead of backend_urlencode.
> 
> We must get the urlencode information from backend_urlencode.

What is this trying to fix, actually? We have no download issue in the
autobuilders, as far as I can see... Do you have a test-case to share?

But true, this is incorrect, and was broken by commit 38de434123
(download: fix file:// BR2_PRIMARY_SITE (download cache)).

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> Signed-off-by: Damien Th?bault <damien.thebault@vitec.com>
> ---
>  support/download/dl-wrapper | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
> index bb70c98253..3315bd410e 100755
> --- a/support/download/dl-wrapper
> +++ b/support/download/dl-wrapper
> @@ -93,7 +93,7 @@ main() {
>          esac
>          uri=${uri#*+}
>  
> -        urlencode=${backend#*|}
> +        urlencode=${backend_urlencode#*|}
>          # urlencode must be "urlencode"
>          [ "${urlencode}" != "urlencode" ] && urlencode=""
>  
> -- 
> 2.19.1
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
