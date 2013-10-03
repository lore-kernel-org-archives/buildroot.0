From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 03 Oct 2013 18:54:15 +0200
Subject: [Buildroot] [PATCH v7 3/6] package/Makefile.in: don't force
 jobs when BR2_JLEVEL is empty
In-Reply-To: <1380802245-16978-4-git-send-email-fabio.porcedda@gmail.com>
References: <1380802245-16978-1-git-send-email-fabio.porcedda@gmail.com>
 <1380802245-16978-4-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <524DA137.304@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/03/13 14:10, Fabio Porcedda wrote:
> When the "BR2_JLEVEL" variable is empty use "make" without
> the "-j" option, because to be able to use top-level parallel
> make we must don't force the number of jobs in sub-make.
>
> Example:
> 	make BR2_JLEVEL= -j8
>
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

  Peter, can we get this committed?

  Regards,
  Arnout

> ---
>   package/Makefile.in | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/Makefile.in b/package/Makefile.in
> index 170ad78..d406901 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -18,7 +18,7 @@ PARALLEL_JOBS:=$(BR2_JLEVEL)
>   endif
>
>   MAKE1:=$(HOSTMAKE) -j1
> -MAKE:=$(HOSTMAKE) -j$(PARALLEL_JOBS)
> +MAKE:=$(HOSTMAKE) $(if $(PARALLEL_JOBS),-j$(PARALLEL_JOBS))
>
>   # Compute GNU_TARGET_NAME
>   GNU_TARGET_NAME=$(ARCH)-buildroot-$(TARGET_OS)-$(LIBC)$(ABI)
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
