From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat,  7 Jul 2012 03:36:59 +0000 (UTC)
Subject: [Buildroot] [Bug 2929] genext2fs: couldn't allocate a block (no
	free space)
In-Reply-To: <bug-2929-163@https.bugs.busybox.net/>
References: <bug-2929-163@https.bugs.busybox.net/>
Message-ID: <20120707033659.445678FFE7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2929

Sean Mathews <mathewss@nutech.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |REOPENED
                 CC|                            |mathewss at nutech.com
         Resolution|FIXED                       |

--- Comment #2 from Sean Mathews <mathewss@nutech.com> 2012-07-07 03:36:58 UTC ---
 genext2fs presumes block sizes are 1024 but genext2fs.sh looks at the total
blocks on the local file system where the block size may be different. In my
case it was 4096 so this error shows up still in this case.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
