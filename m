From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 08 Oct 2009 20:55:48 +0200
Subject: [Buildroot] [PATCH 06/10] *-menuconfig needs dirs to exist
In-Reply-To: <2ab3141d307cc1b3daa8ab8ded7740b1af324336.1254994304.git.rep.dot.nop@gmail.com>
	(Bernhard Reutner-Fischer's message of "Thu\,
	8 Oct 2009 11\:32\:31 +0200")
References: <87my43j6b6.fsf@macbook.be.48ers.dk>
	<cover.1254994304.git.rep.dot.nop@gmail.com>
	<2ab3141d307cc1b3daa8ab8ded7740b1af324336.1254994304.git.rep.dot.nop@gmail.com>
Message-ID: <874oq9iukr.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernhard" == Bernhard Reutner-Fischer <rep.dot.nop@gmail.com> writes:

 Bernhard>   In a pristine checkout the -menuconfig targets need their build dirs
 Bernhard>   to exist.

Really? I cannot reproduce it:

git clone ~/source/buildroot; cd buildroot
yes ''|make oldconfig >/dev/null
make busybox-menuconfig <- works
make uclibc-menuconfig <- works
sed -i -e 's/.*BR2_KERNEL_none.*=/# BR2_KERNEL_none is not set/' -e 's/.*BR2_KERNEL_LINUX.*/BR2_KERNEL_LINUX=y/' .config
yes ''|make oldconfig >/dev/null
make linux26-menuconfig <- works

-- 
Bye, Peter Korsgaard
