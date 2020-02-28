From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 28 Feb 2020 12:36:03 +0000
Subject: [Buildroot] [Bug 12586] avahi failure
In-Reply-To: <bug-12586-163@https.bugs.busybox.net/>
References: <bug-12586-163@https.bugs.busybox.net/>
Message-ID: <bug-12586-163-ao11RaO9GB@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12586

--- Comment #2 from Peter Seiderer <ps.report@gmx.net> ---
Your .config enables no filesystem image, how do you run it on the target?

Note that the result under target is not a usable filesystem (see e.g.
cat target/THIS_IS_NOT_YOUR_ROOT_FILESYSTEM) and will miss the user/group
entries for avahi...

On the target the following avahi user/group entries should exist:

$ grep avahi /etc/passwd 
avahi:x:1000:1000::/:/bin/false

$ grep avahi /etc/group 
avahi:x:1000:

-- 
You are receiving this mail because:
You are on the CC list for the bug.
