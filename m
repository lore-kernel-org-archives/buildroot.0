From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 29 Nov 2011 19:32:14 +0000 (UTC)
Subject: [Buildroot] [Bug 4568] [PATCH] Added initscript for avahi-autoipd
In-Reply-To: <bug-4568-163@https.bugs.busybox.net/>
References: <bug-4568-163@https.bugs.busybox.net/>
Message-ID: <20111129193214.647268F715@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4568

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org> 2011-11-29 19:32:14 UTC ---
avahi-autoipd is normally used as a fallback for dhcp (which is why we install
the custom udhcpc script). If you want to use it without udhcpc then you indeed
need to run it manually somehow, using an init script or from
/etc/network/interfaces, but just unconditionally installing this init script
for everyone doesn't make much sense.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
