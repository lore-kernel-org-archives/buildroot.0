From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 19 Jan 2011 11:29:54 +0100
Subject: [Buildroot] ssh-keygen seg fault
In-Reply-To: <AANLkTik4ZfnUpWeg91eWqMXGSxEX-H3c5L6+LDM_BqdU@mail.gmail.com>
	(Kyle Hayes's message of "Mon, 17 Jan 2011 14:23:21 -0800")
References: <AANLkTi=OafFhejBCDjz-rffd3_gFR99kzxcGP3o+EmEM@mail.gmail.com>
	<20110114090752.5f01ade5@surf>
	<469243A17FE74439A7BBB6F327046F20@beraninstruments.com.local>
	<20110114104016.252e7f90@surf>
	<AANLkTi=kVHeatBJ1G2wZsX1ww-FOV0qb5Vtf5rxXNneL@mail.gmail.com>
	<20110114181920.59ba8b8b@surf>
	<AANLkTik4ZfnUpWeg91eWqMXGSxEX-H3c5L6+LDM_BqdU@mail.gmail.com>
Message-ID: <87sjwpfaot.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Kyle" == Kyle Hayes <kyle@greenmonitor.com> writes:

Hi,

 Kyle> I got a core file.  I have a target GDB for use with host programs.  I
 Kyle> turned off stripping.  But...

 Kyle> sudo /home/kyle/buildroot/buildroot/output/toolchain/gdbhost-7.1/gdb/gdb
 Kyle> /home/kyle/buildroot/buildroot/output/target/usr/bin/ssh-keygen
 Kyle> /media/HC/core

You don't need sudo.

You can do this even with stripping, if you point gdb at the unstripped
version in output/build/...

To get gdb to find the correct shared libs, you'll need to do
set solib-absolute-prefix path/to/output/staging

 Kyle> Uh, so somewhere I managed to build everything without any debugging
 Kyle> symbols.  I'll try again.  Sigh.  The compile/edit/retry cycle on this
 Kyle> is quite long.  How "smart" is Builtroot when I change configuration?
 Kyle> Will it just rebuild the things I need to rebuild?  I've been doing a
 Kyle> "make clean" before every attempt.

Buildroot handles small changes like adding a package quite well, but
for global changes like toolchain options or strip/no-strip you'll need
to make clean; make

-- 
Bye, Peter Korsgaard
