From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 28 Jan 2009 21:01:32 +0000 (UTC)
Subject: [Buildroot] [Bug 79] No version-number for the Freetype-package
In-Reply-To: <bug-79-163@https.bugs.busybox.net/>
References: <bug-79-163@https.bugs.busybox.net/>
Message-ID: <20090128210132.D9FEE764B1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=79





--- Comment #5 from Peter Korsgaard <jacmet@uclibc.org>  2009-01-28 21:01:31 UTC ---
Ah yes, that's it. Looking at gamin.mk it seems pretty broken. It's not a
graphical program so it shouldn't depend on libgtk2 (it does look like it needs
glib2 though).

I'll take a look at it and commit a fix to svn soon.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
