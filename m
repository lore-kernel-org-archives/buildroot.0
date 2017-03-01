From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 01 Mar 2017 07:46:06 +0000
Subject: [Buildroot] [Bug 9456] mkusers script bash errors
In-Reply-To: <bug-9456-163@https.bugs.busybox.net/>
References: <bug-9456-163@https.bugs.busybox.net/>
Message-ID: <bug-9456-163-vrW2zxJo7i@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9456

--- Comment #14 from Arnout Vandecappelle <arnout@mind.be> ---
Perhaps there is some mojibake in the users file? Can you attach it as binary?

The bash errors make no sense at all, because exactly the same read commands
and LINES array is used a bit higher up in the mkusers script. Except of course
if one of the spaces is not a real space. Since mkusers is executed with
LANG=C, it will most likely not split on any of the > U+007F whitespace, and
you end up with e.g. uid = 1000\xc2\xa0users.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
