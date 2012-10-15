From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 15 Oct 2012 14:38:50 +0200
Subject: [Buildroot] [PATCH v2] pkg-infra: add <pkg>-extract and
 <pkg>-patch targets to OVERRIDE support
In-Reply-To: <1350249558-21276-1-git-send-email-arnout@mind.be>
References: <1350249558-21276-1-git-send-email-arnout@mind.be>
Message-ID: <507C03DA.6060607@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout Vandecappelle (Essensium/Mind) wrote:
> The legal-info target (and possibly others as well) depends on
> <pkg>-extract to make sure the license file is available.  However,
> when <PKG>_OVERRIDE_SRCDIR is active, the <pkg>-extract target
> doesn't exist.
>
> To solve this, we add <pkg>-extract which depends on <pkg>-rsync.
> While we're at it,we do the same for <pkg>-patch.  That avoids the
> same problem in the future if something starts depending on
> <pkg>-patch.
>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> v2: As ThomasP suggested, don't remove <pkg>-rsync.
>
>   package/pkg-generic.mk |    3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index ffe7dfb..27db5a5 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -380,6 +380,9 @@ $(1)-configure:		$(1)-depends \
>
>   $(1)-depends:		$(1)-rsync $$($(2)_DEPENDENCIES)
>
> +$(1)-patch:		$(1)-rsync
> +$(1)-extract:		$(1)-rsync
> +
>   $(1)-rsync:		$$($(2)_TARGET_RSYNC)
>
>   $(1)-source:		$$($(2)_TARGET_RSYNC_SOURCE)
>


Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
