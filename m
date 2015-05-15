From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 15 May 2015 13:41:38 +0000 (UTC)
Subject: [Buildroot] [Bug 8106] mkfs.jffs2 uses the --pagesize parameter
	incorrectly
In-Reply-To: <bug-8106-163@https.bugs.busybox.net/>
References: <bug-8106-163@https.bugs.busybox.net/>
Message-ID: <20150515134138.68520801F7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8106

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2015-05-15 13:41:38 UTC ---
Wow, thanks for this bug report! It seems you are absolutely correct, and I
actually learned with your bug report that the --pagesize option is for the
virtual memory page size, not the NAND page size.

Do you think you can cook a patch to address this problem?

One issue is that Buildroot has no idea what is the virtual memory page size on
the target system. I would suggest to just not pass any --pagesize option, and
leave the default of 4 KB, since this is what the vast majority of systems are
using.

And I'm pretty sure that if you use --pagesize 4K on a system that uses 8 KB or
64 KB pages, it will continue to work fine.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
