From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Dec 2013 11:24:44 +0100
Subject: [Buildroot] [PATCH 8/9] fs/iso9660: add Grub splashscreen
 support
In-Reply-To: <20131228210920.GL3373@free.fr>
References: <1388242600-2580-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1388242600-2580-9-git-send-email-thomas.petazzoni@free-electrons.com>
 <20131228210920.GL3373@free.fr>
Message-ID: <20131229112444.1307a7db@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat, 28 Dec 2013 22:09:20 +0100, Yann E. MORIN wrote:

> > diff --git a/fs/iso9660/menu.lst b/fs/iso9660/menu.lst
> > index ed7836a..b1ba3c9 100644
> > --- a/fs/iso9660/menu.lst
> > +++ b/fs/iso9660/menu.lst
> > @@ -1,6 +1,9 @@
> >  default		0
> >  timeout		10
> > -color cyan/blue white/blue
> > +color 		cyan/blue white/blue
> > +splashimage	/splash.xpm.gz
> > +foreground 	000000
> > +background 	cccccc
> 
> 'foreground' and 'background' do not seem to be valid grub-legacy or
> grub-2 options, at least according to their respective documentations:
>   - grub-legacy (aka grub-0.9x):
>     http://www.gnu.org/software/grub/manual/legacy/grub.html#color
>   - grub-2:
>     http://www.gnu.org/software/grub/manual/grub.html#Theme-File-Manual

That's because the documentation is not up-to-date with the Debian
patches additions. Those options are really handled, they really have an
effect (I tested it). I learned about them while reading:

  http://www.katspace.org/computers/Grub_Splash/

This option is added by the Debian specific patch
debian/patches/graphics.diff. Here is the definition of the foreground
option in Debian's patch:

+static struct builtin builtin_foreground =
+{
+  "foreground",
+  foreground_func,
+  BUILTIN_CMDLINE | BUILTIN_MENU | BUILTIN_HELP_LIST,
+  "foreground RRGGBB",
+  "Sets the foreground color when in graphics mode."
+  "RR is red, GG is green, and BB blue. Numbers must be in hexadecimal."
+};

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
