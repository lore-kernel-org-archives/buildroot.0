From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 05 Feb 2018 16:40:26 +0000
Subject: [Buildroot] [Bug 10726] Current libglib2.mk creates broken libglib2
 binary when using glibc 2.26
In-Reply-To: <bug-10726-163@https.bugs.busybox.net/>
References: <bug-10726-163@https.bugs.busybox.net/>
Message-ID: <bug-10726-163-hAPykNIL4s@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10726

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Thanks for your well-documented bug report!

I think all those pre-seeded cache variables in LIBGLIB2_CONF_ENV are just
crap. They have been there since the glib2 package was introduced back in
January 2007, and the vast majority of them are useless, and potentially
harmful (as you have discovered). So the fix is most likely to remove almost
all of them, the key being to identify which ones we need to keep.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
