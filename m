From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 17 Nov 2012 21:24:56 +0000 (UTC)
Subject: [Buildroot] [Bug 5354] host-lua doesn't build for EFL elementary
In-Reply-To: <bug-5354-163@https.bugs.busybox.net/>
References: <bug-5354-163@https.bugs.busybox.net/>
Message-ID: <20121117212456.76E8C9A07C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5354

--- Comment #8 from Peter Korsgaard <jacmet@uclibc.org> 2012-11-17 21:24:54 UTC ---
It is most likely because the shared library was linked with -nostdlib -lgcc.
I've just committed a fix for that to git (684f208ec 'lua: don't be fancy when
creating shared library'), could you give it a try to see if it fixes your
issue?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
