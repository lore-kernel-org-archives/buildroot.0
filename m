From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 13 Mar 2017 15:17:14 +0000
Subject: [Buildroot] [Bug 9721] version 2017.02: no acceptable m4 could be
	found in $PATH
In-Reply-To: <bug-9721-163@https.bugs.busybox.net/>
References: <bug-9721-163@https.bugs.busybox.net/>
Message-ID: <bug-9721-163-0rV7CTG8qt@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9721

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |INVALID
             Status|NEW                         |RESOLVED

--- Comment #4 from Yann E. MORIN <yann.morin.1998@free.fr> ---
> that may have been induced [...] by working chroot without /sys
> /proc mountd on the chroot env.

OK, so this was an environment problem. Closing the issue.

Thanks for the heads-up. :-)

> but appart from being superuser, root is just like any other user
> on the system.

And it is causing build isues when building nodejs, because nodejs'
buildsystem does not work correctly when running as root. This is a
fact and an issue we do have encountered.

> why should I not be able to build this from any folder I like to
> choose on my system?

Well, we try hard to make it work. However, we have had issues when
building in a sub-dir of /usr, because some packages' buildsystems
behave incorrectly in this case. That's not entirely Buikldroot's
fault, although it should work now.

Regards,
Yann E. MORIN.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
