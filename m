From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 9 Oct 2013 08:55:43 +0200
Subject: [Buildroot] [PATCH v2] ccache: expose control interface via
	'make ccache-options'
In-Reply-To: <1381267913-3167-1-git-send-email-tjlee@ambarella.com>
References: <5253AA39.1090908@mind.be>
 <1381267913-3167-1-git-send-email-tjlee@ambarella.com>
Message-ID: <CAAXf6LUEiqJ5L9t_nEAqDEfZQLv_0UGYv1SK4w=Ee9LX=qjEPw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Tzu-Jung,

On Tue, Oct 8, 2013 at 11:31 PM, Tzu-Jung Lee <roylee17@gmail.com> wrote:
> usage:
>         # set cache limit size
>         make CCACHE_OPTIONS="--max-size=5G" ccache-options
>
>         # zero statistics counters
>         make CCACHE_OPTIONS="--zero-stats" ccache-options
>
> Signed-off-by: Tzu-Jung Lee <tjlee@ambarella.com>
> ---
> Add descriptions in the manual
>
>  docs/manual/ccache-support.txt | 11 +++++++++++
>  package/ccache/ccache.mk       |  5 +++++
>  2 files changed, 16 insertions(+)
>
> diff --git a/docs/manual/ccache-support.txt b/docs/manual/ccache-support.txt
> index 4969180..bdb0034 100644
> --- a/docs/manual/ccache-support.txt
> +++ b/docs/manual/ccache-support.txt
> @@ -23,3 +23,14 @@ remove this directory.
>
>  You can get statistics on the cache (its size, number of hits,
>  misses, etc.) by running +make ccache-stats+.
> +
> +The make target +cache-options+ and the +CCACHE_OPTIONS+ variable

this should be ccache-options

> +provide more generic access to the ccache. For example
> +
> +-----------------
> +# set cache limit size
> +make CCACHE_OPTIONS="--max-size=5G" ccache-options
> +
> +# zero statistics counters
> +make CCACHE_OPTIONS="--zero-stats" ccache-options
> +-----------------
> diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
> index c5e9385..663a959 100644
> --- a/package/ccache/ccache.mk
> +++ b/package/ccache/ccache.mk
> @@ -45,3 +45,8 @@ ifeq ($(BR2_CCACHE),y)
>  ccache-stats: host-ccache
>         $(Q)$(CCACHE) -s
>  endif
> +
> +ifeq ($(BR2_CCACHE),y)
> +ccache-options: host-ccache
> +       $(Q)$(CCACHE) $(CCACHE_OPTIONS)
> +endif
> --


Best regards,
Thomas
