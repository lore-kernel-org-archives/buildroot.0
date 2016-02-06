From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 6 Feb 2016 23:34:45 +0100
Subject: [Buildroot] [PATCH v2 02/18] pkg-rebar.mk: pass C++ compiler
 path and options
In-Reply-To: <1454443064-14269-3-git-send-email-fhunleth@troodon-software.com>
References: <1454443064-14269-1-git-send-email-fhunleth@troodon-software.com>
 <1454443064-14269-3-git-send-email-fhunleth@troodon-software.com>
Message-ID: <56B67505.3040503@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Frank, All,

Le 02/02/2016 20:57, Frank Hunleth a ?crit :
> Previously only the C compiler path and options were passed to rebar.
> Erlang projects that used the C++ compiler would fail to build. This
> fixes those errors.
> 
> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>

C++ support is currently only required for erlang-p1-stringprep, right ?

Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain

> ---
>  package/pkg-rebar.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/pkg-rebar.mk b/package/pkg-rebar.mk
> index c727489..44c6d6c 100644
> --- a/package/pkg-rebar.mk
> +++ b/package/pkg-rebar.mk
> @@ -158,7 +158,9 @@ ifndef $(2)_BUILD_CMDS
>  define $(2)_BUILD_CMDS
>  	(cd $$(@D); \
>  		CC="$$(TARGET_CC)" \
> +		CXX="$$(TARGET_CXX)" \
>  		CFLAGS="$$(TARGET_CFLAGS)" \
> +		CXXFLAGS="$$(TARGET_CXXFLAGS)" \
>  		LDFLAGS="$$(TARGET_LDFLAGS)" \
>  		$$(REBAR_TARGET_DEPS_ENV) \
>  		$$(TARGET_MAKE_ENV) \
> 
