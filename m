From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 6 Feb 2016 23:47:55 +0100
Subject: [Buildroot] [PATCH v2 09/18] erlang-p1-stringprep: bump to
 version 1.0.0
In-Reply-To: <1454443064-14269-10-git-send-email-fhunleth@troodon-software.com>
References: <1454443064-14269-1-git-send-email-fhunleth@troodon-software.com>
 <1454443064-14269-10-git-send-email-fhunleth@troodon-software.com>
Message-ID: <56B6781B.7090706@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Frank, All,

Le 02/02/2016 20:57, Frank Hunleth a ?crit :
> This version includes C++ code, so also add dependency on a C++
> compiler.
> 
> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
> ---
>  package/erlang-p1-stringprep/Config.in               | 4 ++++
>  package/erlang-p1-stringprep/erlang-p1-stringprep.mk | 2 +-
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/package/erlang-p1-stringprep/Config.in b/package/erlang-p1-stringprep/Config.in
> index 3ef77ed..bc4d139 100644
> --- a/package/erlang-p1-stringprep/Config.in
> +++ b/package/erlang-p1-stringprep/Config.in
> @@ -1,5 +1,9 @@
> +comment "erlang-p1-stringprep needs a toolchain w/ C++"
> +	depends on !BR2_INSTALL_LIBSTDCPP
> +
>  config BR2_PACKAGE_ERLANG_P1_STRINGPREP
>  	bool "erlang-p1-stringprep"
> +	depends on BR2_INSTALL_LIBSTDCPP
>  	help
>  	  Erlang interface to stringprep

Now BR2_PACKAGE_ERLANG_P1_STRINGPREP denpends on C++, so the dependency must be
propagated to ejabberd.

With that fixed:
  Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain

>  
> diff --git a/package/erlang-p1-stringprep/erlang-p1-stringprep.mk b/package/erlang-p1-stringprep/erlang-p1-stringprep.mk
> index 60c80bc..001c205 100644
> --- a/package/erlang-p1-stringprep/erlang-p1-stringprep.mk
> +++ b/package/erlang-p1-stringprep/erlang-p1-stringprep.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -ERLANG_P1_STRINGPREP_VERSION = 3c64023
> +ERLANG_P1_STRINGPREP_VERSION = 1.0.0
>  ERLANG_P1_STRINGPREP_SITE = $(call github,processone,stringprep,$(ERLANG_P1_STRINGPREP_VERSION))
>  ERLANG_P1_STRINGPREP_LICENSE = TCL
>  ERLANG_P1_STRINGPREP_LICENSE_FILES = LICENSE.TCL
> 
