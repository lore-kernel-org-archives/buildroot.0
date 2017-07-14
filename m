From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 14 Jul 2017 23:53:13 +0200
Subject: [Buildroot] [PATCH] package/Makefile.in: export O= to
 post-build/image scripts for out-of-tree builds
In-Reply-To: <20170714130417.18857-1-peter@korsgaard.com>
References: <20170714130417.18857-1-peter@korsgaard.com>
Message-ID: <20170714215313.GC3373@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2017-07-14 15:04 +0200, Peter Korsgaard spake thusly:
> Sometimes it can be interesting to call back into buildroot from a
> post-build/image script (E.G. make printvars or similar). For this to work
> correctly with out-of-tree builds we need to pass O= to make, but this is
> currently not available in the environment of post-build/image scripts.
> 
> In concept, O could be derrived from BUILD_DIR (E.G. by stripping /build),
> but directly exporting O is cleaner.
> 
> O= cannot be exported globally as it interferes with various build systems,
> so instead add it to EXTRA_ENV.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/Makefile.in | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/Makefile.in b/package/Makefile.in
> index b95e5e3fa8..a2b0d90f32 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -309,7 +309,8 @@ HOST_CONFIGURE_OPTS = \
>  EXTRA_ENV = \
>  	PATH=$(BR_PATH) \
>  	BR2_DL_DIR=$(BR2_DL_DIR) \
> -	BUILD_DIR=$(BUILD_DIR)
> +	BUILD_DIR=$(BUILD_DIR) \
> +	O=$(CANONICAL_O)
>  
>  ################################################################################
>  # settings we need to pass to configure
> -- 
> 2.11.0
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
