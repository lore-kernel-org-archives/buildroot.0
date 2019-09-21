From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 21 Sep 2019 16:13:20 +0000
Subject: [Buildroot] [Bug 12246] host-policycoreutils-graph-depends fails
In-Reply-To: <bug-12246-163@https.bugs.busybox.net/>
References: <bug-12246-163@https.bugs.busybox.net/>
Message-ID: <bug-12246-163-Moa1WRC0ob@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12246

--- Comment #3 from Arnout Vandecappelle <arnout@mind.be> ---
(In reply to Yann E. MORIN from comment #2)
>>  circular dependencies are no longer handles properly by graph-depends

> Yes they are: https://git.buildroot.org/buildroot/tree/support/scripts/graph-depends#n133 and https://git.buildroot.org/buildroot/tree/support/scripts/graph-depends#n337

The code is there, but you don't get that far because 'make show-info' fails if
there is a circular dependency. For any package involved in the loop,
_FINAL_RECURSIVE_DEPENDENCIES will trigger a circular dependency error from
make. So show-info never prints anything.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
