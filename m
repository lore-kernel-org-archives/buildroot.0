From: Markos Chandras <markos.chandras@gmail.com>
Date: Fri, 21 Dec 2012 12:00:54 +0000
Subject: [Buildroot] [PATCH v2 1/2] Makefile: rename cross target ->
	toolchain
In-Reply-To: <1356086190-906-2-git-send-email-fabio.porcedda@gmail.com>
References: <1356086190-906-1-git-send-email-fabio.porcedda@gmail.com>
 <1356086190-906-2-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <CAG2jQ8izPCUw8R_9z=dz6EM0BnoG1Sofns86rnK=y+2w5ezk8Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21 December 2012 10:36, Fabio Porcedda <fabio.porcedda@gmail.com> wrote:
> - Use a more descriptive name, the same of the "toolchain" directory.
> - Add missing dependencies to be able to successfully use the target
>   right after the configuration.
> - Move to a better position.
> - Documentation it in the help target.
>
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
> ---
>  Makefile | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 4b09437..458b8c5 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -377,9 +377,11 @@ $(BUILD_DIR)/buildroot-config/auto.conf: $(CONFIG_DIR)/.config
>
>  prepare: $(BUILD_DIR)/buildroot-config/auto.conf
>
> +toolchain: prepare dirs dependencies $(BASE_TARGETS)
> +
>  world: prepare dirs dependencies $(BASE_TARGETS) $(TARGETS_ALL)
>
> -.PHONY: all world dirs clean distclean source outputmakefile \
> +.PHONY: all world toolchain dirs clean distclean source outputmakefile \
>         legal-info legal-info-prepare legal-info-clean \
>         $(BASE_TARGETS) $(TARGETS) $(TARGETS_ALL) \
>         $(TARGETS_CLEAN) $(TARGETS_DIRCLEAN) $(TARGETS_SOURCE) $(TARGETS_LEGAL_INFO) \
> @@ -697,8 +699,6 @@ ifeq ($(O),output)
>  endif
>         rm -rf $(CONFIG_DIR)/.config $(CONFIG_DIR)/.config.old $(CONFIG_DIR)/.auto.deps
>
> -cross: $(BASE_TARGETS)
> -
>  help:
>         @echo 'Cleaning:'
>         @echo '  clean                  - delete all files created by build'
> @@ -706,6 +706,7 @@ help:
>         @echo
>         @echo 'Build:'
>         @echo '  all                    - make world'
> +       @echo '  toolchain              - build toolchain'
>         @echo '  <package>-rebuild      - force recompile <package>'
>         @echo '  <package>-reconfigure  - force reconfigure <package>'
>         @echo
> --
> 1.8.0
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

This one looks good to me as well

Reviewed-by: Markos Chandras <markos.chandras@imgtec.com>

-- 
Regards,
Markos
