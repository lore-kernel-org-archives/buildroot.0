From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 28 Oct 2014 17:13:36 +0000
Subject: [Buildroot] [PATCH] bluez5_utils: not for static builds
In-Reply-To: <1414515753-20297-1-git-send-email-gustavo@zacarias.com.ar>
References: <1414515753-20297-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <544FCEC0.5080908@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On 10/28/2014 05:02 PM, Gustavo Zacarias wrote:
> Disable for static builds, it uses dlfcn. Fixes:
> http://autobuild.buildroot.net/results/7cd/7cd87c9e9b8b41ee01413050e554b5422d207e70/
>
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>   package/bluez5_utils/Config.in | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/package/bluez5_utils/Config.in b/package/bluez5_utils/Config.in
> index ec1352f..a374f92 100644
> --- a/package/bluez5_utils/Config.in
> +++ b/package/bluez5_utils/Config.in
> @@ -5,6 +5,7 @@ config BR2_PACKAGE_BLUEZ5_UTILS
>   	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
>   	depends on BR2_USE_MMU # dbus
>   	depends on BR2_INET_IPV6
> +	depends on !BR2_PREFER_STATIC_LIB # uses dlfcn
>   	depends on !BR2_PACKAGE_BLUEZ_UTILS # conflicts with 4.x version
>   	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
>   	select BR2_PACKAGE_DBUS
> @@ -62,9 +63,10 @@ config BR2_PACKAGE_BLUEZ5_UTILS_TEST
>
>   endif
>
> -comment "bluez5-utils needs a toolchain w/ wchar, threads, IPv6, headers >= 3.4"
> +comment "bluez5-utils needs a toolchain w/ wchar, threads, IPv6, headers >= 3.4, dynamic library"
>   	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
> -		!BR2_INET_IPV6 || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
> +		!BR2_INET_IPV6 || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 || \
> +		BR2_PREFER_STATIC_LIB
>   	depends on BR2_USE_MMU
>
>   comment "bluez5-utils conflicts with older bluez-utils version"
>

Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

-- 
Vicente Olivert Riera
Graduate Software Engineer, MIPS Processor IP
Imagination Technologies Limited
t: +44 (0)113 2429814
www.imgtec.com
