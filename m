From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Sep 2013 13:31:45 +0200
Subject: [Buildroot] GTK+ for framebuffer?
In-Reply-To: <20130903100905.GA324@zuhnb712.ap.bm.net>
References: <20130903100905.GA324@zuhnb712.ap.bm.net>
Message-ID: <20130903133145.370bb2d4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Woody Wu,

On Tue, 3 Sep 2013 18:09:06 +0800, Woody Wu wrote:

> It seems buildroot already has GTK.  Does it can build GTK+ for running
> on framebuffer (a.k.a, gtkfb)?

There used to be a DirectFB backend in Gtk, but it was always broken,
because nobody was maintaining it (in Gtk upstream). It was causing too
many problems in Buildroot to keep the support for such a broken
feature, so we removed it. People interested in running Gtk on DirectFB
should work with upstream to fix the issues and get the corresponding
patches merged.

These days, if you want to run Gtk, you should run X.org (which can run
on top of the framebuffer), or maybe you can explore Wayland (but I
guess it'll require Gtk 3.x, while we only have Gtk 2.x in Buildroot
for the moment).

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
