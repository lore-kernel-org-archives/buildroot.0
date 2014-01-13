From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Jan 2014 16:02:57 +0800
Subject: [Buildroot] [PATCH 3/3] pi4j: new package
In-Reply-To: <CAKi4VAKJukCe-DOS2PrDG1729NMvbFS+znV0_W65S_DkvOyB-A@mail.gmail.com>
References: <1389383422-29665-1-git-send-email-lucas.de.marchi@gmail.com>
 <1389383422-29665-3-git-send-email-lucas.de.marchi@gmail.com>
 <20140111144047.5370b25b@skate>
 <CAKi4VAKJukCe-DOS2PrDG1729NMvbFS+znV0_W65S_DkvOyB-A@mail.gmail.com>
Message-ID: <20140113160257.472c1ed2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Lucas De Marchi,

On Sat, 11 Jan 2014 10:27:41 -0200, Lucas De Marchi wrote:

> > I think this is quite certainly the first Java library for which we
> > have a package. Which JVM are you using to run this on the target? The
> > official Oracle JDK?
> 
> I'm using the official Oracle JDK. However I think we are not allowed
> to distribute it or make "recipes" to distribute it as part of
> buildroot, are we? Its license looks really restrictive. My current
> approach for the rootfs I'm building for a friend of mine is to
> install the Oracle jdk by using a overlay directory in buildroot.  Do
> you think it would be possible to add the oracle jdk to buildroot?

I haven't looked at the licensing details, but it would be worth
checking this. I know that some time ago, Debian had a package for the
JVM, which was downloading it from Sun (back in the days).

> > Regarding the installation in /opt, I'm not sure. The fact that
> > Raspbian installs it here is not that much of an argument to me (quite
> > the opposite, actually!).
> 
> I put it there actually because it's a pre-compiled thing.

Still, my feeling is that /usr/share/java is a better location.

> >> diff --git a/package/pi4j/Config.in b/package/pi4j/Config.in
> >> new file mode 100644
> >> index 0000000..99736bf
> >> --- /dev/null
> >> +++ b/package/pi4j/Config.in
> >> @@ -0,0 +1,10 @@
> >> +config BR2_PACKAGE_PI4J
> >> +     bool "pi4j"
> >> +     depends on BR2_PACKAGE_RPI_USERLAND
> >
> > Why this dependency?
> 
> the same as for wiringpi. This package is specific to rpi and doesn't
> make sense on other platforms.

But you can perfectly use the Rasberry Pi without rpi-userland.
rpi-userland is just the binary blobs for OpenGL and al.

Just make this dependency a dependency on BR2_arm.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
