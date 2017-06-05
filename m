From: Ryan Coe <bluemrp9@gmail.com>
Date: Mon, 5 Jun 2017 06:10:32 -0700
Subject: [Buildroot] [PATCH 1/1] package/inadyn: bump version to 2.1
In-Reply-To: <20170605103942.22179-1-bernd.kuhls@t-online.de>
References: <20170605103942.22179-1-bernd.kuhls@t-online.de>
Message-ID: <945488e6-31e5-b1d1-3c7c-6c67f57d247e@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd,


On 6/5/2017 3:39 AM, Bernd Kuhls wrote:
> Switched to tarball provided by upstream, autoreconf is not needed
> anymore.
>
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
> ---
>   package/inadyn/inadyn.hash |  4 +++-
>   package/inadyn/inadyn.mk   | 12 +++---------
>   2 files changed, 6 insertions(+), 10 deletions(-)
>
> diff --git a/package/inadyn/inadyn.hash b/package/inadyn/inadyn.hash
> index a4e60c96c..f573be286 100644
> --- a/package/inadyn/inadyn.hash
> +++ b/package/inadyn/inadyn.hash
> @@ -1,2 +1,4 @@
> +# From https://github.com/troglobit/inadyn/releases/download/v2.1/inadyn-2.1.tar.xz.md5
> +md5 b410684e38e628284a631ec763c2fdb8  inadyn-2.1.tar.xz
>   # Locally computed
> -sha256	763c53eb3856decfe8b921cab8a54b428b079a62264fbcf6c89690713d63529a  inadyn-v2.0.tar.gz
> +sha256 87639a7c1ddc047074601ad60188279a2a0d9393367f046c153de0e24586b3ac  inadyn-2.1.tar.xz
> diff --git a/package/inadyn/inadyn.mk b/package/inadyn/inadyn.mk
> index 5e26785b5..0ef8b5a52 100644
> --- a/package/inadyn/inadyn.mk
> +++ b/package/inadyn/inadyn.mk
> @@ -4,19 +4,13 @@
>   #
>   ################################################################################
>   
> -INADYN_VERSION = v2.0
> -INADYN_SITE = $(call github,troglobit,inadyn,$(INADYN_VERSION))
> +INADYN_VERSION = 2.1
> +INADYN_SITE = https://github.com/troglobit/inadyn/releases/download/v$(INADYN_VERSION)
> +INADYN_SOURCE = inadyn-$(INADYN_VERSION).tar.xz
>   INADYN_LICENSE = GPL-2.0+
>   INADYN_LICENSE_FILES = COPYING
> -INADYN_AUTORECONF = YES
>   INADYN_DEPENDENCIES = host-pkgconf libconfuse libite
>   
> -# Needed for autoreconf to work properly, see ./autogen.sh
> -define INADYN_FIXUP_M4_DIR
> -	mkdir $(@D)/m4
> -endef
> -INADYN_POST_EXTRACT_HOOKS += INADYN_FIXUP_M4_DIR
> -
>   ifeq ($(BR2_PACKAGE_OPENSSL),y)
>   INADYN_CONF_OPTS += --enable-openssl
>   INADYN_DEPENDENCIES += openssl
