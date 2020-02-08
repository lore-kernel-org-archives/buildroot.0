From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 08 Feb 2020 20:33:43 +0100
Subject: [Buildroot] [PATCHv5] toolchain: allow using custom headers
 newer than latest known ones
In-Reply-To: <20200115182907.7104-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Wed, 15 Jan 2020 19:29:07 +0100")
References: <20200115182907.7104-1-yann.morin.1998@free.fr>
Message-ID: <87k14wub54.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: Vincent Fazio <vfazio@xes-inc.com>
 > When Buildroot is released, it knows up to a certain kernel header
 > version, and no later. However, it is possible that an external
 > toolchain will be used, that uses headers newer than the latest version
 > Buildroot knows about.

 > This may also happen when testing a development, an rc-class, or a newly
 > released kernel, either in an external toolchain, or with an internal
 > toolchain with custom headers (same-as-kernel, custom version, custom
 > git, custom tarball).

 > In the current state, Buildroot would refuse to use such toolchains,
 > because the test is for strict equality.

 > We'd like to make that situation possible, but we also want the user not
 > to be lenient at the same time, and select the right headers version
 > when it is known.

 > So, we add a new Kconfig blind option that the latest kernel headers
 > version selects. This options is then used to decide whether we do a
 > strict or loose check of the kernel headers.

 > Suggested-by: Aaron Sierra <asierra@xes-inc.com>
 > Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
 > [yann.morin.1998 at free.fr:
 >   - only do a loose check for the latest version
 >   - expand commit log
 > ]
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

 > ---
 > Changes v4 -> v5: (Yann)
 >   - include string.h for strcmp()  (Vincent)

Committed, thanks.

-- 
Bye, Peter Korsgaard
