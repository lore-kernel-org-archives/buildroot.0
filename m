From: Lennart Ramberg <ramberg.lennart@gmail.com>
Date: Tue, 18 Nov 2014 15:01:38 +0100
Subject: [Buildroot] Init and Supervisor start. Help please.
Message-ID: <CAEzGmjDXJ89vvGVfFBk4d3yJ3vbvjLA457yj6Gi_kYZYpct70Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

How should supervisor be automatically started?
Is the below way to go (kiosk mode) in principle right?

/boot/grub/grub.cfg:

set default="0"
set timeout="5"

menuentry "Buildroot" {
    linux /bzImage root=/dev/sda1 init=/usr/bin/supervisord
}

Setting init=/myprogram worked as expected. But but experimenting
with letting supervisord start myprogram just caused kernel panic,
so maybe I'm heading the wrong way?

Using Buildroot_2014.08.

Thanks in advance.
Lennart
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141118/b472dd5e/attachment.html>
