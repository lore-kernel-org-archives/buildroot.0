From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 21 Sep 2019 15:18:19 +0000
Subject: [Buildroot] [Bug 12246] host-policycoreutils-graph-depends fails
In-Reply-To: <bug-12246-163@https.bugs.busybox.net/>
References: <bug-12246-163@https.bugs.busybox.net/>
Message-ID: <bug-12246-163-Ea3amT8jRs@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12246

--- Comment #1 from Arnout Vandecappelle <arnout@mind.be> ---
That is most likely due to a circular dependency. The issue is that circular
dependencies are no longer handles properly by graph-depends since we use
show-info.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
