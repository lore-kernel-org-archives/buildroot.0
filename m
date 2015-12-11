From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 11 Dec 2015 15:08:26 +0000
Subject: [Buildroot] [PATCH 3/3] package/boost: add library coroutine2
In-Reply-To: <1449842279-22712-3-git-send-email-joerg.krause@embedded.rocks>
References: <1449842279-22712-1-git-send-email-joerg.krause@embedded.rocks>
 <1449842279-22712-3-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <566AE6EA.9040005@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

I was trying to test your patch and I have noticed that despite of
having coroutine2 selected...

BR2_PACKAGE_BOOST_COROUTINE2=y

...there isn't any libboost_coroutine2.so file installed on target. Is
that normal?

Regards,

Vincent.

On 11/12/15 13:57, J?rg Krause wrote:
> Coroutine2 is a new (C++14) library added in boost 1.59.0. We also add
> coroutine2 to the '--without-libraries' configuration flag for the host
> variant.
> 
> Build successfully tested with Arago ARMv5 2011.09 - a gcc v4.5.3 toolchain.
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/boost/Config.in | 4 ++++
>  package/boost/boost.mk  | 7 ++++---
>  2 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/package/boost/Config.in b/package/boost/Config.in
> index 97d0802..83f6871 100644
> --- a/package/boost/Config.in
> +++ b/package/boost/Config.in
> @@ -78,6 +78,10 @@ config BR2_PACKAGE_BOOST_COROUTINE
>  	bool "boost-coroutine"
>  	depends on BR2_PACKAGE_BOOST_CONTEXT
>  
> +config BR2_PACKAGE_BOOST_COROUTINE2
> +	bool "boost-coroutine2"
> +	depends on BR2_PACKAGE_BOOST_CONTEXT
> +
>  config BR2_PACKAGE_BOOST_DATE_TIME
>  	bool "boost-date_time"
>  
> diff --git a/package/boost/boost.mk b/package/boost/boost.mk
> index 2f23fe1..0161d68 100644
> --- a/package/boost/boost.mk
> +++ b/package/boost/boost.mk
> @@ -16,15 +16,16 @@ HOST_BOOST_DEPENDENCIES =
>  # keep host variant as minimal as possible
>  HOST_BOOST_FLAGS = --without-icu \
>  	--without-libraries=$(subst $(space),$(comma),atomic chrono context \
> -	coroutine date_time exception filesystem graph graph_parallel \
> -	iostreams locale log math mpi program_options python random regex \
> -	serialization signals system test thread timer wave)
> +	coroutine coroutine2 date_time exception filesystem graph \
> +	graph_parallel iostreams locale log math mpi program_options python \
> +	random regex serialization signals system test thread timer wave)
>  
>  BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_ATOMIC),,atomic)
>  BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CHRONO),,chrono)
>  BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CONTAINER),,container)
>  BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CONTEXT),,context)
>  BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_COROUTINE),,coroutine)
> +BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_COROUTINE2),,coroutine2)
>  BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_DATE_TIME),,date_time)
>  BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_EXCEPTION),,exception)
>  BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_FILESYSTEM),,filesystem)
> 
