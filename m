From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 3 Jul 2017 21:21:53 +0200
Subject: [Buildroot] [PATCH] libpwquality: select cracklib
In-Reply-To: <20170703165827.19052-1-peter@korsgaard.com>
References: <20170703165827.19052-1-peter@korsgaard.com>
Message-ID: <ae035089-c464-784f-0a82-7ecbb62b9126@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03-07-17 18:58, Peter Korsgaard wrote:
> libpwquality adds cracklib to its _DEPENDENCIES, but forgot to select it in
> Config.in, leading to build failures if cracklib isn't explicitly enabled:
> 
> Makefile:536: *** cracklib is in the dependency chain of libpwquality that
> has added it to its _DEPENDENCIES variable without selecting it or depending
> on it from Config.in.  Stop.
> 
> No autobuilder references as this error happens before build-time.log is
> written, causing the autobuilder to ignore the build result.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

> ---
>  package/libpwquality/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/libpwquality/Config.in b/package/libpwquality/Config.in
> index 4e855254a6..23e15157d1 100644
> --- a/package/libpwquality/Config.in
> +++ b/package/libpwquality/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_LIBPWQUALITY
>  	bool "libpwquality"
> +	select BR2_PACKAGE_CRACKLIB
>  	help
>  	  This is a library for password quality checks and generation
>  	  of random passwords that pass the checks.  This library uses
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
