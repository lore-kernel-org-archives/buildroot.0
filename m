From: Spenser Gilliland <spenser@gillilanding.com>
Date: Fri, 30 May 2014 14:57:19 -0500
Subject: [Buildroot] [PATCH 1/1] ti-gfx: pkg-config should also set
 parent include dir
In-Reply-To: <5388A9DC.1010204@gmx.net>
References: <1401462022-10744-1-git-send-email-syntheticpp@gmx.net>
 <CAEBucnAiAtrF1uthDyuTPyS5TF8OQdSBchCLZOwRuLJ+ZP67wg@mail.gmail.com>
 <5388A9DC.1010204@gmx.net>
Message-ID: <CAEBucnDa_EjmUu2buXEA16by0_Wck+sp-RF1Rajc8uSOswb_Zg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

On May 30, 2014 10:55 AM, "Peter K?mmel" <syntheticpp@gmx.net> wrote:
>
> On 30.05.2014 17:31, Spenser Gilliland wrote:
>>
>> Peter,
>>
>> On May 30, 2014 10:00 AM, "Peter K?mmel" <syntheticpp at gmx.net <mailto:
syntheticpp@gmx.net>> wrote:
>>  >
>>  > Signed-off-by: Peter K?mmel <syntheticpp at gmx.net <mailto:
syntheticpp@gmx.net>>
>>
>>  > ---
>>  >  package/ti-gfx/glesv2.pc | 2 +-
>>  >  1 file changed, 1 insertion(+), 1 deletion(-)
>>  >
>>  > diff --git a/package/ti-gfx/glesv2.pc b/package/ti-gfx/glesv2.pc
>>  > index 4c70aec..c3846d0 100644
>>  > --- a/package/ti-gfx/glesv2.pc
>>  > +++ b/package/ti-gfx/glesv2.pc
>>  > @@ -8,4 +8,4 @@ Description: TI Graphics SDK implementation of OpenGL
ESv2
>>  >  Version: 1.9.2188537
>>  >  Requires:
>>  >  Libs: -L${libdir} -lGLESv2 -lGLES_CM -lsrv_um -lusc -lEGL -lIMGegl
>>  > -Cflags: -I${includedir}/GLES2
>>  > +Cflags: -I${includedir}/GLES2 -I${includedir}
>>  > --
>>  > 1.9.1
>>  >
>>  >
>>
>> Does this fix a package for you?   The includedir var should be
/usr/include which is a default include path.
>
>
> Yes, Qt5's cmake files assume /usr/include not /usr/include/GLES2.
>
> I added -I${includedir} instead of removing only "GLES2" because then
nothing will break,
> and the other .pc file also sets both dirs.
> But it seems common practice is to not add the uppercase dir names in the
pkg-congig file.

This patch won't break anything.  But it would be nice if you could go back
and reverify this just to be sure.

My reasoning is that,  /usr/include is a default include dir which all
compilers should use automatically.   There should not be a need to
manually specify it.

However,  that's not to say that cmake doesn't disable the default include
dir some how. If that's the case,  it may be better to try to fix cmake or
the qt5 packages.

However, If you don't have time to investigate the items above and this
patch fixes the problem then I see no problem in applying it. So, it has my
ack.

Acked by: Spenser Gilliland <spenser@gillilanding.com>

Thanks,
Spenser

>
> Peter
>
>>
>> Thanks,
>> Spenser _______________________________________________
>>  > buildroot mailing list
>>  > buildroot at busybox.net <mailto:buildroot@busybox.net>
>>  > http://lists.busybox.net/mailman/listinfo/buildroot
>>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140530/2b3546fb/attachment.html>
