From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 6 Feb 2016 23:42:41 +0100
Subject: [Buildroot] [PATCH v2 06/18] erlang-fast_tls: new package
In-Reply-To: <1454443064-14269-7-git-send-email-fhunleth@troodon-software.com>
References: <1454443064-14269-1-git-send-email-fhunleth@troodon-software.com>
 <1454443064-14269-7-git-send-email-fhunleth@troodon-software.com>
Message-ID: <56B676E1.6020003@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Frank, All,

Le 02/02/2016 20:57, Frank Hunleth a ?crit :
> This package is used by the newer versions of the ejabberd dependencies.
> 
> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>

Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain

> ---
> Changes v1->v2:
>   - Add SoB
>   - Fix alphabetic ordering in package list
>   - Add missing dependency on erlang-p1-utils
> 
>  package/Config.in                          |  1 +
>  package/erlang-fast_tls/Config.in          |  8 ++++++++
>  package/erlang-fast_tls/erlang-fast_tls.mk | 14 ++++++++++++++
>  3 files changed, 23 insertions(+)
>  create mode 100644 package/erlang-fast_tls/Config.in
>  create mode 100644 package/erlang-fast_tls/erlang-fast_tls.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index f2b6901..e576c92 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -469,6 +469,7 @@ menu "Interpreter languages and scripting"
>  	source "package/erlang/Config.in"
>  if BR2_PACKAGE_ERLANG
>  menu "Erlang libraries/modules"
> +	source "package/erlang-fast_tls/Config.in"
>  	source "package/erlang-goldrush/Config.in"
>  	source "package/erlang-lager/Config.in"
>  	source "package/erlang-p1-cache-tab/Config.in"
> diff --git a/package/erlang-fast_tls/Config.in b/package/erlang-fast_tls/Config.in
> new file mode 100644
> index 0000000..3bf52a1
> --- /dev/null
> +++ b/package/erlang-fast_tls/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_ERLANG_FAST_TLS
> +	bool "erlang-fast_tls"
> +	select BR2_PACKAGE_ERLANG_P1_UTILS
> +	select BR2_PACKAGE_OPENSSL
> +	help
> +	  TLS / SSL OpenSSL-based native driver for Erlang / Elixir
> +
> +	  https://github.com/processone/fast_tls
> diff --git a/package/erlang-fast_tls/erlang-fast_tls.mk b/package/erlang-fast_tls/erlang-fast_tls.mk
> new file mode 100644
> index 0000000..63c55c5
> --- /dev/null
> +++ b/package/erlang-fast_tls/erlang-fast_tls.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# erlang-fast_tls
> +#
> +################################################################################
> +
> +ERLANG_FAST_TLS_VERSION = 1.0.0
> +ERLANG_FAST_TLS_SITE = $(call github,processone,fast_tls,$(ERLANG_FAST_TLS_VERSION))
> +ERLANG_FAST_TLS_LICENSE = Apache-2.0
> +ERLANG_FAST_TLS_LICENSE_FILES = LICENSE.txt
> +ERLANG_FAST_TLS_INSTALL_STAGING = YES
> +ERLANG_FAST_TLS_DEPENDENCIES = openssl erlang-p1-utils
> +
> +$(eval $(rebar-package))
> 
