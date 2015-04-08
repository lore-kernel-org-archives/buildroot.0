From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 08 Apr 2015 22:00:05 +0200
Subject: [Buildroot] [PATCH] Fix typos in comment blocks
In-Reply-To: <1428454416-30252-1-git-send-email-yamada.masahiro@socionext.com>
References: <1428454416-30252-1-git-send-email-yamada.masahiro@socionext.com>
Message-ID: <552588C5.6010209@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/04/15 02:53, Masahiro Yamada wrote:
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

 Few mistakes here...  Even though it looks stupid, it's better to make a
separate patch for each (unrelated) fix, so they can be reviewed and committed
individually.

 If you do split, you can add my
    Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
for the pieces which don't get a comment.

[snip]
> diff --git a/linux/Config.in b/linux/Config.in
> index c83a3f5..1da2bd5 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -289,7 +289,7 @@ if BR2_LINUX_KERNEL_DTS_SUPPORT
>  #   1) We don't want any support at all. Then the ..DTS_SUPPORT
>  #      variable won't be set
>  #   2) We want device tree support, so we need the user to enter
> -#      the device tree name or the the path to the custom device
> +#      the device tree name or the path to the custom device
>  #      he uses, but the kernel abstracts this from us and only

 The entire paragraph should be rewrapped because the he now fits on the
preceding line.

>  #      build an image that looks like a regular kernel image. In
>  #      this case, we only need to derive the kernel image name from

[snip]

> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index f77aab2..e1be085 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -411,7 +411,7 @@ endif
>  
>  $(2)_REDISTRIBUTE		?= YES
>  
> -# When a target package is a toolchain dependency set this variable to
> +# When a target package has a toolchain dependency set this variable to

 Nope, the original was correct: this variable should be set when the package is
a (indirect) dependency of 'toolchain'. E.g., uclibc is a target package that is
a dependency of the toolchain.

>  # 'NO' so the 'toolchain' dependency is not added to prevent a circular
>  # dependency
>  $(2)_ADD_TOOLCHAIN_DEPENDENCY	?= YES

[snip]


 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
