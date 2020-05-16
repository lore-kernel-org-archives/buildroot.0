From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 May 2020 18:26:24 +0200
Subject: [Buildroot] [PATCH 1/1] package/libssh2: fix autoreconf comment
In-Reply-To: <20200516161140.21831-1-danomimanchego123@gmail.com>
References: <20200516161140.21831-1-danomimanchego123@gmail.com>
Message-ID: <20200516162624.GO12536@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Danomi, All,

On 2020-05-16 12:11 -0400, Danomi Manchego spake thusly:
> The comment explaining the autoreconf says that we are building from a git
> clone - but we are not, currently.  However, the reconf is still needed due
> to patches modifying ac files.
> 
> This commit corrects the comment.
> 
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
> ---
>  package/libssh2/libssh2.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libssh2/libssh2.mk b/package/libssh2/libssh2.mk
> index 3819c1a..2d2599f 100644
> --- a/package/libssh2/libssh2.mk
> +++ b/package/libssh2/libssh2.mk
> @@ -14,7 +14,7 @@ LIBSSH2_CONF_OPTS = --disable-examples-build
>  # 0003-packet-c-improve-message-parsing.patch
>  LIBSSH2_IGNORE_CVES += CVE-2019-17498
>  
> -# building from a git clone
> +# patch touching configure.ac

... and acincludes.m4.

Applied to master with that fixed. thanks!

Regards,
Yann E. MORIN.

>  LIBSSH2_AUTORECONF = YES
>  
>  ifeq ($(BR2_PACKAGE_LIBSSH2_MBEDTLS),y)
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
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
