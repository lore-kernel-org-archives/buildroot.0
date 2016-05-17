From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 17 May 2016 12:58:24 +0200
Subject: [Buildroot] QtMultimedia and gstreamer-1.0
In-Reply-To: <573A36BC.90807@gmail.com>
References: <5738116B.9050904@gmail.com> <20160515100303.003752e2@gmx.net>
 <5738333D.8010707@gmail.com> <20160515140511.5973b7ce@gmx.net>
 <57386743.1030708@gmail.com> <20160516221806.0df441c0@gmx.net>
 <573A2BF3.1080701@gmail.com> <573A36BC.90807@gmail.com>
Message-ID: <20160517125824.203d2759@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Marco,

On Mon, 16 May 2016 23:08:12 +0200, Marco Trapanese <marcotrapanese@gmail.com> wrote:

> Il 16/05/2016 22:22, Marco Trapanese ha scritto:
> > I will try to ldd files under /usr/lib/qt/plugins/
> 
> 
> I attach to this email the output for:
> 
> ldd libgstmediaplayer.so
> 
> please, how to read the results?
> Two questions:
> 
> 1) "checking sub-depends for '/blabla.so' " means it found the 
> sub-depends, doesn't it?
> 
> 2) what does "checking sub-depends for 'not found'" mean???
> 
> It doesn't found libQt5OpenGL:
> 
> > libQt5OpenGL.so.5 => not found (0x00000000)
> 
> I guess due to the missing of "opengl" module.
> I'm rebuilding Qt5... let's see if it fixes.
> 

Enabling 'BR2_PACKAGE_QT5BASE_OPENGL_LIB=y' and doing

	$ rm build/qt5base-5.6.0/.stamp_staging_installed
	$ rm build/qt5base-5.6.0/.stamp_target_installed
	$ make

(and copy the new image to sd card, or copy only the missing libQt5OpenGL.so.5)
should do the trick...

Patch for qt5multimedia follows....

Regards,
Peter
