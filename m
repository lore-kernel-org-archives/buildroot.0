From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 07 May 2009 09:34:30 +0200
Subject: [Buildroot] 2009.05-rc1: fix dmraid build
In-Reply-To: <20090506121110.46c105f8@bandomeer.europe.flane.local> (Olaf
	Rempel's message of "Wed\, 6 May 2009 12\:11\:10 +0200")
References: <20090506121110.46c105f8@bandomeer.europe.flane.local>
Message-ID: <871vr1e589.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Olaf" == Olaf Rempel <razzor@kopf-tisch.de> writes:

 Olaf> Hi,
 Olaf> the dmraid build seems to be broken.
 Olaf> On x86 it bails out with missing include files.
 Olaf> I think it's some sort of $FOO_SUBDIR issue, but I couldn't find/fix it.

 Olaf> After adding the "include" dir to CFLAGS it compiles, but fails during linking.
 Olaf> Disabling parallel build (I'm using -j2) fixed that too.

Hmm, can you be a bit more specific? I see that the dmraid build
system is broken, as lib and tools race against each other with
parallel builds. I've fixed that in git - But other than that it
builds for me (x86-64 host, x86-core2 target).

-- 
Bye, Peter Korsgaard
