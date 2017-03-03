From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 03 Mar 2017 15:26:11 +0000
Subject: [Buildroot] [Bug 9456] mkusers script bash errors
In-Reply-To: <bug-9456-163@https.bugs.busybox.net/>
References: <bug-9456-163@https.bugs.busybox.net/>
Message-ID: <bug-9456-163-784bxpFJki@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9456

--- Comment #23 from Arnout Vandecappelle <arnout@mind.be> ---
D'oh!

From the bash man page:

LINES  Used by the select compound command to determine the column length for 
       printing selection lists.  Automatically  set  if  the  checkwinsize
       option  is enabled or in an interactive shell upon receipt of a
SIGWINCH.

Your bash is receiving a SIGWINCH from your terminal and updates the LINES
variable when it generates some output...

Yann, please rename LINES to a non-conflicting variable :-)

-- 
You are receiving this mail because:
You are on the CC list for the bug.
