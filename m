From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun,  4 Apr 2010 19:02:36 +0000 (UTC)
Subject: [Buildroot] [Bug 851] Add option to specify --sysroot value for
 external toolchain
In-Reply-To: <bug-851-163@https.bugs.busybox.net/>
References: <bug-851-163@https.bugs.busybox.net/>
Message-ID: <20100404190236.41D558B7BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=851





--- Comment #6 from Grant Edwards <grant.b.edwards@gmail.com>  2010-04-04 19:02:35 UTC ---

It looks like that commit addresses the same problem except that it's
unconditional.  I made my change configurable because I assumed there
was a reason why it was the way it was and that somebody was depending
on the extant behavior. Though I couldn't figure out exactly how that
behavior would be desirable, it looked like somebody went to extra
effort to extract the "as built" sysroot rather than use the path that
was already known for the current location of the toolchain.

I must admit I'm a bit confused by the effort the committed patch goes
to to figure out the value to use for sysroot.  Isn't it always going
to be "$(BR2_TOOLCHAIN_EXTERNAL_PATH)/.."?  Or does crosstool-ng
structure the toolchain install directory tree differently than does
buildroot?

Trying out that commit will require changes to my build script, so I can't
do it right now.  I'll give it go it when I have some spare time.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
