From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 1 Feb 2016 19:51:08 +0100
Subject: [Buildroot] [PATCH v6 02/13] core: use $(CURDIR) to set TOPDIR
In-Reply-To: <1454342021-22960-3-git-send-email-s.martin49@gmail.com>
References: <1454342021-22960-1-git-send-email-s.martin49@gmail.com>
 <1454342021-22960-3-git-send-email-s.martin49@gmail.com>
Message-ID: <56AFA91C.2090707@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01-02-16 16:53, Samuel Martin wrote:
> This changes saves a shell call and uses a variable automatically set
> by make [1].
> 
> [1] http://www.gnu.org/software/make/manual/make.html#Quick-Reference

 But then we should maybe remove TOPDIR, and replace it with CURDIR? You can't
change directories in make, so CURDIR will always be valid.

 Regards,
 Arnout

> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> 
> ---
> changes v5 -> v6:
> - new patch
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 17c181b..13c16af 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -69,7 +69,7 @@ endif
>  .NOTPARALLEL:
>  
>  # absolute path
> -TOPDIR := $(shell pwd)
> +TOPDIR := $(CURDIR)
>  CONFIG_CONFIG_IN = Config.in
>  CONFIG = support/kconfig
>  DATE := $(shell date +%Y%m%d)
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
