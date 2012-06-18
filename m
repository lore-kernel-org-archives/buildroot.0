From: Dmitry Golubovsky <golubovsky@gmail.com>
Date: Sun, 17 Jun 2012 22:45:20 -0400
Subject: [Buildroot] Has anybody got systemd to work?
Message-ID: <CADiAo4JeiZT7foLgagzuO+Xjb6uFX-TFms_+e0TcuF4DBpcrcg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am trying to boot a root FS built with systemd acting as init.

Looks like it fails in src/mount-setup.c, function
mount-group-controllers, ca. line 193.

I get an error message

Failed to parse /proc/cgroups.

as a result of

if (fscanf(f, "%ms %*i %*i %i", &controller, &enabled) != 2)

failing to parse /proc/cgroups.

I changed %ms to %s and added explicit malloc right before (only in
that file, mount-setup.c). I was able to get a bit further, but failed
on another instance of fscanf with %ms (anf there seem to be more
files with %ms

Is %ms format (pre-malloc a value buffer) or %as format supported in
uClibc in principle, or can it be enabled via specific configutration,
or expected in future versions?

I use uClibc 0.9.33

Has anybody seen this?

Thanks.

-- 
Dmitry Golubovsky

Anywhere on the Web
