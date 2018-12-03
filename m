From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 03 Dec 2018 08:25:54 +0100
Subject: [Buildroot] [PATCH v2] package/libtool: Reduce target package
 to libltdl only
In-Reply-To: <b4e54580-453f-e184-4c82-531ed56cca8b@mind.be> (Arnout
 Vandecappelle's message of "Mon, 26 Nov 2018 11:12:42 +0100")
References: <20181124165434.31651-1-alexander.sverdlin@gmail.com>
 <20181124184708.GB20308@scaer>
 <7ef83036-fe64-9ca2-e2d0-689f428f5fff@mind.be>
 <1543225130.5778.5.camel@Nokia-N900>
 <b4e54580-453f-e184-4c82-531ed56cca8b@mind.be>
Message-ID: <87zhtn3wcd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> But "." works (as it was working for glibc and gdb previously)...

 >  Indeed, but it's ugly.

 >  BTW: glibc?

 >  On second thought, maybe we should just remove the automatic inheritance for
 > _SUBDIR entirely.

 >  There are 15 host packages that set _SUBDIR.

 >  Of these, 6 are host-only (e.g. gcc) so the automatic inheritance is pointless.

 >  Of the remaining 9:
 > - 2 override only HOST_XXX_SUBDIR (asterisk, cxxtest).
 > - 1 has a different SUBDIR for host and target (gettext).
 > - 1 overrides HOST_XXX_SUBDIR back to its default (gdb).
 > - 1 defines both with the same value (icu).
 > - 4 actually use the inheritance (capnproto, libnspr, tcl, vim).

 >  So it hardly seems worth to have the automatic inheritance, if only 1/3 of its
 > occurences are actually useful.

Agreed. Lets only have "magic" rules in the infrastructure if it is
commonly needed.

-- 
Bye, Peter Korsgaard
