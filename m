From: Sonic Zhang <sonic.adi@gmail.com>
Date: Tue, 23 Apr 2013 17:17:31 +0800
Subject: [Buildroot] [PATCH v6 5/7] package: Introduce package-specific
 BINFMT_FLAT options.
In-Reply-To: <1366279592-9055-5-git-send-email-sonic.adi@gmail.com>
References: <1366279592-9055-1-git-send-email-sonic.adi@gmail.com>
 <1366279592-9055-5-git-send-email-sonic.adi@gmail.com>
Message-ID: <CAJxxZ0OsCsQnaqFi0_gnN+BFu7o6UrTyJ2BF17f3KB5bLtwEQA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,


On Thu, Apr 18, 2013 at 6:06 PM, Sonic Zhang <sonic.adi@gmail.com> wrote:
> From: Sonic Zhang <sonic.zhang@analog.com>
>
> Add new option <PKG>_FLAT_STACKSIZE. The document needs to be updated.
>
> Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
> Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>
> ---
>
> v4-change:
> - Use late binding in make to expand package specific flat stack size
> to TARGET_LDFLAGS.
>
> v2-changes:
> - Fix typo error in macro BINFMT_FLAT
> ---
>  package/Makefile.in |    4 ++++
>  1 files changed, 4 insertions(+), 0 deletions(-)
>
> diff --git a/package/Makefile.in b/package/Makefile.in
> index dd3bc7d..a449089 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -103,6 +103,10 @@ TARGET_CFLAGS = $(TARGET_CPPFLAGS) $(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET
>  TARGET_CXXFLAGS = $(TARGET_CFLAGS)
>  TARGET_LDFLAGS = $(call qstrip,$(BR2_TARGET_LDFLAGS))
>
> +ifeq ($(BR2_BINFMT_FLAT),y)
> +TARGET_LDFLAGS += $(if $($(PKG)_FLAT_STACKSIZE),-Wl$(comma)-elf2flt=-s$($(PKG)_FLAT_STACKSIZE))
> +endif
> +
>  ifeq ($(BR2_BINFMT_FLAT_SHARED),y)
>  TARGET_LDFLAGS += -mid-shared-library -mshared-library-id=0
>  TARGET_CFLAGS += -mid-shared-library -mshared-library-id=0
> --
> 1.7.0.4
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


Can this patch be merge to upstream? Who is responsible for the merge?

Thanks

Sonic Zhang
