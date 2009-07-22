From: Franchitti, Alexandre J (Alex) <alexandre.franchitti@windriver.com>
Date: Wed, 22 Jul 2009 09:29:32 +0200
Subject: [Buildroot] checking for XFT... configure: error: *** Required xft
	Librarys not found ***
Message-ID: <711BBECDEF81BA439A6038E213C1DF1406E16C93@ism-mail03.corp.ad.wrs.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hi all,
I'm cross-compiling the linux kernel 2.6.28 for the ARM9 at91rm9200ek
target using buildroot-2009.05. Compiler is GCC-4.3.3, runtime is
uclibc.
I was able to get a kernel and NFS up and running. Now, I want to get
some window manager to run and I realized there was support for matchbox
from within buildroot in the 'package selection for the target' section
so I went ahead and tried to build it...

I keep hitting this build error related to building the
matchbox-keyboard-0.1 component:
checking for FAKEKEY... yes
checking for XFT... configure: error: *** Required xft Librarys not
found ***
make: ***
[/folk/alexf/arm_linux/buildroot-2009.05/build_arm/matchbox-keyboard-0.1
/.configured] Error 1

I believe I enabled everything I had to in order to get xft support but
it still won't fly. I even tried to disable keyboard support to move
ahead, but obviously, this is enabled by default when the
BR2_PACKAGE_MATCHBOX is enabled so I don't have a choice but get it
working. Note that I have auto-apt enabled also.

My host is Debian but I also tried Red Hat Enterprise Linux WS release 4
(Nahant Update 7).

is this a problem with the host RPM/packages or with my buildroot
configuration?

thanks in advance,
Alex
 
Alexandre Franchitti | Member Of Technical Staff

WIND RIVER | Parc d'Innovation De Bretagne Sud CP32 | 56038 | Vannes
Cedex | France

Direct Line +33 2 97 42 40 12 | Standard +33 2 97 42 68 00 Ext: 305 |
Fax +33 2 97 42 45 50

www.windriver.com <http://www.windriver.com/> 

 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090722/efa194b9/attachment.htm>
