From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 17 Feb 2019 20:56:31 +0100
Subject: [Buildroot] [PATCH 1/1] package/ipmiutil: fix build with
 openssl 1.1.x
In-Reply-To: <20190217162432.20396-1-fontaine.fabrice@gmail.com>
References: <20190217162432.20396-1-fontaine.fabrice@gmail.com>
Message-ID: <20190217205631.650b61b7@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 17 Feb 2019 17:24:32 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/1d868798c5b80d7b41123f988449ef548dd95490
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/ipmiutil/ipmiutil.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/ipmiutil/ipmiutil.mk b/package/ipmiutil/ipmiutil.mk
> index 5d8c45665d..0d9a4509b3 100644
> --- a/package/ipmiutil/ipmiutil.mk
> +++ b/package/ipmiutil/ipmiutil.mk
> @@ -18,7 +18,7 @@ ifeq ($(BR2_PACKAGE_OPENSSL)x$(BR2_STATIC_LIBS),yx)
>  # tests against distro libcrypto so it might get a false positive when
>  # the openssl version is old, so force it off
>  # SKIP_MD2 can be used only if ALLOW_GNU is defined.
> -IPMIUTIL_CONF_OPTS += CPPFLAGS="$(TARGET_CPPFLAGS) -DALLOW_GNU -DSKIP_MD2"
> +IPMIUTIL_CONF_OPTS += CPPFLAGS="$(TARGET_CPPFLAGS) -DALLOW_GNU -DSKIP_MD2 -DSSL11"

How does that play with LibreSSL instead of OpenSSL ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
