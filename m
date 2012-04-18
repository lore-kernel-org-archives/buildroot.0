From: Qais Yousef <Qais.Yousef@imgtec.com>
Date: Wed, 18 Apr 2012 12:08:11 +0100
Subject: [Buildroot] [PATCH v3] New Package: latencytop
In-Reply-To: <201204180013.10481.arnout@mind.be>
References: <1334680135-30458-1-git-send-email-qais.yousef@imgtec.com>
 <201204180013.10481.arnout@mind.be>
Message-ID: <0D107966AF6D79418315B7C5549F4B51033CC1E0@lemail1.le.imgtec.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> On Tuesday 17 April 2012 18:28:55 Qais Yousef wrote:
> > +--- latencytop-0.5/Makefile.old        2012-04-17
16:22:25.896083743 +0100
> > ++++ latencytop-0.5/Makefile    2012-04-17 16:23:01.318057605 +0100
> > +@@ -4,11 +4,11 @@
> > + DESTDIR =
> > + SBINDIR = /usr/sbin
> > + XCFLAGS = -W  -g `pkg-config --cflags glib-2.0`
-D_FORTIFY_SOURCE=2 -
> Wno-sign-compare
> > +-LDF = -Wl,--as-needed `pkg-config --libs glib-2.0`   -lncursesw
> > ++LDF = -Wl,--as-needed `pkg-config --libs glib-2.0`   -lncurses
> > +
> > + OBJS= latencytop.o text_display.o translate.o fsync.o
> > +
> > +-ifdef HAS_GTK_GUI
> > ++ifneq ($(HAS_GTK_GUI),0)
> 
>  I think this one is unneeded as well if you use HAS_GTK_GUI= (without
the
> 0).  So:
> 
> > +       $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) HAS_GTK_GUI=0
> 
> would become
> 
> 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) HAS_GTK_GUI=
> 
>  Regards,
>  Arnout

Thanks, just sent an updated version. I realised that the patch wasn't
signed off so fixed that too :)

Cheers,
Qais
