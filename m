From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 16 Oct 2015 20:00:53 +0000 (UTC)
Subject: [Buildroot] [Bug 8116] 2015.05-rc2 raspberrypi2_defconfig network
 interface not coming up
In-Reply-To: <bug-8116-163@https.bugs.busybox.net/>
References: <bug-8116-163@https.bugs.busybox.net/>
Message-ID: <20151016200053.B5B0981F4F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8116

--- Comment #8 from Beno?t Th?baudeau <benoit.thebaudeau.dev@gmail.com> 2015-10-16 20:00:53 UTC ---
I had experienced the same issue, and I had fixed it using BusyBox's ifplugd
with -M as suggested in comment #2. eth0 should be more "allow-hotplug" than
"auto" on RPi.

However, some services started quickly after S40network and configured to use
eth0 might be unhappy if it is not yet up, but it is the same issue if the
Ethernet cable is plugged later. So their configurations have to be adjusted
anyway.

At least, there is now a configurable choice between the sleeping S40network
and ifplugd.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
