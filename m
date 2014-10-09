From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 09 Oct 2014 15:27:55 +0200
Subject: [Buildroot] [PATCH] gcc/gcc-initial: fix build of the AVR32
	toolchain
In-Reply-To: <1412803235-23147-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 8 Oct 2014 23:20:35 +0200")
References: <1412803235-23147-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87zjd59xus.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Since we switched to a two stage gcc build process, the AVR32
 > toolchain stopped building. This is because with such an old gcc
 > version, we cannot use the all-target-libgcc and install-target-libgcc
 > targets.

 > Before the two stage gcc, libgcc was only built in gcc-intermediate,
 > which carried a similar logic. This commit basically restores in
 > gcc-initial the logic that used to be in gcc-intermediate, which
 > consists in using the all-target-libcc and install-target-libgcc
 > targets only for gcc versions others than the AVR32 one.

 > Using the BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE option has a way of
 > distinguishing the old AVR32 compiler from the other gcc versions is a
 > bit ugly, but it's what was done in gcc-intermediate before. And since
 > the AVR32 support is due to go away at some point in the hopefully
 > near future, we don't care that much.

 > This will fix the build of the two AVR32 defconfig that have been
 > constantly failing since switching to the two stage gcc process.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
