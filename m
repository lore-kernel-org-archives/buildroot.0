From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Jan 2013 12:45:21 +0100
Subject: [Buildroot] Currently packaging Qt5
In-Reply-To: <50F3EDF8.6010203@lucaceresoli.net>
References: <20130114105802.1199d10e@skate> <50F3EDF8.6010203@lucaceresoli.net>
Message-ID: <20130114124521.1671c93e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Luca,

On Mon, 14 Jan 2013 12:37:28 +0100, Luca Ceresoli wrote:

> Are you going to leave the option in BR to use the old QT4?

Yes, I packaging Qt5 as a completely separate package from Qt4.

In fact, I'm even packaging it as multiple separate packages, because
they now provide split tarballs for various components of the Qt5
stack, which is great.

> I think it would be useful, mostly for boards having no OGLES
> acceleration, as well as to avoid any backward compatibility issues
> for old application code.

Of course. Note however that Qt5 doesn't require OpenGLES. There are
linuxfb and directfb backend that normally work with OpenGLES.

However, the linuxfb backend is crashing at the moment. I've already
sent one (easy) fix to the Qt guys, and reported the next crash.
They suggested some thing that didn't work, I'm still waiting for some
news.

So basically, the stuff will compile, I can build and run a basic QtCore
application, but there will be some work to runtime test all the
combinations of graphical backends and so on. I will not be testing
everything.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
