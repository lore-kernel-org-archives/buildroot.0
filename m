From: Salvatore Fassi <salvatore.fassi@gmail.com>
Date: Fri, 7 Mar 2008 18:18:52 +0100
Subject: [Buildroot] Glibc instead of uclibc
In-Reply-To: <c05908680803060125j1855f68dn1e34be01b450d58c@mail.gmail.com>
References: <c05908680803050744i38177299u2af49445fdff5990@mail.gmail.com>
	<20080305165910.GA1935@real.realitydiluted.com>
	<c05908680803050916l5077f6f7xfc0e2d3100d60fa8@mail.gmail.com>
	<1204737793.5023.1.camel@localhost>
	<c05908680803050933p15ae7f46y77a16d3af3262e45@mail.gmail.com>
	<1204787546.28258.21.camel@PC-EK.Solcon>
	<c05908680803052327qdb3c4fbk573b7ffbe38b4590@mail.gmail.com>
	<c05908680803060125j1855f68dn1e34be01b450d58c@mail.gmail.com>
Message-ID: <c05908680803070918k635d6106qa7b4ad5aa5634cea@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,
I'm here again.

I had been able to compile a complete rootfs with xorg and gtk and to boot
it, but I had to copy libcrypt, libm and ld-linux.so (with all their links
etc etc) manually because on my rootfs /lib there was only libc.
Now the system boots ok...but I can't login!!
I've tried using "root" with various passwords (also empty one) but I'm
still not able to log in...

Am I missing some other libraries? Why do all these libraries weren't copied
in the rootfs automatically?  :-/
P.S : For your information...I'm using my linux pc toolchain (fedora core 6)
as an external toolchain for buildroot.

Salvo


2008/3/6 Salvatore Fassi <salvatore.fassi@gmail.com>:

> Yes!!
> It works!
> Thank you all again!
>
> Salvo
>
> 2008/3/6 Salvatore Fassi <salvatore.fassi@gmail.com>:
>
> Thank you Emil!
> > This is a great answer!
> > I'm trying now...I let you know if I will be able to compile everything!
> >
> > Salvo
> >
> > 2008/3/6 Emil Kr?per <e.krueper@solcon-systemtechnik.de>:
> >
> > In the toolchain menu select external toolchain. Next you should go to
> > > the external toolchain options and change the external toolchain path
> > > to /usr and the external toolchain prefix to i386-linux-gnu. Just to
> > > be
> > > safe have a look at /usr/bin/, depending on your distribution it might
> > > be i486, i586 or i686. Modify the external toolchain prefix
> > > accordingly.
> > > If there is something missing at compile time, create a symbolic link
> > > from the appropriate binary to /usr/bin/ix86-linux-gnu-xxx. That
> > > usually
> > > happens the first times you run your buildroot with your systems
> > > toolchain.
> > >
> > > Best regards
> > > Emil Kr?per
> > >
> > >
> > > On Wed, 2008-03-05 at 18:33 +0100, Salvatore Fassi wrote:
> > > > No, I'm not searching for an arm/mipsel toolchain...I need only a
> > > > simple i386 toolchain, that's why I wanted to use the one from my
> > > > linux pc.
> > > > However thank you for the suggestion...it will be useful for the
> > > > future!
> > > >
> > > > Salvo
> > > >
> > > > On Wed, Mar 5, 2008 at 6:23 PM, JS <js@hipro.co.in> wrote:
> > > >         On Wed, 2008-03-05 at 18:16 +0100, Salvatore Fassi wrote:
> > > >         > So is not possible to use the toolchain that is currently
> > > >         installed on
> > > >         > my linux pc?
> > > >         > Must I download binutils, gcc etc etc to compile a brand
> > > new
> > > >         toolchain
> > > >         > (following the instructions provided in some
> > > cross-compiler
> > > >         how-to)?
> > > >
> > > >
> > > >         If you are lookin for a arm/mipsel toolchain, you should
> > > >         checkout eldk.
> > > >         I am sure you can use ELDK along with buildroot..
> > > >
> > > >         --
> > > >         HiPro Solutions
> > > >         http://hipro.co.in/
> > > >
> > > >
> > > >
> > > >         _______________________________________________
> > > >         buildroot mailing list
> > > >         buildroot at uclibc.org
> > > >         http://busybox.net/mailman/listinfo/buildroot
> > > >
> > > >
> > > > _______________________________________________
> > > > buildroot mailing list
> > > > buildroot at uclibc.org
> > > > http://busybox.net/mailman/listinfo/buildroot
> > > --
> > > Mit freundlichen Gr??en
> > >
> > >
> > > Emil Kr?per
> > >
> > > Solcon Systemtechnik GmbH
> > > Niels-Bohr-Ring 3-5
> > > 23568 L?beck
> > >
> > > Tel.: (0451)-40948-19
> > > Fax.: (0451)-40948-88
> > > Email: e.krueper at solcon-systemtechnik.de
> > > www.solcon-systemtechnik.de
> > >
> > > Sitz der Gesellschaft: L?beck
> > > Amtsgericht: L?beck | HRB 3662
> > > Gesch?ftsf?hrer: Dr.-Ing. Reiner Wieck, Dr.-Ing. Gerd Schneider
> > >
> > >
> > > Der Inhalt dieser E-Mail ist vertraulich und oder rechtlich gesch?tzt,
> > > und damit ausschlie?lich f?r den bezeichneten Adressaten bestimmt.
> > > Wenn
> > > Sie nicht der vorgesehene Adressat dieser E-Mail oder dessen Vertreter
> > > sein sollten, so beachten Sie bitte, dass jede Form der Kenntnisnahme,
> > > Ver?ffentlichung, Vervielf?ltigung oder Weitergabe des Inhalts dieser
> > > E-Mail unzul?ssig ist. Wir bitten Sie, sich in diesem Fall mit dem
> > > Absender in Verbindung zu setzen und diese E-Mail und jeden Anhang von
> > > Ihrem System zu l?schen. Vielen Dank.
> > >
> > >
> >
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080307/7b5a2d78/attachment-0001.htm 
