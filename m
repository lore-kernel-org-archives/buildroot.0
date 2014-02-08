From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat,  8 Feb 2014 21:24:30 +0000 (UTC)
Subject: [Buildroot] [Bug 5030] busybox built fails if we use an override
 src dir BUSYBOX_OVERRIDE_SRCDIR and that dir does not contain .config
In-Reply-To: <bug-5030-163@https.bugs.busybox.net/>
References: <bug-5030-163@https.bugs.busybox.net/>
Message-ID: <20140208212430.A371E9C8F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5030

--- Comment #1 from Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> 2014-02-08 21:24:30 UTC ---
A question to buildroot developers: what do we do with this patch? The
different components using .config files all handle it differently: 

busybox copies its .config from the post-extract hook.
linux copies its .config in the configure_cmds.
uclibc copies its .config from the post-patch hook.

The busybox behavior allows a user to change .config, then re-run the configure
step and keep the user's changes.
For linux this is not true: if you change your config and re-run the configure
step, your changes are lost. If you change your .config and expect to keep the
changes, you can only rebuild, not reconfigure.

This patch proposes to line-up busybox more with how the linux kernel handles
it.

This raises the question: what do we want, what should the behavior be?

Personally, I haven't had a big problem with the linux way, and thus would
accept the principle of this patch. But I don't have a very strong opinion on
this...

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
