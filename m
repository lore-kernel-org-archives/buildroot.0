From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 25 Oct 2009 17:47:27 +0100
Subject: [Buildroot] Autoconf still not building (M4 ) results
In-Reply-To: <69D941819FAE46C2977D4B17E848F535@apexjs> (Sagaert Johan's
	message of "Sun\, 25 Oct 2009 00\:06\:02 +0200")
References: <69D941819FAE46C2977D4B17E848F535@apexjs>
Message-ID: <874opnzahs.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sagaert" == Sagaert Johan <sagaert.johan@skynet.be> writes:

 Sagaert> Hi 

 Sagaert> There seems to be a problem somewhere in the configure script
 Sagaert> of autoconf 2.64

Exactly.

 Sagaert> I found a way to solve it by setting the M4 variable in the
 Sagaert> makefile (line 42) so the configure script does not have to
 Sagaert> parse and find the m4 path.

Ok, that's atleast a workaround, but I would like to understand what the
problem is exactly.

 Sagaert> Something seems to go wrong in the tests done around line 2378 in the
 Sagaert> configure script (compare with configure script of v2.63 )

 Sagaert> Snip
 Sagaert>    { test -f "$ac_path_M4" && $as_test_x "$ac_path_M4"; } || continue
 Sagaert>       # Root out GNU M4 1.4.5, as well as non-GNU m4 that ignore -t, -F.
 Sagaert>       ac_snippet=change'quote(<,>)in''dir(<if''def>,mac,bug)'
 Sagaert>       ac_snippet=${ac_snippet}pat'subst(a,\(b\)\|\(a\),\1)d'nl
 Sagaert>       echo "ac_snippet2=$ac_snippet"
 Sagaert>       test -z "`$ac_path_M4 -F conftest.m4f </dev/null 2>&1`" \
 Sagaert>       && test -z "`echo $ac_snippet | $ac_path_M4 --trace=mac 2>&1`" \
 Sagaert> snip

Indeed. Could you try sticking in a few debug echo lines, to figure out
what's going on?

 Sagaert> Meanwhile it might be a good idea to update the m4 package in buildroot to
 Sagaert> 1.4.13 instead of the current 1.4.9

Indeed. But you wrote something earlier about that not having any effect
on the above problem, right?

-- 
Bye, Peter Korsgaard
