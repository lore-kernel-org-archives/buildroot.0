From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 10 Mar 2016 14:55:06 +0000
Subject: [Buildroot] [Bug 8746] At startup system stops with 'cannot set
 terminal process group (-1): Inappropriate ioctl for device' error
In-Reply-To: <bug-8746-163@https.bugs.busybox.net/>
References: <bug-8746-163@https.bugs.busybox.net/>
Message-ID: <bug-8746-163-AFzxZ21zpT@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8746

--- Comment #4 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Your boot log shows that the kernel starts /bin/bash directly, but your
configuration shows that you're using systemd as the init system. So things
aren't matching really well here.

Are you booting with init=/bin/sh perhaps? If that's the case, then I believe
it's expected for bash (the shell chosen as the default one in your
configuration) to complain this way, because its standard input/output is
/dev/console.

See https://lists.gnu.org/archive/html/bug-bash/2013-10/msg00097.html for
example.

So, I believe this is not a bug in Buildroot, it is just a misconfiguration of
the system on your side.

Peter, what do you think?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
