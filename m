From: Zoran Djordjevic <djdjdjole@yahoo.com>
Date: Sun, 25 Nov 2012 23:49:58 -0800 (PST)
Subject: [Buildroot] Qt mouse, keyboard, touchscreen
In-Reply-To: <50B09888.9000907@relinux.de>
References: <1353748764.40553.YahooMailNeo@web164602.mail.gq1.yahoo.com>
 <50B09888.9000907@relinux.de>
Message-ID: <1353916198.97471.YahooMailNeo@web164601.mail.gq1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

OK - now I checked few options regarding Qt drivers in Buildroot
menu and try rebuilding, but got error:
The tslib functionality test failed!
You might need to modify the indluce and library search paths by editing
QMAKE_INCDIR and QMAKE_LIBDIR in ....... (name of the config folder).
I don't see either of those ones in qmake.conf in folder quoted, and also
if I add them, don't know what to quote ?
?
Regards? 

________________________________
 From: Stephan Hoffmann <sho@relinux.de>
To: buildroot at busybox.net 
Sent: Saturday, November 24, 2012 10:51 AM
Subject: Re: [Buildroot] Qt mouse, keyboard, touchscreen
  

  
Am 24.11.2012 10:19, schrieb Zoran Djordjevic: 
Thanks to helpful information you provided, I managed to built 
>simple Qt application on my ARM board and it works - meaning 
>I got some window and some simple effect inside. I am using  
>framebuffer so started program with?-qws option. 
>However mouse, keyboard and touchscreen are dead. In fact they  
>are probably visible by kernel (ts_calibrate and ts_test for example, 
>works OK and cat /dev/input/event0 shows "usuall" garbage on  
>terminal) however I don't know how to start them to work with Qt. 
>I successfully started them earlier?while using TinyX and GTK, by 
>simply quoting them?with xinit command parameters. 
>But don't know how to do the same with Qt.  
Hi,

there are two things to consider:

1. Check if there are drivers enabled in buildroot config. The
    default configuration does not include any drivers. I stepped in
    this trap when I started to use QT.

BTW: Shouldn't we change this to some useful default?

2. QT needs environment variables to configure input devices.

http://doc.qt.digia.com/4.7/qt-embedded-envvars.html

Hope this helps

Stephan



>
>Regards  
>
_______________________________________________
buildroot mailing list buildroot at busybox.net http://lists.busybox.net/mailman/listinfo/buildroot  


-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64 http://www.relinux.de/ sho at reLinux.de   
_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121125/ef2c18dc/attachment.html>
