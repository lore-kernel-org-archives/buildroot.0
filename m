From: James Ronald <james.ronald@gmail.com>
Date: Mon, 12 May 2008 19:24:36 -0400
Subject: [Buildroot] Help with verifying buildroot build options for uClibc
	and GCC
Message-ID: <10bd9830805121624t30f2df56k6e85827be2574a7c@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 I am trying to get Linux 2.6.25 running on some older hardware that
uses a Sharp LH7A400 ARM 922T processor (currently running Linux
2.4.20).  The kernel uncompresses and seems to even be executing.
Busybox init prints it's Starting Init message but that is about it.
Nothing in the inittab seems to have executed.  Using the Magic SysRq
key and option "t" shows that init is running and even switching.
Replacing Init with simple programs works fine for a number of things
such as read, write, malloc and floating point.  However, both sprintf
and printf lock up, without any indication as to why. Some Googling
about points has me suspecting that perhaps Buildroot is not passing
the correct options to correctly build ggc or uClibc or such.  I'm
currently using buildroot-21758, uClibc 0.9.29, binutils 2.18.50.0.1,
GCC 4.2.1 and Busybox 1.7.2.  Is there a way that I can verify the
options that were actually used to build uClibc and gcc?  I logged a
copy of the make for Buildroot building everything but was unable to
find which options where actually used to build GCC or uClibc.

Also, if there is anyone else on the list running a 2.6.2x kernel on a
Sharp LH7A400 or LH7A404 I would love to hear words of encouragement
from you.

Thanks,
James Ronald
