From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  7 Feb 2014 12:55:56 +0000 (UTC)
Subject: [Buildroot] [Bug 5774] Not able to build ALSA-Utils for static build
In-Reply-To: <bug-5774-163@https.bugs.busybox.net/>
References: <bug-5774-163@https.bugs.busybox.net/>
Message-ID: <20140207125556.AA4249C8B6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5774

--- Comment #1 from Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> 2014-02-07 12:55:56 UTC ---
Hi, 

Could you provide a config file that exhibits the problem?

FYI, a similar problem was reported on alsa-lib on the alsa mailing list a
while back. A patch was then added to alsa-lib upstream to add --with-dl /
without-dl switches to the configure script:
http://www.spinics.net/lists/alsa-devel/msg06454.html

In any case, the patch attached to this bug report is not ok: it would remove
-ldl unconditionally, even if shared libraries were requested.

Thanks,
Thomas

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
