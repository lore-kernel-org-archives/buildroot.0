From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Sep 2010 10:58:38 +0200
Subject: [Buildroot] troubles with intltool
In-Reply-To: <AANLkTikqwN4vkKaXWrA0SiGTwoYUYrST8vggtUwRVJRN@mail.gmail.com>
References: <AANLkTikqwN4vkKaXWrA0SiGTwoYUYrST8vggtUwRVJRN@mail.gmail.com>
Message-ID: <20100909105838.5ae25c27@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 9 Sep 2010 10:27:30 +0200
Aurele Traynard <aurele.traynard@laposte.net> wrote:

> I am trying to build an image with X11, an I am experimenting some
> problems with intltool
> the problem is when the script call /usr/bin/perl -e "require
> XML::Parser" i tried to use the following command : /usr/bin/perl -e
> "require XML::Parser"  to know what is the problem but it says
> nothing... could someone help, me next is the report

I've just tested, and xkeyboard-config builds fine here.
xkeyboard-config has a dependency on host-intltool, which itself has a
dependency on host-libxml-parser-perl.

And as you can see, we are properly passing:
 PERLLIB="/media/disk3/buildroot-2010.08/output/host/usr/lib/perl"
to the xkeyboard-config ./configure script.

Can you check
in /media/disk3/buildroot-2010.08/output/host/usr/lib/perl if
libxml-parser-perl is installed ?

Could you restart the build from scratch and keep the full build log:
 make 2>&1 | tee build.log
and then put online somewhere the full build log and your Buildroot
configuration ?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
