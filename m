From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Dec 2012 09:47:19 +0100
Subject: [Buildroot] Packet menu: X.org X Window System
In-Reply-To: <20121226022529.GA5440@zuhnb712.ap.bm.net>
References: <20121226022529.GA5440@zuhnb712.ap.bm.net>
Message-ID: <20121226094719.64380938@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Woody Wu,

On Wed, 26 Dec 2012 10:25:29 +0800, Woody Wu wrote:

> I feel a little confused in the 'X.org X Window System' packet menu.
> It present me with 'X Window System server' as well as 'X11R7
> servers'. Under 'X Window System server' I can choice TinyX, under
> the 'X11R7 servers', I can choice x.org server.  Is that a conflict?
> Or does it means, in additional to TinyX, I still need to pick up a
> X11R7 server to work with it?

There are two things:

 * The selection of the "Server Type" (i.e TinyX or Modular X.org)
 * The enabling or disabling of the X.org server

In fact, the X.org server can be compiled in two different flavors:

 * The modular X.org flavor, which is the one used on virtually all
   Linux distributions. In this flavor, the device drivers (video,
   input, etc.) are compiled separately from the X.org server and can
   be dynamically loaded.

 * The TinyX variant, in which drivers are directly bundled into the X
   server. Those drivers are more limited (in number), and are directly
   part of the X.org server code base (as opposed to the modular X.org,
   where each driver is a separate project, separate tarball.

It would probably be more clear to have the Server Type selection as a
sub-option of the X.org server selection.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
