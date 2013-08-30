From: eric.le.bihan.dev at free.fr <eric.le.bihan.dev@free.fr>
Date: Fri, 30 Aug 2013 18:38:14 +0200 (CEST)
Subject: [Buildroot] [PATCH 1/1] systemd: bumped to version 206
In-Reply-To: <20130830163635.39ccd4cd@skate>
Message-ID: <221109548.81879318.1377880694250.JavaMail.root@zimbra32-e6.priv.proxad.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> However, now that udev is part of systemd, some of this needs to
> change. What is your plan regarding that?

Oops! I missed this part! I've just found out I had two copies of 
libudev.so on my target (/lib/libudev.so.0.13.1 and /usr/lib/libudev.so.1.3.7).

> May I suggest you to go through the thread at
> http://lists.busybox.net/pipermail/buildroot/2013-March/068130.html,
> which contains a large discussion about systemd/udev that started the
> last time a contributor posted an updated to the systemd package.

Thanks for pointing it out to me. Yocto project gets around this problem
thanks to its packaging system (the 'udev' feature is provided by either
udev-182 or systemd-206 recipe). Enabling udev only if systemd is the
selected init system seems to be the easiest solution, but would it not
restrict the user?

I'll see if I can make the udev package depends on systemd and only grab
the interesting pieces.

BTW, a great feature of Buildroot is to provide means to build images for
a wide range of embedded devices: from small ones with limited resources
(where Busybox init + mdev is a perfect combination) to beefy ones (which
could handle systemd + udev).

I initially updated Systemd because I wanted to see if it could be usable
on embedded devices. I am looking for an init system with supervision
capabilities and successfully used Buildroot with runit an s6. Both are
more suitable (system-journald consumes too much memory for my purpose).
