From: Christopher McCrory <chrismcc@gmail.com>
Date: Mon, 6 Jan 2020 14:12:30 -0800
Subject: [Buildroot] [PATCH 1/2] board/raspberrypi/post-image.sh:
 support older defconfigs
In-Reply-To: <20200106180029.GF2721@scaer>
References: <20200103003752.140-1-chrismcc@gmail.com>
 <20200106180029.GF2721@scaer>
Message-ID: <CALURroRt8sxOnkvuK33EMeFymAXECTQyR0b=SkyXCKaQXtggCQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jan 6, 2020 at 10:00 AM Yann E. MORIN <yann.morin.1998@free.fr>
wrote:

> Christopher, All,
>
> On 2020-01-03 00:37 +0000, Christopher McCrory spake thusly:
> > Commit ada40afb324 fixed pi3-minuart-bt being changed to miniuart-bt.
> Older
> > defconfig files based on raspberrypi*_defconfigs might have to old call,
> > BR2_ROOTFS_POST_SCRIPT_ARGS="--add-pi3-miniuart-bt-overlay"
> > Allow either argument to add the correct miniuart-bt overlay.
> >
> > Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
>
> As Peter noticed, we already refused such a change in the past, and I am
> 100% aligned with the reasoning Arnout gave back then.
>
>
I would disagree a little bit, but I'm all good with the maintainers
choices overall. I didn't see that thread originally. And I'm all good with
not adding this patch.





> Regards,
> Yann E. MORIN.
>
> > ---
> >  board/raspberrypi/post-image.sh | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/board/raspberrypi/post-image.sh
> b/board/raspberrypi/post-image.sh
> > index 9dbd98ef9b..e9246fa113 100755
> > --- a/board/raspberrypi/post-image.sh
> > +++ b/board/raspberrypi/post-image.sh
> > @@ -10,7 +10,7 @@ GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
> >  for arg in "$@"
> >  do
> >       case "${arg}" in
> > -             --add-miniuart-bt-overlay)
> > +             --add-miniuart-bt-overlay|--add-pi3-miniuart-bt-overlay)
> >               if ! grep -qE '^dtoverlay='
> "${BINARIES_DIR}/rpi-firmware/config.txt"; then
> >                       echo "Adding 'dtoverlay=miniuart-bt' to config.txt
> (fixes ttyAMA0 serial console)."
> >                       cat << __EOF__ >>
> "${BINARIES_DIR}/rpi-firmware/config.txt"
> > --
> > 2.18.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
> --
>
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>      |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is
> no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>  conspiracy.  |
>
> '------------------------------^-------^------------------^--------------------'
>


-- 
Christopher McCrory
To the optimist, the glass is half full.
To the pessimist, the glass is half empty.
To the engineer, the glass is twice as big as it needs to be.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200106/f79c001e/attachment.html>
