From: Andrey Rodionov <ravonereal@gmail.com>
Date: Wed, 10 Dec 2014 19:39:19 +0300
Subject: [Buildroot] Can't run Weston. Gtk 3.14, Wayland 1.6
Message-ID: <CANjMeV+DBdmFGx+T0C-Odaby0r3kHdROkk099n+-ak6giTnDMg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

My device on ARM9 CPU, has only touchscreen, no keyboard. I try to use on
it GTK3 and Wayland as backend, compiled with Buildroot2014.11.


Start Weston:
openvt -c 2 -s -- weston --backend=/usr/lib/weston/fbdev-backend.so
--tty=2  --log=/tmp/weston.log


weston.log:
Date: 1970-01-01 UTC
[00:17:31.159] weston 1.6.0
               http://wayland.freedesktop.org/
               Bug reports to:
https://bugs.freedesktop.org/enter_bug.cgi?product=Wayland&component=weston&version=1.6.0
               Build: 1.5.93-5-g2858cc2 configure.ac: bump version to 1.6.0
(2014-09-19 13:40:14 +0300)
[00:17:31.161] OS: Linux, 3.2.1, #312 PREEMPT Wed Dec 10 12:57:07 MSK 2014,
armv5tejl
[00:17:31.162] warning: XDG_RUNTIME_DIR "/tmp" is not configured
correctly.  Unix access mode must be 0700 (current mode is 777),
and must be owned by the user (current owner is UID 0).
Refer to your distribution on how to get it, or
http://www.freedesktop.org/wiki/Specifications/basedir-spec
on how to implement it.
[00:17:31.165] Starting with no config file.
[00:17:31.166] Loading module '/usr/lib/weston/fbdev-backend.so'
[00:17:31.213] initializing fbdev backend
[00:17:31.217] Creating fbdev output.
[00:17:31.218] Opening fbdev frame buffer.
[00:17:31.218] Calculating pixman format from:
                - type: 0 (aux: 0)
                - visual: 2
                - bpp: 24 (grayscale: 0)
                - red: offset: 16, length: 8, MSB: 0
                - green: offset: 8, length: 8, MSB: 0
                - blue: offset: 0, length: 8, MSB: 0
                - transp: offset: 0, length: 0, MSB: 0
[00:17:31.220] Mapping fbdev frame buffer.
[00:17:31.222] fbdev output 480??272 px
               guessing 60 Hz and 96 dpi
[00:17:31.231] launching '/usr/libexec/weston-keyboard'
[00:17:31.237] input device ADS7846 Touchscreen, /dev/input/event0 is a
touch device
[00:17:31.239] Compositor capabilities:
               arbitrary surface rotation: yes
               screen capture uses y-flip: yes
[00:17:31.254] Loading module '/usr/lib/weston/desktop-shell.so'
[00:17:31.438] launching '/usr/libexec/weston-desktop-shell'
[00:17:32.561] input_method died, respawning...
[00:17:32.562] launching '/usr/libexec/weston-keyboard'
[00:17:32.919] Error: /usr/libexec/weston-desktop-shell apparently cannot
run at all.
               Quitting...[00:17:32.940] Destroying fbdev output.
[00:17:32.941] Disabling fbdev output.
[00:17:32.941] Destroying fbdev frame buffer.

What problem with the launch of Weston?

Andrey.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141210/029c04a5/attachment.html>
