From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Nov 2011 18:58:31 +0100
Subject: [Buildroot] LIBFOO_SITE in .mk file
In-Reply-To: <CAAXf6LV8ArEeuQ=w3r7745AK00t2XqtSoLqv+tBc9rnpjS8sCQ@mail.gmail.com>
References: <003b01cca958$91486a00$0400a8c0@dspcgrnzks9p98>
 <201111281139.37028.minimod@morethan.org>
 <002701ccadfe$961b9430$0400a8c0@dspcgrnzks9p98>
 <201111281324.38619.minimod@morethan.org>
 <003601ccae04$ada02e80$0400a8c0@dspcgrnzks9p98>
 <003801ccae12$a7781190$0400a8c0@dspcgrnzks9p98>
 <003901ccae1b$2d82f950$0400a8c0@dspcgrnzks9p98>
 <20111129083710.1a83fad6@skate>
 <001201ccaea3$3ad7df70$0400a8c0@dspcgrnzks9p98>
 <20111129153619.4f080721@skate>
 <001301ccaea5$37ec1f40$0400a8c0@dspcgrnzks9p98>
 <001401ccaedf$e5751f60$0400a8c0@dspcgrnzks9p98>
 <001501ccaee8$34c408d0$0400a8c0@dspcgrnzks9p98>
 <000b01ccaf79$085d0800$0400a8c0@dspcgrnzks9p98>
 <20111130170450.2f33e6c2@skate>
 <000c01ccaf7c$01f3c460$0400a8c0@dspcgrnzks9p98>
 <20111130173327.069f46fb@skate>
 <000d01ccaf7e$78243280$0400a8c0@dspcgrnzks9p98>
 <CAAXf6LV8ArEeuQ=w3r7745AK00t2XqtSoLqv+tBc9rnpjS8sCQ@mail.gmail.com>
Message-ID: <20111130185831.2694b179@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 30 Nov 2011 18:48:13 +0100,
Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :

> * create two different packages, one for ethercat and one for the
> ethercat driver. Each would have a .mk file in a package/* directory.

I don't agree here. This will make it hard to keep both things in sync.

The build system of EtherCAT seems to integrate both the build of the
kernel-space parts and the user-space parts, and it's probably doable
inside a single package.

> * create one .mk file, but with two different sets of build rules, one
> for the application and one for the driver. You can make sure that one
> depends on the other so that they're always built together. If the
> application is autotools-based, you can use the AUTOTOOLS
> infrastructure. For the driver I suggest the GENTARGETS one (see
> below).

I haven't had the time to look closely, but it seems like the
autotools-based build system triggers the build of the kernel parts. At
least, the kernel part is described by a Kbuild.in file that needs to
be processed by autoconf before being able to build the kernel side
part. So definitely, the userspace parts and kernelspace parts are
related in terms of build system.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
