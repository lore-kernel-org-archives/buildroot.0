From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Mon, 13 Oct 2014 12:23:31 +0200
Subject: [Buildroot] [PATCH] initscripts: new package
In-Reply-To: <20141013102149.GF3500@tarshish>
References: <1413194625-31516-1-git-send-email-maxime.hadjinlian@gmail.com>
 <20141013102149.GF3500@tarshish>
Message-ID: <CAGduivwTg7oS9fiu7RVViQZ189jXDWU9z2spwaHX4Uuv+xfAwg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Oct 13, 2014 12:21 PM, "Baruch Siach" <baruch@tkos.co.il> wrote:
>
> Hi Maxime,
>
> On Mon, Oct 13, 2014 at 12:03:45PM +0200, Maxime Hadjinlian wrote:
> > @@ -34,9 +38,12 @@ define SYSVINIT_INSTALL_TARGET_CMDS
> >       for x in halt init shutdown killall5; do \
> >               $(INSTALL) -D -m 0755 $(@D)/src/$$x
$(TARGET_DIR)/sbin/$$x || exit 1; \
> >       done
> > +<<<<<<< HEAD
> >       # Override BusyBox's inittab with an inittab compatible with
> >       # sysvinit
> >       $(INSTALL) -D -m 0644 package/sysvinit/inittab
$(TARGET_DIR)/etc/inittab
> > +=======
> > +>>>>>>> initscripts: new package
> >       ln -sf /sbin/halt $(TARGET_DIR)/sbin/reboot
> >       ln -sf /sbin/halt $(TARGET_DIR)/sbin/poweroff
> >       ln -sf killall5 $(TARGET_DIR)/sbin/pidof
>
> Something went wrong here.
Oops ! Rebasing done wrong. Thanks ! I'll respin that.
>
> baruch
>
> --
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open
Systems
>
=}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141013/c8615d32/attachment.html>
