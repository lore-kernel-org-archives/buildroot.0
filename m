From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 21 Dec 2012 13:43:29 +0100
Subject: [Buildroot] [PATCH v2 2/2] Makefile: use toolchain target in
 the world target
In-Reply-To: <1356086190-906-3-git-send-email-fabio.porcedda@gmail.com>
References: <1356086190-906-1-git-send-email-fabio.porcedda@gmail.com>
 <1356086190-906-3-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <50D45971.5080800@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21/12/12 11:36, Fabio Porcedda wrote:
> This is to remove redundancy and simplify the rule.
>
> Signed-off-by: Fabio Porcedda<fabio.porcedda@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
  (untested but trivial enough)

  Regards,
  Arnout

> ---
>   Makefile | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 458b8c5..296917e 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -379,7 +379,7 @@ prepare: $(BUILD_DIR)/buildroot-config/auto.conf
>
>   toolchain: prepare dirs dependencies $(BASE_TARGETS)
>
> -world: prepare dirs dependencies $(BASE_TARGETS) $(TARGETS_ALL)
> +world: toolchain $(TARGETS_ALL)
>
>   .PHONY: all world toolchain dirs clean distclean source outputmakefile \
>   	legal-info legal-info-prepare legal-info-clean \


-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
