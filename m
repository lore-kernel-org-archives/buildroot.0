From: =?UTF-8?B?UGV0ZXIgS8O8bW1lbA==?= <syntheticpp@gmx.net>
Date: Fri, 30 May 2014 17:55:08 +0200
Subject: [Buildroot] [PATCH 1/1] ti-gfx: pkg-config should also set
 parent include dir
In-Reply-To: <CAEBucnAiAtrF1uthDyuTPyS5TF8OQdSBchCLZOwRuLJ+ZP67wg@mail.gmail.com>
References: <1401462022-10744-1-git-send-email-syntheticpp@gmx.net>
 <CAEBucnAiAtrF1uthDyuTPyS5TF8OQdSBchCLZOwRuLJ+ZP67wg@mail.gmail.com>
Message-ID: <5388A9DC.1010204@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 30.05.2014 17:31, Spenser Gilliland wrote:
> Peter,
>
> On May 30, 2014 10:00 AM, "Peter K?mmel" <syntheticpp at gmx.net <mailto:syntheticpp@gmx.net>> wrote:
>  >
>  > Signed-off-by: Peter K?mmel <syntheticpp at gmx.net <mailto:syntheticpp@gmx.net>>
>  > ---
>  >  package/ti-gfx/glesv2.pc | 2 +-
>  >  1 file changed, 1 insertion(+), 1 deletion(-)
>  >
>  > diff --git a/package/ti-gfx/glesv2.pc b/package/ti-gfx/glesv2.pc
>  > index 4c70aec..c3846d0 100644
>  > --- a/package/ti-gfx/glesv2.pc
>  > +++ b/package/ti-gfx/glesv2.pc
>  > @@ -8,4 +8,4 @@ Description: TI Graphics SDK implementation of OpenGL ESv2
>  >  Version: 1.9.2188537
>  >  Requires:
>  >  Libs: -L${libdir} -lGLESv2 -lGLES_CM -lsrv_um -lusc -lEGL -lIMGegl
>  > -Cflags: -I${includedir}/GLES2
>  > +Cflags: -I${includedir}/GLES2 -I${includedir}
>  > --
>  > 1.9.1
>  >
>  >
>
> Does this fix a package for you?   The includedir var should be /usr/include which is a default include path.

Yes, Qt5's cmake files assume /usr/include not /usr/include/GLES2.

I added -I${includedir} instead of removing only "GLES2" because then nothing will break,
and the other .pc file also sets both dirs.
But it seems common practice is to not add the uppercase dir names in the pkg-congig file.

Peter

>
> Thanks,
> Spenser _______________________________________________
>  > buildroot mailing list
>  > buildroot at busybox.net <mailto:buildroot@busybox.net>
>  > http://lists.busybox.net/mailman/listinfo/buildroot
>
