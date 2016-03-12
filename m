From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 12 Mar 2016 23:04:58 +0100
Subject: [Buildroot] [PATCH] slang: do install-pkgconfig when building
 static library
In-Reply-To: <1457772849-7501-1-git-send-email-jcmvbkbc@gmail.com>
References: <1457772849-7501-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <20160312220458.GB3745@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

MAx, All,

On 2016-03-12 11:54 +0300, Max Filippov spake thusly:
> mc's configure can't find S-Lang because static S-Lang build doesn't
> install pkgconfig file into staging. Adding install-pkgconfig to
> SLANG_INSTALL_STAGING_OPTS fixes that.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/085194f18bc7db1e801d98e6620e3a75fd988cc5/

Could you instead fix the 0002-Enable-a-statically-linked-version-of-slsh
patch to have install-static also depend on install-pkgconfig, please?

In the mean time, I marked your patch as Chanmges Requested on our
Patchwork.

Thanks! :-)

Regards,
Yann E. MORIN.

> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> ---
>  package/slang/slang.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/slang/slang.mk b/package/slang/slang.mk
> index 9078bf2..0991201 100644
> --- a/package/slang/slang.mk
> +++ b/package/slang/slang.mk
> @@ -55,7 +55,7 @@ endif
>  
>  ifeq ($(BR2_STATIC_LIBS),y)
>  SLANG_MAKE_OPTS = static
> -SLANG_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) install-static
> +SLANG_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) install-static install-pkgconfig
>  SLANG_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install-static
>  endif
>  
> -- 
> 2.1.4
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
