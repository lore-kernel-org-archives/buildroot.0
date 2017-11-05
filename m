From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 5 Nov 2017 17:00:26 +0100
Subject: [Buildroot] [PATCH 2/4] ti-gfx: only available on x86(-64) hosts
In-Reply-To: <20171102104520.29257-3-peter@korsgaard.com>
References: <20171102104520.29257-1-peter@korsgaard.com>
 <20171102104520.29257-3-peter@korsgaard.com>
Message-ID: <997f82fd-cc7b-7311-66fd-a1137101eacb@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 02-11-17 11:45, Peter Korsgaard wrote:
> ti-gfx is provided as a x86 self extracting executable, so it is only
> available on x86(-64) hosts.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>


 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/ti-gfx/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/ti-gfx/Config.in b/package/ti-gfx/Config.in
> index 6ec2f23117..dc49d822a2 100644
> --- a/package/ti-gfx/Config.in
> +++ b/package/ti-gfx/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_TI_GFX
>  	bool "ti-gfx"
>  	depends on BR2_LINUX_KERNEL && BR2_TOOLCHAIN_USES_GLIBC && BR2_arm
> +	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
>  	select BR2_HOSTARCH_NEEDS_IA32_LIBS
>  	select BR2_PACKAGE_HAS_LIBEGL
>  	select BR2_PACKAGE_HAS_LIBGLES
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
