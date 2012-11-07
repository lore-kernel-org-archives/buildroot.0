From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Wed, 07 Nov 2012 14:31:20 +0100
Subject: [Buildroot] basic Qt questions
In-Reply-To: <1352292973.99906.YahooMailNeo@web164602.mail.gq1.yahoo.com>
References: <1352292973.99906.YahooMailNeo@web164602.mail.gq1.yahoo.com>
Message-ID: <509A62A8.9040507@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Zoran,

yes, you can use easily the Linux framebuffer, and also there is a
-> Package Selection for the target
? -> Graphic libraries and applications (graphic/text)
? -> Qt (BR2_PACKAGE_QT [=y])
? ->BR2_PACKAGE_QT_DEMOS

what you can select, and xou can test your fb configuration with the 
applications listed in the qt-4.8.3/demos/embedded library in the Qt 
source tree

The color depth could be a pitfall here, you have to check
the color depth according to your framebuffer settings here:

-> Package Selection for the target
? -> Graphic libraries and applications (graphic/text)
? -> Qt (BR2_PACKAGE_QT [=y])
? -> Gui Module (BR2_PACKAGE_QT_GUI_MODULE [=y])
? -> Pixel depths

about the rest of the drivers you can read a summary here: 
http://doc.qt.digia.com/qt/qt-embedded-displaymanagement.html

good luck!
--
Zoltan Gyarmati


On 11/07/2012 01:56 PM, Zoran Djordjevic wrote:
> I've build linux with GTK support and now I want to try Qt.
> I was using TinyX with frame buffer support. So I have directfb
> options selected in "Graphic libraries and application" menu.
> What I am interested about is the opitons
> (meaning + what to choose) regarding Qt->Graphics drivers
> menu (Linux Framebuffer is default choise but what the rest mean).
> Also is there some Qt samples that could be also built - like
> it was the case with GTK samples ?
> Regards
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
