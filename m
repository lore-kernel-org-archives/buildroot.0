From: Stephan Hoffmann <sho@relinux.de>
Date: Sat, 24 Nov 2012 10:51:04 +0100
Subject: [Buildroot] Qt mouse, keyboard, touchscreen
In-Reply-To: <1353748764.40553.YahooMailNeo@web164602.mail.gq1.yahoo.com>
References: <1353748764.40553.YahooMailNeo@web164602.mail.gq1.yahoo.com>
Message-ID: <50B09888.9000907@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 24.11.2012 10:19, schrieb Zoran Djordjevic:
> Thanks to helpful information you provided, I managed to built
> simple Qt application on my ARM board and it works - meaning
> I got some window and some simple effect inside. I am using
> framebuffer so started program with -qws option.
> However mouse, keyboard and touchscreen are dead. In fact they
> are probably visible by kernel (ts_calibrate and ts_test for example,
> works OK and cat /dev/input/event0 shows "usuall" garbage on
> terminal) however I don't know how to start them to work with Qt.
> I successfully started them earlier while using TinyX and GTK, by
> simply quoting them with xinit command parameters.
> But don't know how to do the same with Qt.
Hi,

there are two things to consider:

1. Check if there are drivers enabled in buildroot config. The default
configuration does not include any drivers. I stepped in this trap when
I started to use QT.

BTW: Shouldn't we change this to some useful default?

2. QT needs environment variables to configure input devices.

http://doc.qt.digia.com/4.7/qt-embedded-envvars.html

Hope this helps

Stephan

>  
> Regards
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de


-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121124/f72e0df2/attachment.html>
