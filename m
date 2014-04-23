From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Wed, 23 Apr 2014 10:52:22 +0200
Subject: [Buildroot] [PATCH v2] Makefile: let show-targets prints also
	the dependencies
In-Reply-To: <1398161459-8343-1-git-send-email-fabio.porcedda@gmail.com>
References: <1398161459-8343-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <CAHkwnC_6990=V0cZt1Pc8kHv81SC6dA2PZc5m-eO6iZExV=j8g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Apr 22, 2014 at 12:10 PM, Fabio Porcedda
<fabio.porcedda@gmail.com> wrote:
> Because the "show-targets" target print the targets that will be built,
> print also their dependencies.
>
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
> v2:
>  - remove the refactor code to simplify the merge of this patch
>
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index d10da9d..a6e6ecb 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -653,7 +653,7 @@ legal-info: dirs legal-info-clean legal-info-prepare $(TARGETS_LEGAL_INFO) \
>         @rm -f $(LEGAL_WARNINGS)
>
>  show-targets:
> -       @echo $(TARGETS) $(TARGETS_ROOTFS)
> +       @echo $(HOST_DEPS) $(TARGETS_HOST_DEPS) $(TARGETS) $(TARGETS_ROOTFS)
>
>  graph-build: $(O)/build/build-time.log
>         @install -d $(O)/graphs
> --
> 1.8.3.2
>

I've resent this patch as part of the original patch set:
http://patchwork.ozlabs.org/patch/341727/

Regards
-- 
Fabio Porcedda
