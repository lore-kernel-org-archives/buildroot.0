From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 21 Sep 2019 15:58:07 +0000
Subject: [Buildroot] [Bug 12246] host-policycoreutils-graph-depends fails
In-Reply-To: <bug-12246-163@https.bugs.busybox.net/>
References: <bug-12246-163@https.bugs.busybox.net/>
Message-ID: <bug-12246-163-vBKVKyAp1W@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12246

--- Comment #2 from Yann E. MORIN <yann.morin.1998@free.fr> ---
(In reply to Thomas Petazzoni from comment #0)
As you already found, the issue is because the package is not enabled (it is a
host package without a config.in option), and is also not in the dependency
chain of any other package.

The proposal I have is to add a check to graph-depends, that checks that the
requested root package is indeed enabled, and if not, inform the user rather
than spew a traceback.

(In reply to Arnout Vandecappelle from comment #1)
> circular dependencies are no longer handles properly by graph-depends
Yes they are:
https://git.buildroot.org/buildroot/tree/support/scripts/graph-depends#n133 and
https://git.buildroot.org/buildroot/tree/support/scripts/graph-depends#n337

-- 
You are receiving this mail because:
You are on the CC list for the bug.
