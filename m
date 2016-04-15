From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Apr 2016 21:28:28 +0200
Subject: [Buildroot] [PATCH v2] gutenprint: fix host build
In-Reply-To: <20160415180212.GA11682@waldemar-brodkorb.de>
References: <20160415180212.GA11682@waldemar-brodkorb.de>
Message-ID: <20160415212828.1895181f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 15 Apr 2016 20:02:12 +0200, Waldemar Brodkorb wrote:

> ++AC_ARG_WITH([libusb], AS_HELP_STRING([--with-libusb], [Build with USB backend support]))

I think you should add the last AC_ARG_WITH() argument that makes sure
that the default value remains "yes". Something like:

AC_ARG_WITH([libusb],
	AS_HELP_STRING([--with-libusb], [Build with USB backend support]),
	[],
	[with_libusb=yes])

(or something like that)

Otherwise, if --with-libusb is not passed explicitly, USB support will
not be enabled, which is a change in behavior compared to the current
situation.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
