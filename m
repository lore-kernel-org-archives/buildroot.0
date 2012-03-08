From: MERCADIER Johann <johann.mercadier@imerir.com>
Date: Thu, 8 Mar 2012 10:33:40 +0000
Subject: [Buildroot] BR 2012.rc1 :: DVI not activated on pandaboard?
In-Reply-To: <CAHXCMMJNbfRkLjp8mUOHjaCz9VUUcWuP6tfV8bA+1wn2+U9EgA@mail.gmail.com>
References: <CAPEB33z8LrFWaQdwVA1XdSjKFWam9kTH2FO8CvkWdnj9U_7vzA@mail.gmail.com>
 <20120308092159.5af7ce23@skate>
 <CAHXCMMJNbfRkLjp8mUOHjaCz9VUUcWuP6tfV8bA+1wn2+U9EgA@mail.gmail.com>
Message-ID: <CAPEB33wv6g-w4baUbZzz8FPJdan+53SMdo8NTq6pCKDB9eACog@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sam, all
  I just finished compiling a 3.0.2 kernel version that I knew that was
working, adding options for DVI support and everything works as a charm
except that I still do not have any DVI o/p on the monitor?!
  Do you mean "boot args"? I didn't change anything and it was working
Thomas is right is more likely something messing up with the kernel config
in the 3.2.7 version.
  But you are right probably I do not send the right args to activate the
DVI. I will try to have look how Angstrom & ubuntu distro have managed this
part, may be I will get something out of there...
  At the moment I am not good enough to know how to light this up. Do you
know a good website, tutorial where I could learn these stuff(seeking and
finding where mistakes takes place...) coz at the moment I just feel
"useless" ;o)

  Bye



On 8 March 2012 10:03, Samuel Martin <s.martin49@gmail.com> wrote:

> Hi Johann, all,
>
> 2012/3/8 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> > Hello,
> >
> > Le Wed, 7 Mar 2012 23:16:21 +0000,
> > MERCADIER Johann <johann.mercadier@imerir.com> a ?crit :
> >
> >> mmc rescan
> >> fatload mmc 0:1 0x80000000 uImage
> >> setenv bootargs vram=32M console=ttyO2,115200n8
> >> mem=456M at 0x80000000mem=512M at 0xA0000000 omapdss.def_disp=dvi
> >> omapfb.mode=dvi:1280x1024MR-24 at 60smsc95xx.macaddr=76:2F:97:85:4F:56
> >> root=/dev/nfs rw
> >> nfsroot=192.168.1.44:
> /home/johann/rootfs_TEST,nolock,wsize=1024,rsize=1024
> >> ip=192.168.1.235 rootdelay=4 init=/linuxrc
> >> bootm 0x80000000
> >>
> >> when booting I get there, the pandaboard probably still continue the
> boot
> >> process but nothing is displayed on the monitor?...
> >> ___[ MINICOM O/P
> >>
> ]________________________________________________________________________________________
> >> ...
> >>    Verifying Checksum ... OK
> >>    Loading Kernel Image ... OK
> >> OK
> >>
> >> Starting kernel ...
> >>
> >> Uncompressing Linux... done, booting the kernel.
> >
> Last time, i got this kind of log, i was messing up the console
> parameter in kernel args.
>
>
> Sam
>



-- 
Cordialement.

___Johann MERCADIER___

:(){ :|:& };:
"I am the Unknown lead by the Unknowing.
I have done so much with so little for so long
that I am now qualified to do anything with nothing."
HOOSEEK (http://www.hooseek.com/) 1?moteur de recherche solidaire!
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120308/8f37844c/attachment.html>
