From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 29 Mar 2015 18:04:16 +0000 (UTC)
Subject: [Buildroot] [Bug 7976] mkuser script fails with: user already
 exists with group nogroup
In-Reply-To: <bug-7976-163@https.bugs.busybox.net/>
References: <bug-7976-163@https.bugs.busybox.net/>
Message-ID: <20150329180416.D118280841@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7976

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|                            |INVALID

--- Comment #10 from Yann E. MORIN <yann.morin.1998@free.fr> 2015-03-29 18:04:16 UTC ---
Tom,

OK, I fond your issue.

In your Buildroot tree, you already have an sshd user in your passwd
file, see:
   
http://sourceforge.net/p/freeghost/code/HEAD/tree/trunk/src/buildroot/system/skeleton/etc/passwd

And this sshd user is part of group 99, which is 'nobody'.

This is breakage on your side.

Regards,
Yann E. MORIN.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
