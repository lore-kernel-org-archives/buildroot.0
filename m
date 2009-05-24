From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 24 May 2009 21:37:15 +0200
Subject: [Buildroot] GCC-4.3.3 in toolchain fails to compile
In-Reply-To: <56ea0bb80905212032x1e01cdfbt4c427fc85c9b72e3@mail.gmail.com>
	(Paul Archer's message of "Fri\, 22 May 2009 13\:32\:40 +1000")
References: <56ea0bb80905212032x1e01cdfbt4c427fc85c9b72e3@mail.gmail.com>
Message-ID: <87iqjqfg2c.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Paul" == Paul Archer <ptarcher@gmail.com> writes:

 Paul> Hey all,
 Paul> I am trying to build buildroot-2009.05-rc2 for the AT91SAM9G20,
 Paul> however I keep getting gcc compiler errors no matter which version I
 Paul> pick, either gcc-4.2.4, gcc-4.3.2/3 and gcc-4.4.x also fails. Versions
 >> =gcc4.3.2 all fail with the build error below.

 Paul> It seems __DTOR_LIST__ is not being defined, but I don't really know
 Paul> where to configure this to get it to be defined.

You have:

BR2_ARM_EABI=y
BR2_GNU_TARGET_SUFFIX="linux-uclibc"

Which doesn't make sense. The correct target suffix for eabi is
"linux-uclibcgnueabi". With that change the toolchain builds. Notice
that it will later fail in libusb and strace unless you get the
post-rc2 fixes in git, and that there's no at91sam9g20ek support in
u-boot (well, there is now in u-boot git after the 2009.03 release,
but not in any released versions).

How did you get to that config? Is is based on any defconfig in
buildroot?

-- 
Bye, Peter Korsgaard
