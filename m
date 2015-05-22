From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 22 May 2015 07:45:33 +0000 (UTC)
Subject: [Buildroot] [Bug 8106] mkfs.jffs2 uses the --pagesize parameter
	incorrectly
In-Reply-To: <bug-8106-163@https.bugs.busybox.net/>
References: <bug-8106-163@https.bugs.busybox.net/>
Message-ID: <20150522074533.6E9FC7FB47@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8106

--- Comment #2 from Micha? Le?niewski <mlesniew@gmail.com> 2015-05-22 07:45:33 UTC ---
I read a bit about the JFFS2 file system and looked at the JFFS2 code in the
Linux kernel.  It looks like setting the --pagesize parameter value to the
exact size of the virtual memory page would give the best results (best
compression ratio).  However, setting a smaller --pagesize value should work
fine, just as you wrote before. 

Anyway, I prepared a patch and sent it to the mailing list
(http://lists.busybox.net/pipermail/buildroot/2015-May/128576.html).

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
