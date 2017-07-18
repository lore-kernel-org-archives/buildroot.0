From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 18 Jul 2017 19:42:37 +0000
Subject: [Buildroot] [Bug 10091] gcc7.1 does not build with graphite support
 due to old isl
In-Reply-To: <bug-10091-163@https.bugs.busybox.net/>
References: <bug-10091-163@https.bugs.busybox.net/>
Message-ID: <bug-10091-163-l0qm3gqUXb@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10091

--- Comment #12 from Arnout Vandecappelle <arnout@mind.be> ---
(In reply to Ivan from comment #4)
> Verifying the ChangeLog-2016, 2015, etc files shows that in 2014 the dependency of cloog > was removed. This is true for the last gcc5.x, 6.x and 7.x.
> 
> But gcc4.x still depends on cloog.
> 
> So the options seems to be either:
> 
> - keep cloog, with corresponding old isl, and gcc4.x users have graphite, or
> - removes cloog, new isl, and gcc7.1 users have graphite.

I would remove cloog, bump isl, and disable graphite support for gcc 4.9. gcc
4.9 is going away at some point anyway.

BTW Ivan please clone this bug for the Qt5base issue, it has nothing to do with
graphite support.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
