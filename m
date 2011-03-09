From: bruce bushby <bruce.bushby@gmail.com>
Date: Wed, 9 Mar 2011 11:44:18 +0000
Subject: [Buildroot] gpsd not included in build
In-Reply-To: <20110309090559.36358372@surf>
References: <AANLkTikBwUmiUPZroqj8jL9NAh+6sHEr69gDmkV8ufR0@mail.gmail.com>
	<20110309090559.36358372@surf>
Message-ID: <AANLkTi=dgmgL6zZyxfTae2HHmb+_kW7xpN=_a8DxTZ5m@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks Thomas!!!

Appears it's something to do with my build setup.....gpsd does indeed build.

"..building as root.."  pure laziness , I use virtual machines for building
and don't care if they get trashed...but it's good advice, I'll switch to a
user for future builds.






On Wed, Mar 9, 2011 at 8:05 AM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Hello,
>
> On Tue, 8 Mar 2011 22:40:11 +0000
> bruce bushby <bruce.bushby@gmail.com> wrote:
>
> > I hope I'm not being really thick here....but I can't seem to get
> > "gpsd" to be included in my build.
> >
> > I'm trying with "buildroot-2011.02" and "daily snapshot" on both
> > ubuntu and Fedora but for some reason, the "make" doesn't download or
> > compile gpsd.
>
> works fine here:
>
> $ grep GPSD=y ../outputs/gpsd/.config
> BR2_PACKAGE_GPSD=y
>
> $ ls -l ../outputs/gpsd/target/usr/sbin/gpsd
> -rwxr-xr-x 1 test test 29696 Mar  9 07:47
> ../outputs/gpsd/target/usr/sbin/gpsd
>
> > I checked package/Config.in ... looks ok
> > I added GPSD_SOURCE to: package/gpsd/gpsd.mk
>
> Not needed, there is a default value of "<pkgname>-<pkgversion>.tar.gz".
>
> > I manually downloaded the package into /opt/buildroot/dl
>
> Not needed, the gpsd package download works.
>
> > I tried unticking it, re-running make (without a make clean) and then
> > selecting it and running "make"....but it appears to ignore it.
>
> Remember that removing a package in Buildroot doesn't do anything if
> you don't restart the build from scratch.
>
> Could you start a completely fresh build, with gpsd enabled, and post
> the full build log somewhere, as well as the output of"find
> output/target" ?
>
> Another note: in your other post concerning Python and readline, I saw
> that you use Buildroot as the root user. Don't do that. Use Buildroot
> as a regular user.
>
> Regards,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110309/c71e613b/attachment-0001.html>
