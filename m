From: Alexander Trousevitch <trousev@yandex.ru>
Date: Thu, 11 Mar 2010 18:00:12 +0300
Subject: [Buildroot] [Mesa] [x11] Where can i get /lib/dri/* files?
Message-ID: <4bdad2c51003110700s41716b65jfb8b16e42b8a5d12@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello, All!

First of all, thank you for answering my first question  (about
not-moving-mouse). This helped a lot.

I'm using latest buildroot (2010.02).

I've modified xorg-server package to enable Xnest (i need it). It compiles
well.

Now, i've started my xserver and i'm trying to launch Xnest on it:

X &
DISPLAY=:0 Xnest :1 -query 192.168.1.200 2> N.err

but no target machice screen but white bar appears. I can see in N.err there
error messages:

 (EE) AIGLX error: dlopen of /usr/lib/dri/swrast_dri.so failed
(/lib/dri/swrast_dri.so: cannot open shared object file: No such file
or directory)
 (EE) GLX: could not load software renderer

As i understood, i should compile mesa library with some special parameters
to make these libs (/lib/dri/*) too.

What exactly should i write to my packages/X11r7/mesa3d/mesa3d.mk to make
these libs? (or should i write something to other location?)
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100311/f3091f8f/attachment.htm>
