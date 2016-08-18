From: Jan Heylen <heyleke@gmail.com>
Date: Thu, 18 Aug 2016 09:40:28 +0200
Subject: [Buildroot] [PATCH] arch: add missing 'string' declaration to
	BR2_LD_TARGET_EMULATION
In-Reply-To: <1471505353-20289-1-git-send-email-arnout@mind.be>
References: <1471505353-20289-1-git-send-email-arnout@mind.be>
Message-ID: <CAGszK3hBzWJTJu7rULVVt2tiqQd5GS9Fv-BBmue0pRo90FLJMw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Aug 18, 2016 at 9:29 AM, Arnout Vandecappelle (Essensium/Mind)
<arnout@mind.be> wrote:
> Commit dc6f4c8 forgot to give a type (string) to the newly introduced
> BR2_LD_TARGET_EMULATION symbol.
>
> Possibly it was intended to be a "global" symbol like
> BR2_GCC_TARGET_ABI where the declaration is in arch/Config.in and not
> in the arch-specific Config.in. However, in this case, the symbol is
> only defined/used for MIPS so there is no "global" declaration.
>
> Without this, Kconfig gives a warning:
> arch/Config.in.mips:87:warning: config symbol defined without type
>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Jan Heylen <heyleke@gmail.com>

I assume so :-)

Reviewed-by: Jan Heylen <heyleke@gmail.com>

br,

Jan

> ---
>  arch/Config.in.mips | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/Config.in.mips b/arch/Config.in.mips
> index 37e4bf6..ebc71de 100644
> --- a/arch/Config.in.mips
> +++ b/arch/Config.in.mips
> @@ -85,6 +85,7 @@ config BR2_GCC_TARGET_ABI
>         default "64"            if BR2_MIPS_NABI64
>
>  config BR2_LD_TARGET_EMULATION
> +       string
>         default "elf64ltsmip"           if  BR2_mips64el && BR2_MIPS_NABI64
>         default "elf64btsmip"           if  BR2_mips64   && BR2_MIPS_NABI64
>         default "elf32ltsmipn32"        if  BR2_mips64el && BR2_MIPS_NABI32
> --
> 2.8.1
>
