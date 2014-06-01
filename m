From: Spenser Gilliland <spenser@gillilanding.com>
Date: Sun, 1 Jun 2014 10:30:10 -0500
Subject: [Buildroot] [PATCH 1/1] ti-gfx: select fbset as it is a runtime
	dependency
In-Reply-To: <1401634635-20325-1-git-send-email-hadrien.boutteville@gmail.com>
References: <1401634635-20325-1-git-send-email-hadrien.boutteville@gmail.com>
Message-ID: <CAEBucnCENKuaq6oidc9o0S9KjB_Hkt7h3oc0eed4mRs3ZRSZ3g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hadrien,

On Jun 1, 2014 7:57 AM, "Hadrien Boutteville" <hadrien.boutteville@gmail.com>
wrote:
>
> Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
> ---
>  package/ti-gfx/Config.in | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/package/ti-gfx/Config.in b/package/ti-gfx/Config.in
> index 3e8648e..f1f3a07 100644
> --- a/package/ti-gfx/Config.in
> +++ b/package/ti-gfx/Config.in
> @@ -3,6 +3,7 @@ config BR2_PACKAGE_TI_GFX
>         select BR2_PACKAGE_HAS_LIBEGL
>         select BR2_PACKAGE_HAS_LIBGLES
>         select BR2_PACKAGE_HAS_POWERVR
> +       select BR2_PACKAGE_FBSET # Runtime dependency only
>         depends on BR2_LINUX_KERNEL && BR2_TOOLCHAIN_USES_GLIBC && BR2_arm
>         help
>           Graphics libraries for TI boards.
> --
> 1.9.3
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Fbset is available in either the package or as part of busybox.  Is there a
good way to support both?

Thanks,
Spenser
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140601/c00718e8/attachment.html>
