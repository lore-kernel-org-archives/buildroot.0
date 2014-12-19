From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 19 Dec 2014 16:48:34 +0000 (UTC)
Subject: [Buildroot] [Bug 7730] Error while connecting Qt Cretaor to device.
In-Reply-To: <bug-7730-163@https.bugs.busybox.net/>
References: <bug-7730-163@https.bugs.busybox.net/>
Message-ID: <20141219164834.0EFD580559@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7730

Gustavo Zacarias <gustavo@zacarias.com.ar> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |INVALID

--- Comment #2 from Gustavo Zacarias <gustavo@zacarias.com.ar> 2014-12-19 16:48:33 UTC ---
Relax a bit, this is all volunteer effort and you won't get anyone on their
good side by pushing.
That being said, gives the server list ciphers it seems you're using openssh on
the board (chacha20-poly1305 is very openssh-specific for now) and your client
only supports pretty old/basic ciphers which have been deprecated in openssh
because they're considered not safe any longer.

So either you upgrade your client or switch to dropbear instead of openssh on
the rpi which allows for the not-so-secure ciphers.

In any case this is not a buildroot problem, so closing the bug as INVALID.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
