From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 06 Oct 2015 11:47:19 +0200
Subject: [Buildroot] [PATCH] python-numpy: uClibc patch to avoid ldexpl
	and frexpl
In-Reply-To: <1444091418-31656-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Tue, 6 Oct 2015 01:30:18 +0100")
References: <1444091418-31656-1-git-send-email-arnout@mind.be>
Message-ID: <87h9m4fhw8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > It turns out that uClibc only enables the long double math functions
 > for some architectures (god know why, so what if long double is the
 > same as double, these functions should still be defined). Since
 > python-numpy links with those functions, the module will fail to load
 > on ARM, MIPS and SH.

 > However, python-numpy actually checks for each function if it is really
 > available. Only, it overrides that check for ldexpl and frexpl when
 > long double is the same as double (i.e. in exactly the case the uClibc
 > doesn't have these functions).

 > So add another exception for this.

 > Upstream-status: not applicable (code has changed too much)

 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 > ---
 > I've only build-tested, I haven't tested if the import now works on ARM.

Committed, thanks.

-- 
Bye, Peter Korsgaard
