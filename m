From: Spenser Gilliland <spenser@gillilanding.com>
Date: Fri, 30 May 2014 10:31:19 -0500
Subject: [Buildroot] [PATCH 1/1] ti-gfx: pkg-config should also set
 parent include dir
In-Reply-To: <1401462022-10744-1-git-send-email-syntheticpp@gmx.net>
References: <1401462022-10744-1-git-send-email-syntheticpp@gmx.net>
Message-ID: <CAEBucnAiAtrF1uthDyuTPyS5TF8OQdSBchCLZOwRuLJ+ZP67wg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

On May 30, 2014 10:00 AM, "Peter K?mmel" <syntheticpp@gmx.net> wrote:
>
> Signed-off-by: Peter K?mmel <syntheticpp@gmx.net>
> ---
>  package/ti-gfx/glesv2.pc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/ti-gfx/glesv2.pc b/package/ti-gfx/glesv2.pc
> index 4c70aec..c3846d0 100644
> --- a/package/ti-gfx/glesv2.pc
> +++ b/package/ti-gfx/glesv2.pc
> @@ -8,4 +8,4 @@ Description: TI Graphics SDK implementation of OpenGL ESv2
>  Version: 1.9.2188537
>  Requires:
>  Libs: -L${libdir} -lGLESv2 -lGLES_CM -lsrv_um -lusc -lEGL -lIMGegl
> -Cflags: -I${includedir}/GLES2
> +Cflags: -I${includedir}/GLES2 -I${includedir}
> --
> 1.9.1
>
>

Does this fix a package for you?   The includedir var should be
/usr/include which is a default include path.

Thanks,
Spenser _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140530/67706bb9/attachment.html>
