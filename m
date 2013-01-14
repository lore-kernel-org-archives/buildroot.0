From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Jan 2013 12:04:16 +0100
Subject: [Buildroot] Currently packaging Qt5
In-Reply-To: <CAHQn0kiUCGte++HwWEgW6=awTCZ0FNN7kxZ9LxVBnek2p2qZWA@mail.gmail.com>
References: <20130114105802.1199d10e@skate>
 <CAHQn0kiUCGte++HwWEgW6=awTCZ0FNN7kxZ9LxVBnek2p2qZWA@mail.gmail.com>
Message-ID: <20130114120416.42b34d77@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Daniel Nystr?m,

On Mon, 14 Jan 2013 11:50:48 +0100, Daniel Nystr?m wrote:
> Very appreciated! Do you know if there is OpenGL support for i.e. OMAP
> (PowerVR) in Buildroot and, if that's the case, will Qt5 make use of that?
> 
> I once started with a PowerVR package for BR, but got interrupted and never
> had time to catch up. :/

For now, I have added support for the eglfs backend of Qt5, by using
the OpenGLESv2 and EGL implementations for the RasberryPi. I've also
added in the process virtual packages for libglesv2, libegl and
libopenvg, so that multiple implementations can be packaged for those
APIs.

However, I haven't looked at packaging the OMAP PowerVR stuff for now.
So if anyone wants to have a look, would be nice.

I currently have https://github.com/prabindh/sgxconfiguro (a set of
pkg-config files that apparently make it a bit easier to use the SGX
stuff), and http://gpupowered.org/node/8 opened in my browser, as
useful links regarding SGX stuff. Just in case someone wants to start
working on this.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
