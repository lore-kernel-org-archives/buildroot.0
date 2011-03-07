From: Joe Woodward <jw@terrafix.co.uk>
Date: Mon, 07 Mar 2011 12:14:09 +0000
Subject: [Buildroot] 2011.02 pkg-config problems?
Message-ID: <WC20110307121409.5600B6@terrafix.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since moving from the 2010.11 release to the 2011.02 release I've had
problems with some files destined for the target ending up in rather
strange places.

For example, when doing a Xorg or TinyX build (with GTK/Pango/Cairo)
the X fonts used to be place in:

{TARGET}/usr/share/fonts/X11/100dpi
{TARGET}/usr/share/fonts/X11/75dpi
{TARGET}/usr/share/fonts/X11/misc   ...and so on

But now they end up in:

{TARGET}/home/MYBUILDUSERNAME/PATH/TO/BUILD/FOLDER/ON/HOST/MARCHINE/\
  ./output/host/usr/arm-unknown-linux-uclibcgnueabi/sysroot/usr/\
  ./share/fonts/X11/100dpi ...and so on

Has any else experienced this?

I'm fairly certain its due to the bumping of pkg-config and
tweaks to it's --sysroot patches.

Any ideas about what to do?

Cheers,
Joe
