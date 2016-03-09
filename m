From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 10 Mar 2016 00:51:11 +0100
Subject: [Buildroot] [PATCH v7 02/18] core: use $(CURDIR) to set TOPDIR
In-Reply-To: <1457564339-27294-3-git-send-email-s.martin49@gmail.com>
References: <1457564339-27294-1-git-send-email-s.martin49@gmail.com>
 <1457564339-27294-3-git-send-email-s.martin49@gmail.com>
Message-ID: <56E0B6EF.500@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/09/16 23:58, Samuel Martin wrote:
> This changes saves a shell call and uses a variable automatically set
> by make [1].

  Wouldn't it be better to just use $(CURDIR) everywhere then?

  Regards,
  Arnout

>
> [1] http://www.gnu.org/software/make/manual/make.html#Quick-Reference
>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>
> ---
> changes v6->v7:
> - none
>
> changes v5->v6:
> - new patch
> ---
>   Makefile | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index f2822a2..98c8dc7 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -69,7 +69,7 @@ endif
>   .NOTPARALLEL:
>
>   # absolute path
> -TOPDIR := $(shell pwd)
> +TOPDIR := $(CURDIR)
>   CONFIG_CONFIG_IN = Config.in
>   CONFIG = support/kconfig
>   DATE := $(shell date +%Y%m%d)
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
