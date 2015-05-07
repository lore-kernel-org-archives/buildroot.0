From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  7 May 2015 08:15:14 +0000 (UTC)
Subject: [Buildroot] [Bug 7892] systemd-journald is broken
In-Reply-To: <bug-7892-163@https.bugs.busybox.net/>
References: <bug-7892-163@https.bugs.busybox.net/>
Message-ID: <20150507081515.1BA3481DE6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7892

--- Comment #13 from nroach44 at gmail.com 2015-05-07 08:15:14 UTC ---
As per the conversation over IRC a while ago:

This issue occurs when the 'rw' flag is given to the kernel. This flag was
added many versions ago as a workaround for another issue.

The fix/workaround seems to be to edit in "Storage=Volatile" in
/etc/systemd/journald.conf , as per
http://patchwork.ozlabs.org/patch/444707/.http://patchwork.ozlabs.org/patch/444707/

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
