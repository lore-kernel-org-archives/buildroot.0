From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 02 Aug 2014 00:02:17 +0200
Subject: [Buildroot] [PATCH v16 1/3] xbmc: Add X.org/OpenGL support
References: <1406914359-31106-1-git-send-email-bernd.kuhls@t-online.de>
 <1406914359-31106-2-git-send-email-bernd.kuhls@t-online.de>
 <20140801213036.GE3778@free.fr>
Message-ID: <XnsA37D62E96EAberndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"Yann E. MORIN" <yann.morin.1998@free.fr> wrote in 
news:20140801213036.GE3778 at free.fr:

> We currently do not disable rsxs, and XBMC builds just fine on the RPi.
> However, we remove it from the rootfs as a post-install hook.
> 
> What's the problem with rsxs on EGL/GLES?

Hi,

according to xbmc configure rsxs depends on opengl only:
https://github.com/xbmc/xbmc/blob/Gotham/configure.in#L1469

This can be confirmed when looking the rsxs configure:
https://github.com/xbmc/xbmc/blob/Gotham/xbmc/screensavers/rsxs-
0.9/configure.ac#L97

I am surprised that rsxs is build at all with egl/gles only.
My patch just follows the configure system of xbmc.

Regards, Bernd
