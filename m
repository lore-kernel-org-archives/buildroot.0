From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 29 Mar 2009 23:26:09 +0200
Subject: [Buildroot] Cannot find libbfd library in compiled toolchain
In-Reply-To: <B3B0FE219DFDB64F8905B1567ECB01BC8B3FC2@urano.tmt.telital.com>
	(Daniele Palmas's message of "Fri\, 27 Mar 2009 09\:22\:27 +0100")
References: <B3B0FE219DFDB64F8905B1567ECB01BC8B3FC2@urano.tmt.telital.com>
Message-ID: <87eiwgc972.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Daniele" == Daniele Palmas <Daniele.Palmas@telit.com> writes:

 Daniele> Hello,

 Daniele> Using buildroot-20080312 I?m trying to build a toolchain for
 Daniele> ARM.

I take it that you mean 20090312?

 Daniele> I have succeded, but I need libbfd which cannot be found
 Daniele> inside the usr/lib directory of the compiled
 Daniele> toolchain. Which config voice should I enable to have the
 Daniele> libbfd library built?

libbfd from binutils for the target? That's currently only available
if you enable gcc for the target, but you can manually add it to your
rootfs by running make binutils_target.

It's quite uncommon for anything else than gcc/binutils to need
libbfd, may I ask what you need it for?

-- 
Bye, Peter Korsgaard
