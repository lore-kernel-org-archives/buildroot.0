From: John Voltz <john.voltz@gmail.com>
Date: Fri, 29 Aug 2008 14:13:08 -0400
Subject: [Buildroot] xserver help
In-Reply-To: <48B83724.2060709@carallon.com>
References: <48B83724.2060709@carallon.com>
Message-ID: <46a136670808291113v4695d5dcm1f6d8fa893869b8a@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>
>
> I'm trying to get the x.org server up and running for an x86 target with
> intel 945G
> graphics chip.
>
> I have been running into a number of errors and was hoping for some help.
>
> First off I am not sure which packages I should select, there are a lot of
> packages and I
> have no recent experience with x11. Does someone have an example
> configuration they could
> send me so I can see what packages you are selecting? Is there anywhere
> with documentation
> on all the packages and which ones are needed to get the xserver running?
>
> Any help much appreciated.
>
> Will
> --


First you need to decide whether you want to use the tinyX (also known as
kdrive or framebuffer X) or the modular X.org server. Then you need the X
libraries, I would just select them all, unless your file system space is
limited. Then select the fonts you want. And last, if you are building the
modular system, you need the xdriver_xf86-video-intel for your video, then
the mouse (xdriver_xf86-input-mouse) and keyboard
(xdriver_xf86-input-keyboard) drivers. You will need to create an xorg.conf
file for your system as well, and save it to /etc/X11/xorg.conf. I think
there is an example in the default target skeleton directory in buildroot.

On your first boot you will also need to run fontconfig to build your font
cache, or it will take bloody ages for any applications to start in X. Make
sure your fonts end up in /usr/share/X11/fonts, or make a symbolic link to
them from there.

Regards,

John
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080829/acdd5dd5/attachment.htm 
