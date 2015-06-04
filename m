From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu,  4 Jun 2015 17:30:34 +0000 (UTC)
Subject: [Buildroot] [Bug 8156] pkg-kconfig infra broken for
	*-update-{config, defconfig}
In-Reply-To: <bug-8156-163@https.bugs.busybox.net/>
References: <bug-8156-163@https.bugs.busybox.net/>
Message-ID: <20150604173034.6A2787FCD9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8156

--- Comment #4 from Yann E. MORIN <yann.morin.1998@free.fr> 2015-06-04 17:30:32 UTC ---
Thomas, All,

OK, I was using master to do thechecks, while you were probably stuck
on 2015.02, right? So, I had the kconfig fragment stuff coming into
play, and that hid the problem (but see below).

And in the end, I looked more in-depth at what was going on, and it is
even worse than what you reported: 'make linux-update-config' ends
without error, but the resulting file is garbage (does not match the
actual configuration).

So, indeed, there is a problem: errors are not caught, and that leaves
the user with the impresion everything was OK, when the resulting file
is broken.

I'll work on that.

Trust the y_morin on IRC, he was right after all (but not for the good
reason!).

Regards,
Yann E. MORIN.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
