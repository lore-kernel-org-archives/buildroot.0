From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Jul 2012 16:11:03 +0200
Subject: [Buildroot] [PATCH 1/3] gpsd: proper usage of prefix and DESTDIR
In-Reply-To: <CAHt8ZCOxSscd=-b4OMYqXtt3a0Y3hZ5276T4pOfk-JR+pQOXyw@mail.gmail.com>
References: <1343167832-14198-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAHt8ZCM=ZcbkOSpGzOJg-1sRK8tbrcZe8z5q5vbsy2-vG0p4wg@mail.gmail.com>
 <20120725102242.77a06eca@skate>
 <CAHt8ZCPHv7MR=WAvPRL5PxiTp=NsgDkhWKFusCEYgxiBtZPWXg@mail.gmail.com>
 <20120725105508.1c7179df@skate>
 <CAHt8ZCOxSscd=-b4OMYqXtt3a0Y3hZ5276T4pOfk-JR+pQOXyw@mail.gmail.com>
Message-ID: <20120725161103.0ee904c6@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 25 Jul 2012 11:35:44 +0100,
Simon Dawson <spdawson@gmail.com> a ?crit :

> On 25 July 2012 09:55, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
> > Can you share a defconfig that shows the problem? I've tested the
> > build with BR2_PACKAGE_PYTHON + BR2_PACKAGE_GPSD, and it just
> > builds (even though the output is completely incorrect: the gpsd
> > Python modules are installed in the wrong location and are built
> > for the host rather than the target).
> 
> BR2_arm=y
> BR2_arm926t=y
> BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
> BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
> BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
> BR2_TOOLCHAIN_BUILDROOT_CXX=y
> BR2_PACKAGE_MPFR=y
> BR2_PACKAGE_GPSD=y
> BR2_PACKAGE_GPSD_NTP_SHM=y
> BR2_PACKAGE_PYTHON=y
> BR2_PACKAGE_PYTHON_PY_PYC=y
> BR2_PACKAGE_PYTHON_NFC=y

This configuration builds fine here. So I guess the difference is that
I build inside a chroot in which I have almost no development package
installed in the host, and you build in your normal development
machine, on which you have many development packages installed, and
those are influencing the build somehow.

For now, I would suggest that we leave the Python support in gpsd on
the side, until someone who actually needs it steps up to fix the
issues. So I'll force python=no unconditionally. Do you agree with this?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
