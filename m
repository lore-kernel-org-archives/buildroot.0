From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Jun 2013 10:57:10 +0200
Subject: [Buildroot] Issue with Qt5 and PowerVR drivers
In-Reply-To: <321768C95D21724485BCE784F1BE98473EB5E2E9@DBDE04.ent.ti.com>
References: <20130628143717.3e16fd9c@skate>
 <321768C95D21724485BCE784F1BE98473EB5E16F@DBDE04.ent.ti.com>
 <20130628161533.2dea9fdf@skate>
 <321768C95D21724485BCE784F1BE98473EB5E2E9@DBDE04.ent.ti.com>
Message-ID: <20130629105710.42fe04e0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Prabu,

Thanks for your reply.

On Fri, 28 Jun 2013 17:56:37 +0000, Sundareson, Prabindh wrote:

> I see. For 5.0.2 you may not need the eglfs patch at all I think.

The patch was definitely needed. Without it, I'm getting the error "EGL
Error : Could not create the egl surface: error = 0x3003" which you
mentioned in
http://tigraphics.blogspot.fr/2013/02/qt500-eglfs-could-not-create-egl.html.
Applying your patch made the error go away.

> >> The 5.0.2 version, since 5.1 is still alpha (or beta?)
> 
> nullws - null window system, consider it a full screen "window"

Ok.

I see in
https://github.com/openwebos/qt/blob/master/src/plugins/gfxdrivers/eglnullws/README
that this nullws thing also exists in Qt4, and is useful to get more
performances when you're running a single OpenGL application, full
screen.

> >> Hum, what is nullws ?
> 
> 
> What you are seeing is exactly what is expected. My own results were published in the video below:
> 
> http://www.youtube.com/watch?v=Z9r8o2ToLRw

Ok, but then how is this usable? I believe there are many cases where
you will want to mix normal Qt widgets (buttons, menus, etc.) with one
OpenGL-capable Qt widget. How can one achieve that with Qt5?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
