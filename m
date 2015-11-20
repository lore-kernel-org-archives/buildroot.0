From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 20 Nov 2015 22:47:43 +0100
Subject: [Buildroot] [PATCH 1/2] libnet: disable for musl toolchains
In-Reply-To: <1448033368-8081-1-git-send-email-joris.lijssens@gmail.com>
References: <1448033368-8081-1-git-send-email-joris.lijssens@gmail.com>
Message-ID: <564F94FF.5050901@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20-11-15 16:29, Joris Lijssens wrote:
> Signed-off-by: Joris Lijssens <joris.lijssens@gmail.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> ---
>  package/libnet/Config.in | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/libnet/Config.in b/package/libnet/Config.in
> index 7186972..8a88128 100644
> --- a/package/libnet/Config.in
> +++ b/package/libnet/Config.in
> @@ -1,7 +1,12 @@
>  config BR2_PACKAGE_LIBNET
>  	bool "libnet"
> +	# Build with musl fails due to header issues
> +	depends on !BR2_TOOLCHAIN_USES_MUSL
>  	help
>  	  libnet provides a portable framework for low-level network
>  	  packet construction.
>  
>  	  http://sourceforge.net/projects/libnet-dev
> +
> +comment "libnet needs a (e)glibc or uClibc toolchain"
> +	depends on BR2_TOOLCHAIN_USES_MUSL
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
