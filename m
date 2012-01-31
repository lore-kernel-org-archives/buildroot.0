From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Jan 2012 17:22:42 +0100
Subject: [Buildroot] lib files
In-Reply-To: <CAPeX=+vjLjg2vZL50NgSD-TozqDXtq8R3Anj=PNvCoCtTd0+EA@mail.gmail.com>
References: <CAPeX=+vjLjg2vZL50NgSD-TozqDXtq8R3Anj=PNvCoCtTd0+EA@mail.gmail.com>
Message-ID: <20120131172242.3a84c018@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 31 Jan 2012 18:01:01 +0200,
Ozgun <ozgun.gunay@gmail.com> a ?crit :

> I built rootfs with opengl and QT without problem. (The compiled examples
> of QT also run in ubuntu without problem)
> But when I tried to run these qt examples in created rootfs, it gives "file
> not found" error. (I both tried these examples static and shared compiled.)

Can you show exactly how this error appears? If it appears when you try
to run the application, then it usually means that the kernel can't
find your dynamic library loader.

I never use Buildroot to generate a filesystem in which I'm chroot-ing.
If the target architecture is the same as the host, it should work, but
there might be issues, it's not the common use case for Buildroot
(usually, you take the generated root filesystem image and put it on a
target device).

> Then I cheked the dependency of application, you can see results below.
> The /usr/lib folder has the lib files but in a .a format.
> For example libm.a is exist but libm.so absent.

The shared versions of the C library and related libraries (libm, etc.)
are in /lib, not in /usr/lib.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
