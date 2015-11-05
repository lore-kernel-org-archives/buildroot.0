From: Alexander Dahl <post@lespocky.de>
Date: Thu, 05 Nov 2015 19:07:40 +0100
Subject: [Buildroot] [PATCH] fastd: needs host-bison and host-pkgconf
In-Reply-To: <1446740938-9782-1-git-send-email-gustavo@zacarias.com.ar>
References: <1446740938-9782-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <53a611ba58174e801cf50342059a6e02@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 2015-11-05 17:28, schrieb Gustavo Zacarias:
> Fixes (missing host-bison):
> http://autobuild.buildroot.net/results/237/2371c98112a416f4d9d32576f207dad8d80ac537
> 
> host-pkgconf derived from $(@D)/cmake/deps.cmake
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Reviewed-by: Alexander Dahl <post@lespocky.de>

> ---
>  package/fastd/fastd.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/fastd/fastd.mk b/package/fastd/fastd.mk
> index afaa27b..4c2626f 100644
> --- a/package/fastd/fastd.mk
> +++ b/package/fastd/fastd.mk
> @@ -9,7 +9,7 @@ FASTD_SITE = git://git.universe-factory.net/fastd
>  FASTD_LICENSE = BSD-2c
>  FASTD_LICENSE_FILES = COPYRIGHT
>  FASTD_CONF_OPTS = -DENABLE_LIBSODIUM=ON
> -FASTD_DEPENDENCIES = libuecc libsodium libcap
> +FASTD_DEPENDENCIES = host-bison host-pkgconf libuecc libsodium libcap
>  
>  ifeq ($(BR2_PACKAGE_OPENSSL),y)
>  FASTD_CONF_OPTS += -DENABLE_OPENSSL=ON

-- 
?With the first link, the chain is forged. The first speech censured,
the first thought forbidden, the first freedom denied, chains us all
irrevocably.? (Jean-Luc Picard, quoting Judge Aaron Satie)
*** GnuPG-FP: 02C8 A590 7FE5 CA5F 3601  D1D5 8FBA 7744 CC87 10D0 ***
