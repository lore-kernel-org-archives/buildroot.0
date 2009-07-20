From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 20 Jul 2009 19:58:41 +0200
Subject: [Buildroot] standard libc libm support
In-Reply-To: <58243.172.16.221.10.1248082385.squirrel@172.16.0.251>
	(nfrench@xtale.biz's message of "Mon\,
	20 Jul 2009 09\:33\:05 -0000 \(Europe\/London\)")
References: <58243.172.16.221.10.1248082385.squirrel@172.16.0.251>
Message-ID: <874ot7fd7y.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "nfrench" == nfrench  <nfrench@xtale.biz> writes:

 nfrench> Will there be any chance of libm and libc support /
 nfrench> options. NVIDIA OpenGL drivers a bit of a problem at the
 nfrench> moment. ( I know its due to them being closed source but
 nfrench> they are fast and with the ION chip very good).
 >> 
 >> What exactly are you missing regarding math support?

 nfrench>  ldd /usr/lib64/libGL.so.185.18.14
 nfrench>         linux-vdso.so.1 =>  (0x00007fff789a1000)
 nfrench>         libGLcore.so.1 => /usr/lib64/libGLcore.so.1 (0x00007f3e9d1e0000)
 nfrench>         libnvidia-tls.so.1 => /usr/lib64/tls/libnvidia-tls.so.1
 nfrench> (0x00007f3e9d0de000)
 nfrench>         libm.so.6 => /lib/libm.so.6 (0x00007f3e9cf5e000)
 nfrench>         libXext.so.6 => /usr/XORG/lib/libXext.so.6 (0x00007f3e9ce4c000)
 nfrench>         libX11.so.6 => /usr/XORG/lib/libX11.so.6 (0x00007f3e9cc3c000)
 nfrench>         libdl.so.2 => /lib/libdl.so.2 (0x00007f3e9cb38000)
 nfrench>         libc.so.6 => /lib/libc.so.6 (0x00007f3e9c90e000)
 nfrench>         libXau.so.6 => /usr/XORG/lib/libXau.so.6 (0x00007f3e9c80b000)
 nfrench>         libXdmcp.so.6 => /usr/XORG/lib/libXdmcp.so.6 (0x00007f3e9c706000)
 nfrench>         /lib/ld-linux-x86-64.so.2 (0x00007f3e9e6eb000)

 nfrench> says it all really, Unfortunately I have no control over NVIDIA :-)

I still don't understand what the problem is. I take it that the above
is from a glibc compilation? From a recent x86-64 build:

ls ./lib
ld64-uClibc-0.9.30.1.so  libgcc_s.so.1           libresolv.so.0
ld64-uClibc.so.0         libm-0.9.30.1.so        librt-0.9.30.1.so
libcrypt-0.9.30.1.so     libm.so.0               librt.so.0
libcrypt.so.0            libnsl-0.9.30.1.so      libuClibc-0.9.30.1.so
libc.so.0                libnsl.so.0             libutil-0.9.30.1.so
libdl-0.9.30.1.so        libpthread-0.9.30.1.so  libutil.so.0
libdl.so.0               libpthread.so.0
libgcc_s.so              libresolv-0.9.30.1.so

E.G. it gives you a libm-*.so

Or is the the problem that the nvidia libGL*.so is closed source and
linked against glibc? Then I guess you're forced into using an
external glibc toolchain.

-- 
Bye, Peter Korsgaard
