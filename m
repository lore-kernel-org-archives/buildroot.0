From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Aug 2016 22:08:37 +0200
Subject: [Buildroot] Unable to choose libgtk3 when using rpi-userland
 package
In-Reply-To: <trinity-13a6383e-07ec-45b6-b051-a97025e073e3-1471607022160@3capp-gmx-bs60>
References: <trinity-13a6383e-07ec-45b6-b051-a97025e073e3-1471607022160@3capp-gmx-bs60>
Message-ID: <20160819220837.184205f5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 19 Aug 2016 13:43:42 +0200, Michael Toldo wrote:

> I'm trying to set up buildroot for my Raspberry Pi so I can use it as
> a lightweight kiosk device. For this I want to install Midori which
> is based on the libgtk3. When using rpi-userland (OpenGL is included
> there) I cannot select the libgtk3 package. Following info is
> displayed: *** libgtk3 needs an OpenGL or OpenGL EGL backend provided
> by mesa3d ***

There has been some discussion on the IRC channel today about this
question. libgtk3 requires either an OpenGL implementation, or an EGL
implementation that provides egl-wayland.

rpi-userland provides neither OpenGL, nor an egl-wayland
implementation, which explains why you cannot select rpi-userland.

Of course, this is our current understanding of what rpi-userland
provides, and what libgtk3 requires. If you believe this is wrong and
you're able to make things work differently, let us know.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
