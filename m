From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 5 Nov 2017 15:52:13 +0100
Subject: [Buildroot] [PATCH v2] python-protobuf: update dependencies
In-Reply-To: <20171023161944.3652-1-alexey.roslyakov@gmail.com>
References: <20171023161944.3652-1-alexey.roslyakov@gmail.com>
Message-ID: <f6a1aa5e-e1a4-68c4-e9e7-210ef6d82e51@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 23-10-17 18:19, Alexey Roslyakov wrote:
> Since version 3.0.0 protobuf is compatible with Python3, remove
> Python2-only dependency.
> 
> It depends on python-six now, add this missing dependency.
> 
> Signed-off-by: Alexey Roslyakov <alexey.roslyakov@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout

> 
> ---
> Changes v1 -> v2:
>   - just remove "depends on BR2_PACKAGE_PYTHON" (suggested by Yegor)
> ---
>  package/python-protobuf/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/python-protobuf/Config.in b/package/python-protobuf/Config.in
> index 68523e9c60..607fe48c2a 100644
> --- a/package/python-protobuf/Config.in
> +++ b/package/python-protobuf/Config.in
> @@ -1,9 +1,9 @@
>  config BR2_PACKAGE_PYTHON_PROTOBUF
>  	bool "python-protobuf"
> -	depends on BR2_PACKAGE_PYTHON
>  	# host-protobuf only builds on certain architectures
>  	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
>  	depends on BR2_HOST_GCC_AT_LEAST_4_5 # host-protobuf
> +	select BR2_PACKAGE_PYTHON_SIX # runtime
>  	help
>  	  Python implementation of the Google Protocol Buffers.
>  
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
