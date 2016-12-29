From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 29 Dec 2016 16:13:45 +0000
Subject: [Buildroot] [Bug 9526] Embedded NPM fails to start with "no such
 file or directory" error
In-Reply-To: <bug-9526-163@https.bugs.busybox.net/>
References: <bug-9526-163@https.bugs.busybox.net/>
Message-ID: <bug-9526-163-XlEi2i0MvC@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9526

--- Comment #6 from bilge at scriptfusion.com ---
I have found out why this happens. It is because
/usr/lib/node_modules/npm/bin/npm-cli.js (the target NPM is linked to) begins
with the line, "#!/usr/bin/env node", but /usr/bin/env does not exist! If this
is manually patched to "#!/usr/bin/node" it works as expected.

I believe Buildroot should either include this patch, a copy of env or perhaps
even some sort of env shim. In its current state NPM will always fail.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
