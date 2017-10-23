From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 23 Oct 2017 21:11:13 +0200
Subject: [Buildroot] [PATCH 1/1] libsepol: require threads
In-Reply-To: <20171023180045.7259-1-aduskett@gmail.com>
References: <20171023180045.7259-1-aduskett@gmail.com>
Message-ID: <48fe77cc-b735-2b3c-6b0b-52bd91557a6d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Adam,

On 23-10-17 20:00, Adam Duskett wrote:
> libsepol 2.7 now uses pthreads.h
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
>  package/libsepol/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/libsepol/Config.in b/package/libsepol/Config.in
> index f92af52072..32214e4e9c 100644
> --- a/package/libsepol/Config.in
> +++ b/package/libsepol/Config.in
> @@ -1,7 +1,11 @@
>  config BR2_PACKAGE_LIBSEPOL
>  	bool "libsepol"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS

 I believe you have been told before: when you add a dependency to a package,
you have to propagate it to the reverse dependencies of that package. In this
case libselinux, restorecond, semodule-utils. And you have to recurse to their
reverse dependencies, etc. etc.

 Regards,
 Arnout

>  	help
>  	  Libsepol is the binary policy manipulation library. It doesn't
>  	  depend upon or use any of the other SELinux components.
>  
>  	  http://selinuxproject.org/page/Main_Page
> +
> +comment "libsepol needs a toolchain w/ threads"
> +        depends on BR2_TOOLCHAIN_HAS_THREADS
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
