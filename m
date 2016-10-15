From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 15 Oct 2016 10:36:17 +0200
Subject: [Buildroot] [PATCH] toolchain: update comment about
	uClibc/uClibc-ng
In-Reply-To: <20161015081358.GA17029@waldemar-brodkorb.de>
References: <20161015081358.GA17029@waldemar-brodkorb.de>
Message-ID: <495a7915-a3f9-053f-2ba8-3d2cdbf95403@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15-10-16 10:13, Waldemar Brodkorb wrote:
> External toolchains can use both, so mention it here.
> 
> Reported-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

> ---
>  toolchain/toolchain-external/Config.in | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
> index 2b17b7a..bcb42db 100644
> --- a/toolchain/toolchain-external/Config.in
> +++ b/toolchain/toolchain-external/Config.in
> @@ -920,14 +920,16 @@ choice
>  	default BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC
>  
>  config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_UCLIBC
> -	bool "uClibc"
> +	bool "uClibc/uClibc-ng"
>  	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
>  	# For the time being, we assume that all custom external
>  	# toolchains have shadow password support.
>  	select BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
>  	help
>  	  Select this option if your external toolchain uses the
> -	  uClibc C library (available from http://www.uclibc.org/).
> +	  uClibc (available from http://www.uclibc.org/)
> +	  or uClibc-ng (available from http://www.uclibc-ng.org)
> +	  C library.
>  
>  config BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC
>  	bool "glibc/eglibc"
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
