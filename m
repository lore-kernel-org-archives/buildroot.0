From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 08 Jul 2008 07:39:52 +0200
Subject: [Buildroot] svn commit: trunk/buildroot
In-Reply-To: <48729A8C.4070303@atmel.com> (Ulf Samuelsson's message of "Tue\,
	08 Jul 2008 00\:37\:00 +0200")
References: <20080706073442.174E03C67A@busybox.net>
	<20080707124143.GB15840@mx.loc> <4872169E.2010102@atmel.com>
	<20080707132334.GD15840@mx.loc> <48721B90.5070905@atmel.com>
	<87mykt4v47.fsf@macbook.be.48ers.dk>
	<AAFCB58EA8634B0CADEDE37957685CEC@aeglos>
	<877ibxzfh4.fsf@macbook.be.48ers.dk> <48729A8C.4070303@atmel.com>
Message-ID: <87prppue6v.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

Hi,

 Ulf> So you think that the situation we have now, when libgtk2 will
 Ulf> not compile when gnome is installed in "/opt/gnome2 on the host  is a
 Ulf> good one?
 >> 
 >> No, not particular good, but better than the other way around as /usr
 >> is standard, /opt/gnome2 isn't.
 >> 

 Ulf> You can't be serious...

Ofcause I can.

 Ulf> Why is it better to have a broken gnome build
 Ulf> than installing gnome in /opt/gnome?

 Ulf> Anyone with gnome installed in "/usr" will of course
 Ulf> use "/usr" on the target as well.

Ahh, you mean to have buildroot install to a different location if the
host gnome stuff isn't in /usr? That seems like a can of worms to me -
Buildroot is hard enough to test as it is without adding more
varability to it.

 Ulf> You can of course install symlinks from /usr/bin to
 Ulf> /opt/gnome/bin, but use of "sudo" in buildroot
 Ulf> has been frowned on before.

I definately wouldn't want to do it in buildroot. What we could do is
to extend dependencies.sh to complain to the user to fix it up
themselves if needed.

 >> How does openembedded handle it?
 >> 

 Ulf> Did not check.

I think they only support distributions with gnome in /usr.

-- 
Bye, Peter Korsgaard
