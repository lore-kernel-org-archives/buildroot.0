From: Sonic Zhang <sonic.adi@gmail.com>
Date: Tue, 14 May 2013 14:23:11 +0800
Subject: [Buildroot] [PATCH v8 7/7] package: Introduce NOMMU symbol
In-Reply-To: <1367825740-9408-2-git-send-email-sonic.adi@gmail.com>
References: <1367825740-9408-1-git-send-email-sonic.adi@gmail.com>
 <1367825740-9408-2-git-send-email-sonic.adi@gmail.com>
Message-ID: <CAJxxZ0NJSpGMN+38KoHinvhNEsC4X1qXOSyqbuLv-Yps20mN0g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, May 6, 2013 at 3:35 PM, Sonic Zhang <sonic.adi@gmail.com> wrote:
> From: Sonic Zhang <sonic.zhang@analog.com>
>
> Introduce NOMMU symbol __NOMMU__
>
> ---
> v6-changes:
> - Remove space between comma and y.
> - Restore endif after rebase.
>
> Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
> ---
>  package/Makefile.in |    4 ++++
>  1 files changed, 4 insertions(+), 0 deletions(-)
>
> diff --git a/package/Makefile.in b/package/Makefile.in
> index a449089..55d725d 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -107,6 +107,10 @@ ifeq ($(BR2_BINFMT_FLAT),y)
>  TARGET_LDFLAGS += $(if $($(PKG)_FLAT_STACKSIZE),-Wl$(comma)-elf2flt=-s$($(PKG)_FLAT_STACKSIZE))
>  endif
>
> +ifneq ($(BR2_USE_MMU),y)
> +TARGET_CFLAGS += -D__NOMMU__
> +endif
> +
>  ifeq ($(BR2_BINFMT_FLAT_SHARED),y)
>  TARGET_LDFLAGS += -mid-shared-library -mshared-library-id=0
>  TARGET_CFLAGS += -mid-shared-library -mshared-library-id=0
> --

May I have your Acked-by for the last 2 bfin arch support patches?

Regards,

Sonic
