From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 11 Feb 2016 21:52:09 +0100
Subject: [Buildroot] Setting RGB
In-Reply-To: <1455203390156-125571.post@n4.nabble.com>
References: <CAKvcKqdfjtx96fk=cjMze7sOeY59OfWy1NZ2c_LY8TsuZ29DMA@mail.gmail.com>
 <20160204205505.5a842de4@gmx.net>
 <1455126039107-125494.post@n4.nabble.com>
 <CAAEAJfBS36gKR3P_-MZ888yMi4y=piVN=x77F07z0-+=Bpxv0Q@mail.gmail.com>
 <1455203390156-125571.post@n4.nabble.com>
Message-ID: <20160211215209.2f381cc0@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Gabriel Andr?s Castillo,

On Thu, 11 Feb 2016 07:09:50 -0800 (PST), GabrielCastillo <gcastillo@controlnet.com.ar> wrote:

> Definitely the problem is with QT5. I read some places that could be
> littleendian problem. To run my app, i do:
> 
> > ./App -platform linuxfb
> 
> There are any form to tell that it has to be execute in littleendian or
> bigendian?
> 

No, no such option for qt5 (see [1] for linuxfb options).

Mind to run 'fbset -s' (or 'fbset -i') on your platform ?

Output gives the pixel defintion of the framebuffer, e.g.

rgba 5/11,6/5,5/0,0/16

for my adafruit display (and try to test if the given
pixel defintion is correct by writing color patterns
to the framebuffer (direct or with some framebuffer
test program)...

Or mind to try the following atmel qt5 patch ([2]) from
the OpenEmbedded/Yocto layer?

This patch gives you a hint for the place where to fix/adjust the
qt5 drawing to the framebuffer...

Regards,
Peter


[1] http://doc.qt.io/qt-5/embedded-linux.html
[2] https://github.com/linux4sam/meta-atmel/blob/master/qt5-layer/recipes-qt/qt5/files/atmel-color-format-force.patch

> 
> 
> --
> View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/Setting-RGB-tp124903p125571.html
> Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
