From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Jun 2012 23:55:42 +0200
Subject: [Buildroot] preparing rootfs with gcc in buildroot
In-Reply-To: <js03ef$2qm$1@dough.gmane.org>
References: <CAGXs5wVgC+e_BUAOPgvL-vGqo4pusF3iTLFz_7Fb_Jfvrvv+Hg@mail.gmail.com>
 <20120621142848.4caafde0@skate>
 <CAGXs5wXPo4wtWY9H0Ec761e0zEUCa_3u3-YH04jzZcW_m=ju+Q@mail.gmail.com>
 <jrvjm2$sls$1@dough.gmane.org> <4FE38489.8060803@mind.be>
 <js03ef$2qm$1@dough.gmane.org>
Message-ID: <20120621235542.2e19e5be@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 21 Jun 2012 21:24:31 +0000 (UTC),
Grant Edwards <grant.b.edwards@gmail.com> a ?crit :

> Right -- if you have buildroot build your compiler.  If you're using
> an external compiler (e.g. one built separately with crosstool-ng),
> you need to tell it where buildroot's libraries and include files are.

No.

When you use an external toolchain in Buildroot, we generate a wrapper
that ensures that the external toolchain cross-compiler is always
properly called with the right argument.

Look at host/usr/bin/<arch>-linux-gcc, and you'll notice it's a symlink
to ext-toolchain-wrapper, which in turns calls the compiler. This
ext-toolchain-wrapper adds the --sysroot option.

So, regardless of whether you're using the internal toolchain backend,
the external toolchain backend, or the crosstool-ng toolchain backend,
you don't have to specify where the libraries and headers are. This was
done on purpose.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
