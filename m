From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 05 Sep 2009 21:16:55 +0200
Subject: [Buildroot] BIND 9.5.1 startup fails w/ IPv6 disabled - PATCH
	to fix built-in root hints
In-Reply-To: <4A81B060.2030902@bvwireless.net> (Eric Malkowski's message of
	"Tue\, 11 Aug 2009 13\:54\:40 -0400")
References: <4A81B060.2030902@bvwireless.net>
Message-ID: <87ocppmcbc.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Eric" == Eric Malkowski <eric@bvwireless.net> writes:

Hi, and sorry for the slow response.

 Eric> When you guys went to BIND 9.5.1_P2 and P3 for kaminsky and dynamic
 Eric> update DoS fixes, the ISC folks added compiled-in root hints that get
 Eric> loaded before any other zones (including user specified root hints)
 Eric> and when IPv6 is disabled via buildroot option (my setup is this way),
 Eric> BIND will fail to start complaining that the IPv6 AAAA addresses in
 Eric> the built in root hints are invalid.  The error is right after the
 Eric> server outputs "setting up root hints" and it complains
 Eric> "2001:503:BA3E::2:30 bad IPv6 address"

 Eric> My solution is attached as a patch against BIND 9.5.1_P3 that simply
 Eric> puts #ifdef WANT_IPV6 around the AAAA addrs in the built in table and
 Eric> now bind starts fine and appears to work fine on an IPv4 only
 Eric> buildroot setup.

Have you tried submitting this to the bind people? It sounds to me as a
pretty clear bug.

-- 
Bye, Peter Korsgaard
