From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 11 May 2020 12:06:35 +0000
Subject: [Buildroot] [Bug 12866] should we be disabling bash executable path
 caching?
In-Reply-To: <bug-12866-163@https.bugs.busybox.net/>
References: <bug-12866-163@https.bugs.busybox.net/>
Message-ID: <bug-12866-163-8opEqBBLq9@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12866

--- Comment #2 from Matt Weber <matthew.weber@rockwellcollins.com> ---
Thinking about it a little more, the actual shell script would need to set 'set
+h' but my understanding is the executable hash table (for quick lookup after a
commend is executed the first time) is just local to the current script's
context.  So to cause an issue, you would have to call the same command twice
in the same script and move the location of the executable without updating the
PATH.  That doesn't sound normal.  I'll close this bug :-)

-- 
You are receiving this mail because:
You are on the CC list for the bug.
