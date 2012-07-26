From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 Jul 2012 13:44:50 +0200
Subject: [Buildroot] (no subject)
In-Reply-To: <1343300170.3681.YahooMailNeo@web164604.mail.gq1.yahoo.com>
References: <1343300170.3681.YahooMailNeo@web164604.mail.gq1.yahoo.com>
Message-ID: <20120726134450.5f97558b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Next time, could you please put a meaningful topic in the "Subject:"
line of your e-mail client?

Le Thu, 26 Jul 2012 03:56:10 -0700 (PDT),
Zoran Djordjevic <djdjdjole@yahoo.com> a ?crit :

> I somehow managed to start Thiny X server (ARM board) with twm.

Tiny X, not Thiny X.

> However I didn't succeed to attach neither USB keyboard
> nor USB mouse, although messages (at serial console) reported
> recognition of that devices. 
> There is no mouse node (in /dev) - I am using mdev. 

You should have a /dev/input/event[0-9] device file for your keyboard
and for your mouse. You can test it easily: do cat /dev/input/event0,
can then move your mouse. If you see crap displayed on the screen,
you're all set, your mouse works. If not, try with /dev/input/event1
and the following ones.

If you have no /dev/input/eventX device files, then adjust your kernel
configuration.

> So I am stucked at the moment. I don't know if Thiny X can 
> work with USB mouse/keyboard at all ?

KDrive (which is the new name for TinyX) supports all evdev-compliant
devices, which means all devices that use the Linux input subsystem. So
basically, yes USB keyboard and mice should just work.

> Also interested if applications that are intended for X server
> will run with Thiny X ?

Yes, they will work. KDrive implements the X11 protocol, so basically
all X applications should work. However, applications using OpenGL, or
maybe requiring some advanced X protocol extensions may not work, but
for most basic 2D applications, it just works.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
