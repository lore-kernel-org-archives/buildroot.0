From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 24 Oct 2017 23:52:02 +0200
Subject: [Buildroot] [PATCH] boost: add stacktrace module
In-Reply-To: <20171024081709.9445-1-joerg.krause@embedded.rocks>
References: <20171024081709.9445-1-joerg.krause@embedded.rocks>
Message-ID: <3ebec11d-3686-62e5-3052-2472e2a2a759@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 24-10-17 10:17, J?rg Krause wrote:
> The stacktrace module was added in version 1.65.0. Without having a config
> option for the module, it is build unconditionally.

 Thank you, but this module depends on !STATIC. With that, it will fix e.g.
http://autobuild.buildroot.net/results/692/692ffad93a7bd867ecc7ccbfc8c6280735d29435

 Regards,
 Arnout

> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/boost/Config.in | 3 +++
>  package/boost/boost.mk  | 1 +
>  2 files changed, 4 insertions(+)
> 
> diff --git a/package/boost/Config.in b/package/boost/Config.in
> index 37a7e7339f..1ee5821ee1 100644
> --- a/package/boost/Config.in
> +++ b/package/boost/Config.in
> @@ -158,6 +158,9 @@ config BR2_PACKAGE_BOOST_SERIALIZATION
>  config BR2_PACKAGE_BOOST_SIGNALS
>  	bool "boost-signals"
>  
> +config BR2_PACKAGE_BOOST_STACKTRACE
> +	bool "boost-stacktrace"
> +
>  config BR2_PACKAGE_BOOST_SYSTEM
>  	bool "boost-system"
>  
> diff --git a/package/boost/boost.mk b/package/boost/boost.mk
> index 0fd6c4d0de..750b40f7d2 100644
> --- a/package/boost/boost.mk
> +++ b/package/boost/boost.mk
> @@ -42,6 +42,7 @@ BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_RANDOM),,random)
>  BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_REGEX),,regex)
>  BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_SERIALIZATION),,serialization)
>  BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_SIGNALS),,signals)
> +BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_STACKTRACE),,stacktrace)
>  BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_SYSTEM),,system)
>  BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_TEST),,test)
>  BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_THREAD),,thread)
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
