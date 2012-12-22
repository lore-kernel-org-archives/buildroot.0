From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 22 Dec 2012 13:45:18 +0100
Subject: [Buildroot] [PATCH v2 1/2] Makefile: rename cross target ->
	toolchain
In-Reply-To: <1356086190-906-2-git-send-email-fabio.porcedda@gmail.com>
References: <1356086190-906-1-git-send-email-fabio.porcedda@gmail.com>
 <1356086190-906-2-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <CAHXCMM+TKYDv5Fo-oY13+RSp1ayD+Du0AamTq7bA6KgZ54xfkg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabio,

2012/12/21 Fabio Porcedda <fabio.porcedda@gmail.com>:
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
Any reason to not make the world target depend on the toolchain and
$(TARGETS_ALL) targets?
IOW:
world: toolchain $(TARGETS_ALL)

Otherwise, it looks good to me with few words in the manual as already
mentioned by Arnout.

Regards,

-- 
Sam
