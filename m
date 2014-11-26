From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Nov 2014 21:55:01 +0100
Subject: [Buildroot] [PATCH v5 3/4] libunistring: host-libunistring is
 needed by guile
In-Reply-To: <1416869790-12988-4-git-send-email-paguilar@paguilar.org>
References: <1416869790-12988-1-git-send-email-paguilar@paguilar.org>
 <1416869790-12988-4-git-send-email-paguilar@paguilar.org>
Message-ID: <20141126215501.608ca8aa@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Pedro Aguilar,

On Mon, 24 Nov 2014 23:56:29 +0100, Pedro Aguilar wrote:
> Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
> 
> ---
> Changes v1 -> v2:
> - Add host-libunistring (suggested by Yann Morin)
> 
> ---
>  package/libunistring/libunistring.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/libunistring/libunistring.mk b/package/libunistring/libunistring.mk
> index 3234ddc..fd77d12 100644
> --- a/package/libunistring/libunistring.mk
> +++ b/package/libunistring/libunistring.mk
> @@ -17,3 +17,4 @@ LIBUNISTRING_CONF_OPTS += --disable-threads
>  endif
>  
>  $(eval $(autotools-package))
> +$(eval $(host-autotools-package))

Applied to next. Note that I had to add another commit, which adds a
dependency of libunistring on wchar: libunistring uses functions like
wctomb(), which are only available on wchar capable toolchains.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
