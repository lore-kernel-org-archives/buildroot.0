From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Fri, 3 Apr 2020 22:14:29 +0200
Subject: [Buildroot] [PATCH] package/xerces: force gcc at least 4.9
In-Reply-To: <20200403195305.33887-2-b.bilas@grinn-global.com>
References: <20200403195305.33887-1-b.bilas@grinn-global.com>
 <20200403195305.33887-2-b.bilas@grinn-global.com>
Message-ID: <151dc174-e7ea-7e77-c398-8c36049c9321@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Please ignore this patch.

Best
Bartek
On 03.04.2020 21:53, Bartosz Bilas wrote:
> Xerces uses char16_t which was introduced in c++11.
>
> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
> ---
>   package/xerces/Config.in | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/package/xerces/Config.in b/package/xerces/Config.in
> index 2edc4346b5..06b33674dc 100644
> --- a/package/xerces/Config.in
> +++ b/package/xerces/Config.in
> @@ -1,10 +1,14 @@
>   config BR2_PACKAGE_XERCES
>   	bool "xerces-c++"
>   	depends on BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # c++11
> +	depends on BR2_HOST_GCC_AT_LEAST_4_9 # c++11
>   	help
>   	  Xerces-C++ is a validating XML parser written in portable C++.
>   
>   	  http://xerces.apache.org/xerces-c/
>   
> -comment "xerces-c++ needs a toolchain w/ C++, wchar"
> -	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR)
> +comment "xerces-c++ needs a toolchain w/ C++, wchar, gcc >= 4.9, host gcc >= 4.9"
> +	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_USE_WCHAR && \
> +			BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 && \
> +			BR2_HOST_GCC_AT_LEAST_4_9 )
