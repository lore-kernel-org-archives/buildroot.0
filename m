From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 24 Sep 2017 13:54:32 +0200
Subject: [Buildroot] [PATCH 1/1] package/librsync: not available in
 static builds
In-Reply-To: <20170913101823.12808-1-bernd.kuhls@t-online.de>
References: <20170913101823.12808-1-bernd.kuhls@t-online.de>
Message-ID: <d4a81c42-0bd2-d7fb-c36c-db4dc22fcb13@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 13-09-17 12:18, Bernd Kuhls wrote:
> Upstream only support shared builds:
> https://github.com/librsync/librsync/blob/master/CMakeLists.txt#L319
> 
> Fixes
> http://autobuild.buildroot.net/results/4b8/4b8db2d520373d0c9127e0d7695b5aeda6925dc5/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/librsync/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/librsync/Config.in b/package/librsync/Config.in
> index 652f0cb276..6957ddcc0e 100644
> --- a/package/librsync/Config.in
> +++ b/package/librsync/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_LIBRSYNC
>  	bool "librsync"
> +	depends on !BR2_STATIC_LIBS
>  	select BR2_PACKAGE_ZLIB
>  	select BR2_PACKAGE_BZIP2
>  	select BR2_PACKAGE_POPT
> @@ -9,3 +10,6 @@ config BR2_PACKAGE_LIBRSYNC
>  	  rsync utility and is used in rproxy.
>  
>  	  https://github.com/librsync/librsync
> +
> +comment "librsync needs a toolchain w/ dynamic library support"
> +	depends on BR2_STATIC_LIBS
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
