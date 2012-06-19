From: Tzu-Jung Lee <roylee17@gmail.com>
Date: Tue, 19 Jun 2012 20:51:46 +0800
Subject: [Buildroot] [PATCH 1/1] ccache: expose control interface via
	'make ccache-options'
In-Reply-To: <1339991408-25620-1-git-send-email-tjlee@ambarella.com>
References: <1339991408-25620-1-git-send-email-tjlee@ambarella.com>
Message-ID: <CAEvN+1hkWMdTRvKmjFmjD-Fy03MVdSKH9EUWvWx00Mr_naXLBg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jun 18, 2012 at 11:50 AM, Tzu-Jung Lee <roylee17@gmail.com> wrote:
> usage:
> ? ? ? ?# set cache limit size
> ? ? ? ?make CCACHE_OPTIONS="--max-size=5G" ccache-options
>
> ? ? ? ?# zero statistics counters
> ? ? ? ?make CCACHE_OPTIONS="--zero-stats" ccache-options
>
> Change-Id: I0162a2612a9aa4afd49f6d93c9c36dce3e0c8228
> ---
> ?package/ccache/ccache.mk | ? ?4 ++++
> ?1 files changed, 4 insertions(+), 0 deletions(-)
>
> diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
> index d7106ee..d46fbb9 100644
> --- a/package/ccache/ccache.mk
> +++ b/package/ccache/ccache.mk
> @@ -50,3 +50,7 @@ ccache-stats: host-ccache
> ? ? ? ?$(Q)$(CCACHE) -s
> ?endif
>
> +ifeq ($(BR2_CCACHE),y)
> +ccache-options: host-ccache
> + ? ? ? $(Q)$(CCACHE) $(CCACHE_OPTIONS)
> +endif
> --
> 1.7.8.6
>

Hi Guys,

Any comment on this?

Regards,
Roy
