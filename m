From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Tue, 28 Jun 2016 20:07:15 -0300
Subject: [Buildroot] [PATCH] minnowboard-max: Enable serial and HDMI
	consoles
In-Reply-To: <87por1msrf.fsf@dell.be.48ers.dk>
References: <1466487301-7585-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <87por1msrf.fsf@dell.be.48ers.dk>
Message-ID: <CAAEAJfBLALg3eKtQ1-7mBKHDZmp3rDKiVYNnqqYUPhuptqdn6A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28 June 2016 at 08:56, Peter Korsgaard <peter@korsgaard.com> wrote:
>>>>>> "Ezequiel" == Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> writes:
>
>  > Following what's done in Raspberry Pi's defconfigs, let's
>  > unify the consoles in Minnowboard Max defconfigs, providing
>  > consoles on HDMI and serial port.
>
>  > Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
>  > ---
>  >  board/minnowboard/post-build.sh             | 5 +++++
>  >  board/minnowboard/readme.txt                | 3 +++
>  >  configs/minnowboard_max-graphical_defconfig | 1 -
>  >  configs/minnowboard_max_defconfig           | 1 -
>  >  4 files changed, 8 insertions(+), 2 deletions(-)
>
>  > diff --git a/board/minnowboard/post-build.sh b/board/minnowboard/post-build.sh
>  > index f3a11e99f0f5..f03a607b9b4d 100755
>  > --- a/board/minnowboard/post-build.sh
>  > +++ b/board/minnowboard/post-build.sh
>  > @@ -3,3 +3,8 @@
>  >  # $2    board name
>
>  >  cp -v board/minnowboard/grub-${2}.cfg ${BINARIES_DIR}/efi-part/EFI/BOOT/grub.cfg
>  > +
>  > +# Add a console on tty1
>  > +grep -qE '^tty0::' ${TARGET_DIR}/etc/inittab || \
>  > +sed -i '/GENERIC_SERIAL/a\
>  > +tty0::respawn:/sbin/getty -L  tty0 0 vt100 # HDMI console' ${TARGET_DIR}/etc/inittab
>
> The comment says tty1 but you are using tty0. tty0 is afaik the
> currently active console, and tty1 the one on alt-f1. Rpi uses tty1, so
> I changed it here as well for consistency.
>

I like to be able to log right into the active console.
On the other side, consistency is good.

> Committed with that fixed, thanks.
>

Cool, thanks for the fixes.
-- 
Ezequiel Garc?a, VanguardiaSur
www.vanguardiasur.com.ar
