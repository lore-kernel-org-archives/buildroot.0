From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 11 Mar 2011 16:22:16 +0000 (UTC)
Subject: [Buildroot] [Bug 3475] Calling sync on large filesystems when not
 always necessary
In-Reply-To: <bug-3475-163@https.bugs.busybox.net/>
References: <bug-3475-163@https.bugs.busybox.net/>
Message-ID: <20110311162216.4BA188F94E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3475

--- Comment #1 from Danny Staple <orionrobots@gmail.com>  ---
For info - this sync is called as a shell out to "/bin/sync" in makedevs.c.


if (system("/bin/sync"))
        bb_error_msg("sync failed, continuing anyway");

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
