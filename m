From: Markos Chandras <markos.chandras@gmail.com>
Date: Fri, 21 Dec 2012 11:57:09 +0000
Subject: [Buildroot] [PATCH v2 2/2] Makefile: use toolchain target in
 the world target
In-Reply-To: <1356086190-906-3-git-send-email-fabio.porcedda@gmail.com>
References: <1356086190-906-1-git-send-email-fabio.porcedda@gmail.com>
 <1356086190-906-3-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <CAG2jQ8iWDOw6m4JuZxQDnVNbzpp7eLyQ-umYbzA8Du40kkKxrg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21 December 2012 10:36, Fabio Porcedda <fabio.porcedda@gmail.com> wrote:
> This is to remove redundancy and simplify the rule.
>
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 458b8c5..296917e 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -379,7 +379,7 @@ prepare: $(BUILD_DIR)/buildroot-config/auto.conf
>
>  toolchain: prepare dirs dependencies $(BASE_TARGETS)
>
> -world: prepare dirs dependencies $(BASE_TARGETS) $(TARGETS_ALL)
> +world: toolchain $(TARGETS_ALL)
>
>  .PHONY: all world toolchain dirs clean distclean source outputmakefile \
>         legal-info legal-info-prepare legal-info-clean \
> --
> 1.8.0
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Looks good to me

Reviewed-by: Markos Chandras <markos.chandras@imgtec.com>

-- 
Regards,
Markos
