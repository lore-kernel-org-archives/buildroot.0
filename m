From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 17 Jun 2010 22:48:43 +0200
Subject: [Buildroot] squashfs-tools do not compile
In-Reply-To: <4C194BD2.3060600@gmx.net> (Ossy's message of "Thu, 17 Jun 2010
	00:10:26 +0200")
References: <4C194BD2.3060600@gmx.net>
Message-ID: <87r5k5bd1w.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ossy" == Ossy  <ossy1980@gmx.net> writes:

 Ossy> Dear buildrootmailinglist,
 Ossy> The squashfs-tools do not compile. I use arm926t as build target.
 Ossy> I haven't found a bug in the database.

Are you sure you want to build squashfs-tools FOR your target? Normally
you just create filesystems on your host (E.G. using buildroot), and
then read them on the target. The squashfs package is to get mksquashfs
/ unsquashfs to run on the target.

Anyway, the issue was that squashfs-tools used the GNU extension
get_nprocs() - I have fixed it in git (dfa2a513e).

-- 
Bye, Peter Korsgaard
