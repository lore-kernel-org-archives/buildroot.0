From: Yves Deweerdt <yves.deweerdt.linux@gmail.com>
Date: Wed, 21 Jun 2017 20:35:21 +0000
Subject: [Buildroot] [PATCH 1/1] rpi0w: added support for Raspberry Pi
 Zero W
In-Reply-To: <20170620211945.1033a656@gmx.net>
References: <1497815044-11215-1-git-send-email-yves.deweerdt.linux@gmail.com>
 <20170619222753.7655732a@windsurf.home> <20170619225436.58ce3391@gmx.net>
 <CANv+TVOBnCqF6wdPxuiCVoRx85U3HTuzbT3h1qJKgVY2s52=xA@mail.gmail.com>
 <20170620211945.1033a656@gmx.net>
Message-ID: <CANv+TVP=7QF6+FRv8jfEtPDVG6jsbWO7cfGu+umEetErAEZHmQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter, Thomas,


> > For rpi3, is it correct that it seems that when running in 64bit mode you
> > should add enable_uart=1 and for 32 bit mode you don't need to add it?
>
> Never tried the 64bit mode (yet), any reference for this?
>
>
> Hello Peter, Thomas,

I just had a closer look to the raspberrypi3 and raspberrypi3_64 story.
It seems that on the 32 bit version the overlay is being used, which means
that the console is being put on /dev/ttyS0 in stead of /dev/ttyAMA0, which
means that /dev/ttyAMA0 is available already if you plan to use bluetooth.
On the 64 bit version, the console is put on /dev/ttyAMA0, so that means
that if you want to enable bluetooth, you need to do the same modifications
again to move console over to /dev/ttyS0 and free up /dev/ttyAMA0 for
bluetooth.

I don't know if there are any drawbacks in using the /dev/ttyS0 on the 64
bit version. If not, I would recommend making the 32 bit version and the 64
bit version do the same thing, and at that moment the --aarch64 option in
the post-image.sh script could be completely removed.

Kind regards,

Yves

>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170621/b72cb84d/attachment.html>
