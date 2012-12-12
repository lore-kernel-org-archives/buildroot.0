From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 12 Dec 2012 17:47:29 +0100
Subject: [Buildroot] buildroot 2012.11 large file support
In-Reply-To: <20121212134703.7461d9c7@skate> (Thomas Petazzoni's message of
 "Wed, 12 Dec 2012 13:47:03 +0100")
References: <NDBBKLDECLOIHFJKBINACEFAFPAA.Berns@BEKA-Elektronik.de>
 <CAKvQZ_0BrzUShzUyvM50CVabtw5BUM=1CupzD0-R1mfBuc3Adg@mail.gmail.com>
 <87d2yhsoh8.fsf@dell.be.48ers.dk>
 <CAKvQZ_1KXZcriA+RTjaz1=15UEUahu=Qvq5ovA7GeVvwDyxmVw@mail.gmail.com>
 <878v95skvm.fsf@dell.be.48ers.dk>
 <CAKvQZ_2MzciYPnYw0rCv_pzhHTzOS+vn=sry7nubtHd+sha3cw@mail.gmail.com>
 <CAKvQZ_3sog-JnwOYiJWE6a8eCk-LcjSZ-txr0Z_AHTiC8NnRgw@mail.gmail.com>
 <20121211171008.3b869509@skate> <50C7D14F.4060304@mind.be>
 <20121212111628.5d1e9dba@skate> <20121212120159.4292d70b@skate>
 <20121212120341.69a89e93@skate> <20121212134703.7461d9c7@skate>
Message-ID: <874njrnroe.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Dear Thomas Petazzoni,
 Thomas> On Wed, 12 Dec 2012 12:03:41 +0100, Thomas Petazzoni wrote:

 >> Thing that remains not understood is what change between 4.5 and 4.6
 >> broke this.

 Thomas> Apparently, what changed is that the gcc/configure.ac has gained a
 Thomas> AC_SYS_LARGEFILE check:

 Thomas> $ grep LARGEFILE toolchain/gcc-4.6.3/gcc/configure.ac 
 Thomas> AC_SYS_LARGEFILE
 Thomas> $ grep LARGEFILE toolchain/gcc-4.5.4/gcc/configure.ac 
 Thomas> $

 Thomas> On gcc >= 4.6, this means that a #define _FILE_OFFSET_BITS 64 is added
 Thomas> to auto-host.h, which breaks the build of crtstuff.c for the target as
 Thomas> uClibc headers warn that _FILE_OFFSET_BITS is set to 64 even though
 Thomas> largefile support is not enabled.

Hmm, we already pass --disable-largefile to the gcc configure script,
except for the first 2 passes. Does it work if we add
$(DISABLE_LARGEFILE) to the gcc1 / gcc2 configure steps?

-- 
Bye, Peter Korsgaard
