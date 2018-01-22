From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 22 Jan 2018 17:57:43 +0000
Subject: [Buildroot] [Bug 10536] Finding non-relative paths in the ccache
In-Reply-To: <bug-10536-163@https.bugs.busybox.net/>
References: <bug-10536-163@https.bugs.busybox.net/>
Message-ID: <bug-10536-163-Ek9mxCuYdp@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10536

--- Comment #6 from Arnout Vandecappelle <arnout@mind.be> ---
Hm, this build failure doesn't look like it will be solved with CCACHE_BASEDIR.
Indeed, it is the *target* ccache'd compiler that generated a *.d file that
apparently still has a full path in it. I don't see how this could happen...

Possibly the issue is that this is a path that is embedded in the specs file,
and ccache will only substitute paths that get passed on the command line
(through -I etc.).

Needs more debugging...

-- 
You are receiving this mail because:
You are on the CC list for the bug.
