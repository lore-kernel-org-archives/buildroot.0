From: Simon Dawson <spdawson@gmail.com>
Date: Wed, 25 Jul 2012 11:35:44 +0100
Subject: [Buildroot] [PATCH 1/3] gpsd: proper usage of prefix and DESTDIR
In-Reply-To: <20120725105508.1c7179df@skate>
References: <1343167832-14198-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAHt8ZCM=ZcbkOSpGzOJg-1sRK8tbrcZe8z5q5vbsy2-vG0p4wg@mail.gmail.com>
 <20120725102242.77a06eca@skate>
 <CAHt8ZCPHv7MR=WAvPRL5PxiTp=NsgDkhWKFusCEYgxiBtZPWXg@mail.gmail.com>
 <20120725105508.1c7179df@skate>
Message-ID: <CAHt8ZCOxSscd=-b4OMYqXtt3a0Y3hZ5276T4pOfk-JR+pQOXyw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas

On 25 July 2012 09:55, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Can you share a defconfig that shows the problem? I've tested the build
> with BR2_PACKAGE_PYTHON + BR2_PACKAGE_GPSD, and it just builds (even
> though the output is completely incorrect: the gpsd Python modules are
> installed in the wrong location and are built for the host rather than
> the target).

BR2_arm=y
BR2_arm926t=y
BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_MPFR=y
BR2_PACKAGE_GPSD=y
BR2_PACKAGE_GPSD_NTP_SHM=y
BR2_PACKAGE_PYTHON=y
BR2_PACKAGE_PYTHON_PY_PYC=y
BR2_PACKAGE_PYTHON_NFC=y

> Do you actually need the Python support in gpsd? :-)

I think the Python support is needed for gpsfake, gpscat, and a few
other things. For my particular use case, it's not required.

Simon.
