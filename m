From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Jan 2012 17:05:25 +0100
Subject: [Buildroot] Generating a 32-bit toolchain on a 64-bit machine
In-Reply-To: <CAAXf6LXeu+ftimzd=ydJAnwTry6BgZ4QXJ4qhUFnLWyNE3NhfQ@mail.gmail.com>
References: <CAAXf6LXeu+ftimzd=ydJAnwTry6BgZ4QXJ4qhUFnLWyNE3NhfQ@mail.gmail.com>
Message-ID: <20120102170525.79f91811@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 2 Jan 2012 16:42:01 +0100,
Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :

> In crosstool-ng I didn't find such an option either...

I did so with crosstool-ng. I created a Debian 32 bits chroot on my 64
bits machine and did the build in here. I had to force ABI=32 to
the ./configure script of GMP to get it to build properly, though,
since it gets confused by the fact of having a 64 bits kernel and a 32
bits userspace. My reason for using a chroot is also because I wanted
the toolchain to be built against an old version of the C library, so
as to be compatible with as many hosts as possible.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
