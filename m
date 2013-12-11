From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 11 Dec 2013 17:21:44 +0000 (UTC)
Subject: [Buildroot] [Bug 5798] ncurses-5.9 fails to compile statically
In-Reply-To: <bug-5798-163@https.bugs.busybox.net/>
References: <bug-5798-163@https.bugs.busybox.net/>
Message-ID: <20131211172144.9A1379BFCA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5798

Gustavo Zacarias <gustavo@zacarias.com.ar> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WONTFIX

--- Comment #1 from Gustavo Zacarias <gustavo@zacarias.com.ar> 2013-12-11 17:21:44 UTC ---
Static builds should be enabled by BR2_PREFER_STATIC_LIB=y, not by passing
-static in BR2_TARGET_OPTIMIZATION, otherwise many workarounds/tricks to enable
proper static building in packages aren't used.
Just look at all the conditionals based on BR2_PREFER_STATIC_LIB in
package/ncurses/ncurses.mk that you're missing.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
