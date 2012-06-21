From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Jun 2012 14:28:48 +0200
Subject: [Buildroot] preparing rootfs with gcc in buildroot
In-Reply-To: <CAGXs5wVgC+e_BUAOPgvL-vGqo4pusF3iTLFz_7Fb_Jfvrvv+Hg@mail.gmail.com>
References: <CAGXs5wVgC+e_BUAOPgvL-vGqo4pusF3iTLFz_7Fb_Jfvrvv+Hg@mail.gmail.com>
Message-ID: <20120621142848.4caafde0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 21 Jun 2012 15:16:14 +0300,
Kevin Wilson <wkevils@gmail.com> a ?crit :

> I run:
> make menuconfig
>   Package selection for target
>      Development tools
>         "gcc needs development files in target filesystems"

Yes, you have to enable BR2_HAVE_DEVFILES (in Build options).

However, beware that the usage of the native toolchain on the target is
rarely used and tested by Buildroot developers. Buildroot is here to
cross-compile all your applications and libraries, so it generally
doesn't make much sense to have a native toolchain on the target, so we
don't pay too much attention to this.

What would you like to build on your target? Why don't you
cross-compile it?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
