From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 9 Mar 2011 09:05:59 +0100
Subject: [Buildroot] gpsd not included in build
In-Reply-To: <AANLkTikBwUmiUPZroqj8jL9NAh+6sHEr69gDmkV8ufR0@mail.gmail.com>
References: <AANLkTikBwUmiUPZroqj8jL9NAh+6sHEr69gDmkV8ufR0@mail.gmail.com>
Message-ID: <20110309090559.36358372@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 8 Mar 2011 22:40:11 +0000
bruce bushby <bruce.bushby@gmail.com> wrote:

> I hope I'm not being really thick here....but I can't seem to get
> "gpsd" to be included in my build.
> 
> I'm trying with "buildroot-2011.02" and "daily snapshot" on both
> ubuntu and Fedora but for some reason, the "make" doesn't download or
> compile gpsd.

works fine here:

$ grep GPSD=y ../outputs/gpsd/.config
BR2_PACKAGE_GPSD=y

$ ls -l ../outputs/gpsd/target/usr/sbin/gpsd 
-rwxr-xr-x 1 test test 29696 Mar  9 07:47 ../outputs/gpsd/target/usr/sbin/gpsd

> I checked package/Config.in ... looks ok
> I added GPSD_SOURCE to: package/gpsd/gpsd.mk

Not needed, there is a default value of "<pkgname>-<pkgversion>.tar.gz".

> I manually downloaded the package into /opt/buildroot/dl

Not needed, the gpsd package download works.

> I tried unticking it, re-running make (without a make clean) and then
> selecting it and running "make"....but it appears to ignore it.

Remember that removing a package in Buildroot doesn't do anything if
you don't restart the build from scratch.

Could you start a completely fresh build, with gpsd enabled, and post
the full build log somewhere, as well as the output of"find
output/target" ?

Another note: in your other post concerning Python and readline, I saw
that you use Buildroot as the root user. Don't do that. Use Buildroot
as a regular user.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
