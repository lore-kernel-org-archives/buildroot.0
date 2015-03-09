From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Mar 2015 17:39:46 +0100
Subject: [Buildroot] [PATCH] wpa_supplicant: install systemd service
 files
In-Reply-To: <CANPyyuP2hrGF=UwKEY=NbAZDmyXdaVzd_osYvncbZbM+12-vvA@mail.gmail.com>
References: <1425411738-3369-1-git-send-email-mike@mikebwilliams.com>
 <20150304213345.6c41d0e8@free-electrons.com>
 <CANPyyuP2hrGF=UwKEY=NbAZDmyXdaVzd_osYvncbZbM+12-vvA@mail.gmail.com>
Message-ID: <20150309173946.75079320@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mike Williams,

On Mon, 9 Mar 2015 12:08:48 -0400, Mike Williams wrote:

> > Also, and sorry for being so ignorant about systemd, but most of our
> > other packages set up a bunch of symbolic links when install systemd
> > unit files. I'm surprised to not see the same thing here. Can you give
> > some details about this?
> 
> Those symlinks enable starting those services during boot. These
> services shouldn't be enabled by default, so no symlinks are
> generated.

Ok, but right now our policy is that services select in the Buildroot
configuration should be enabled at startup by default.

I know this is not the proposal you made in
http://lists.busybox.net/pipermail/buildroot/2015-March/121448.html,
but the proposal you made on this specific topic is going completely in
the opposite direction of what Buildroot is doing right now.

The reason for the current policy is that we want a simple "out of the
box" experience: you enable lighttpd or minidlna, you build, you boot
the system, and those services start by default, with a sane minimal
configuration. It's kind of the principle of "least surprise" I would
say.

Then if you want some services to have a more complex configuration, or
to not start at boot time, it's up to you to do what's needed in your
post-build script or rootfs overlay.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
