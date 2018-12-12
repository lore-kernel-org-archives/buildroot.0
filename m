From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Dec 2018 09:46:47 +0100
Subject: [Buildroot] [PATCH 2/2] package/tegrarcm: select host-cryptopp
 and drop BR2_arm dependency
In-Reply-To: <20181212025605.19382-2-casantos@datacom.com.br>
References: <20181212025605.19382-1-casantos@datacom.com.br>
 <20181212025605.19382-2-casantos@datacom.com.br>
Message-ID: <20181212094647.57b4149d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 12 Dec 2018 00:56:05 -0200, Carlos Santos wrote:
> - It is not be strictly necessary to select host-cryptopp but let's do
>   it like other host packages do.
> 
> - There is no reason to depend on the target architecture, since it's a
>   host tool.
> 
> Yes, we could have separate commits to select host-cryptopp and drop
> BR2_arm dependency but that would be overkill.
> 
> Signed-off-by: Carlos Santos <casantos@datacom.com.br>
> ---
>  package/tegrarcm/Config.in.host | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/tegrarcm/Config.in.host b/package/tegrarcm/Config.in.host
> index d8cbb947d6..3411501a72 100644
> --- a/package/tegrarcm/Config.in.host
> +++ b/package/tegrarcm/Config.in.host
> @@ -1,6 +1,6 @@
>  config BR2_PACKAGE_HOST_TEGRARCM
>  	bool "host tegrarcm"
> -	depends on BR2_arm || BR2_armeb

The idea of this dependency is that since tegracrm is only useful in
conjunction with a Tegra-based system, there is not reason to build it
if the target isn't ARM.

> +	select BR2_PACKAGE_HOST_CRYPTOPP

So we are starting to add Config.in.host options for all packages ? Why
are you doing this change ? What is the motivation ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
