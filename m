From: Filippo Sironi <filippo.sironi@gmail.com>
Date: Fri, 18 Apr 2014 17:00:47 +0200
Subject: [Buildroot] x11/input-evdev and touchscreen
Message-ID: <D18581C1-9C91-4453-8579-212E092B389F@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everyone,

I have an issue I cannot explain regarding X11/input-evdev.
I recently configured and built a root file system through buildroot 2014.02.
The root file system features X11 (1.12.4, but I also bumped it to 1.14.6) and the
input-evdev driver (2.7, but I also bumped it to 2.8).

NOTE: I cannot use HEAD on master since it provides X11 1.15 and I have to use the
Nvidia Tegra T20 drivers, which are available up to X11 1.14.

The embedded device I'm targeting has a touchscreen display; evtest shows that events
come from the touchscreen display to userspace but, unfortunately,  xinput test-xi2
does not, even though the touchscreen display appears among the xinputs.

The strange thing is that a very similar setup starting from the Ubuntu Core 13.10
root file system works flawlessly (I cannot use this solution since I do not have
enough space on my embedded device).

Do you know anything about a configuration switch I may have missed? I looked through
the configure script of input-evdev and there is nothing interesting.

Thanks,
Filippo
