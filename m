From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 21 Dec 2015 14:08:02 +0000
Subject: [Buildroot] [Bug 8536] Building sudo with PAM results in unusable
	sudo
In-Reply-To: <bug-8536-163@https.bugs.busybox.net/>
References: <bug-8536-163@https.bugs.busybox.net/>
Message-ID: <bug-8536-163-lU1g9Ohp6p@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8536

--- Comment #8 from Doug Kehn <rdkehn@yahoo.com> ---
Hi Everyone,

The /etc/pam.d/sudo line:
     auth        required    pam_wheel.so use_uid
requires that the user is a member of the wheel group. When sudo is built
without PAM, the PAM databases are not queried so the user does not have be a
member of wheel.

Try changing the line to:
     auth        sufficient   pam_wheel.so use_uid
or comment it out to allow non-wheel group users sudo access. The user still
has to be listed in sudoers.

Hope this helps,
...doug

-- 
You are receiving this mail because:
You are on the CC list for the bug.
