From: Martyn Welch <martyn.welch@radstone.co.uk>
Date: Tue, 12 Dec 2006 11:31:06 -0000
Subject: [Buildroot] Known working versions ?
Message-ID: <F38DEABE0E171746B133C1ABBD142D97060DC057@radmail.Radstone.Local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Koenraad,

I've been having the same problems.

I found that busybox would fail with "Implicit declaration of 'bzero'"
in tar.c. I decided to try rebuilding with tar disabled in the busybox
configuration. It compiled, but then when I tried the image, busybox
seemed to be mistaking 'init' for hdparm, infact everything I tried
seemed to be mistaken for hdparm!

I managed to get the image to aleast get to a prompt by building bash
into the image. I'm currently trying a build without busybox to see if I
can get a larger image working with buildroot.

If it's any help, I've set buildroot to use:

Gcc 3.4.6
Bunutils 2.16.91.0.7
Linux 2.6.19
Yesterdays (11 Dec06) snapshots of Busybox and uClibc.

Martyn 

-----Original Message-----
From: buildroot-bounces@uclibc.org [mailto:buildroot-bounces at uclibc.org]
On Behalf Of Koenraad lelong
Sent: 12 December 2006 10:10 AM
To: buildroot at uclibc.org
Subject: [Buildroot] Known working versions ?

Hi,
I'm very new at system-building, so excuse me if I'm asking "old" 
questions. In that case, please redirect me to the answers.
A few days ago I did an svn checkout, and with "make menuconfig" I made
a .config file. When I "make" it, I get compile-errors (in busybox, or
elsewhere). This morning I did an svn update, with more or less the same
  results.
Since I think of svn as a system where you don't always have good
results, I would like to know a revision-number that is known to be
good. And I also would like to have a .config-file known to be good. 
That way I could start from something that should be good, so if I have
problems, they have to come from my host-machine (a Suse 10.1 system
b.t.w.).
Ah, I would like to make an ix86-system with a (recent) 2.16-kernel.
I hope I'm not unreasonable when I ask these, thank you for _any_ help.
P.S. just to test I downloaded the recommended gumstix-buildroot and
that seems to compile fine.
Regards,
Koenraad Lelong.
_______________________________________________
buildroot mailing list
buildroot at uclibc.org
http://busybox.net/mailman/listinfo/buildroot


________________________________________________________________________
This e-mail has been scanned for all viruses by Star.The service is powered by MessageLabs. 
________________________________________________________________________
