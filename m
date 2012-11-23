From: Zoran Djordjevic <djdjdjole@yahoo.com>
Date: Thu, 22 Nov 2012 22:52:55 -0800 (PST)
Subject: [Buildroot] [Qt] Qt framebuffer for ARM
In-Reply-To: <7054975.hZU6daKNYx@localhost.localdomain>
References: <1353610362.49694.YahooMailNeo@web164605.mail.gq1.yahoo.com>
 <7054975.hZU6daKNYx@localhost.localdomain>
Message-ID: <1353653575.32303.YahooMailNeo@web164604.mail.gq1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It seems to me so, about the wrong options, but options I do
passed was in graphical menues of IDE. So I?went to?menu
Project Options and in?Dialog box "Options for project",?
item - "Compiler options" and subitem "Other", I entered
"-dQTOPIA -k-L/home/djdjdjole/lazarus/fpc/libcross"?.
In Building mode subitem I entered LCLWidgetType -qt.
There must be some missunderstanding from my side.
Lazarus?version is 1.0 (GTK).
?
Regards
 

________________________________
 From: Den Jean <Den.Jean@telenet.be>
To: Items specific to the Qt widget set <qt@lists.lazarus.freepascal.org> 
Sent: Thursday, November 22, 2012 10:09 PM
Subject: Re: [Qt] Qt framebuffer for ARM
  
Zeljko,
?  FYI : http://forum.lazarus.freepascal.org/index.php/topic,18957

> I have success when using GTK over X11 for ARM, but now I want to try Qt with
> -qws option ie. using framebuffer. 
> I successfuly used Qt (over X11) on desktops, using Lazarus. Also I successfully 
> built libqt4pas.so for ARM and when tried to compile Qt project for ARM (also
> added -dQTOPIA in options), got few errors at linking phase, all starting with:
> undefined reference to QX11Info....
QX11Info seems properly ifdefed so you did not pass correctly the options.

make PREFIX=/usr clean all LCL_PLATFORM=qt OPT="-dQTOPIA"

> Where I go wrong and is it possible at all to crosscompile Qt project with Lazarus
> which would not use X11 but framebuffer?
There are alot of fixes for X11 and MSWINDOWS in lcl/qt 
so I do not know the state of Lazarus on Qt Qtopia/QWS

grep -e? 'HASX11\|MSWINDOWS' /storage/svn/lazarus/lcl/interfaces/qt/*.p*? | wc -l
reveals 141 Windows or X11 specific fixes. No work specifically has been done for Qtopia


regards,

Jan



_______________________________________________
Qt mailing list
Qt at lists.lazarus.freepascal.org
http://lists.lazarus.freepascal.org/mailman/listinfo/qt
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121122/a259a9b3/attachment-0001.html>
