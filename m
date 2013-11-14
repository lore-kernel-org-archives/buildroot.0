From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 14 Nov 2013 12:07:19 +0000 (UTC)
Subject: [Buildroot] [Bug 3601] DHCPD S80dhcp-server startup script issues
In-Reply-To: <bug-3601-163@https.bugs.busybox.net/>
References: <bug-3601-163@https.bugs.busybox.net/>
Message-ID: <20131114120719.98FC09BCC1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3601

Gustavo Zacarias <gustavo@zacarias.com.ar> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED

--- Comment #2 from Gustavo Zacarias <gustavo@zacarias.com.ar> 2013-11-14 12:07:18 UTC ---
1) That check can be removed, dhcpd won't start without a valid /etc/dhcpd.conf
(there's nothing copied there by the package).

2) Expected behaviour as Thomas said, the shipped initscripts are for
normal/simple usage scenarios, you can remove shipped initscripts via a custom
packaging script (like i do) and use your own (ditto, for example with a config
subsystem built into them).

3) The package installs the file with the proper permissions, if it's -x it
won't be executable anyway, i agree with Thomas. If there were a file that
matches and isn't +x it would be some user inflicted problem.

I'm sending a patch that revamps the initscripts to the mailing list with some
extra sanity checks.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
