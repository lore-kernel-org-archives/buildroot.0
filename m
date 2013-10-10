From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 10 Oct 2013 09:16:11 +0200
Subject: [Buildroot] [PATCH 5/7] mongoose: needs mmu
In-Reply-To: <1381350348-25751-5-git-send-email-gustavo@zacarias.com.ar>
References: <1381350348-25751-1-git-send-email-gustavo@zacarias.com.ar>
 <1381350348-25751-5-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <5256543B.6090005@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/09/13 22:25, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>   package/mongoose/Config.in | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/package/mongoose/Config.in b/package/mongoose/Config.in
> index 7199712..1668476 100644
> --- a/package/mongoose/Config.in
> +++ b/package/mongoose/Config.in
> @@ -1,6 +1,7 @@
>   config BR2_PACKAGE_MONGOOSE
>   	bool "mongoose"
>   	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_USE_MMU # fork()
>   	help
>   	  Mongoose is a small and easy to use web server

  Note that fork() is only needed for CGI, so you could instead build 
with -DNO_CGI. It would be a pity to remove mongoose for NOMMU platforms 
since it is ideally suited for them...

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
