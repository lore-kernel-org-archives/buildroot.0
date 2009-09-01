From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue,  1 Sep 2009 21:09:32 +0000 (UTC)
Subject: [Buildroot] [Bug 527] misc fixes for dnsmasq package
In-Reply-To: <bug-527-163@https.bugs.busybox.net/>
References: <bug-527-163@https.bugs.busybox.net/>
Message-ID: <20090901210932.94427776BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=527


Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|                            |FIXED




--- Comment #18 from Peter Korsgaard <jacmet@uclibc.org>  2009-09-01 21:09:31 UTC ---
(In reply to comment #17)
> Created an attachment (id=625)
 --> (https://bugs.busybox.net/attachment.cgi?id=625) [details]
> dnsmasq 2.50 Makefile.autotools.in plus some other improvements
> 
> How do you like this take Daniele / Peter?

Looks good, except that it still tries to edit a line with --ldflags dbus-1,
which isn't a valid pkg-config argument, so I left that out.
Why was that line added in the first place?

Committed to git, thanks both of you.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
