From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  7 Aug 2009 21:26:46 +0000 (UTC)
Subject: [Buildroot] [Bug 545] Webkit doesn't see gtk-doc.make
In-Reply-To: <bug-545-163@https.bugs.busybox.net/>
References: <bug-545-163@https.bugs.busybox.net/>
Message-ID: <20090807212646.7A4BF777A9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=545





--- Comment #5 from Sven Neumann <s.neumann@raumfeld.com>  2009-08-07 21:26:45 UTC ---
(In reply to comment #3)
> gtkdocize is attempting to run, it's just not in the path, see "Warning: not
> running gtk-docize."
> 
> Should we depend on host-libgtk2 to make sure gtkdocize is available?

gtkdocize is not part of libgtk2 though. It comes with gtk-doc (see
http://www.gtk.org/gtk-doc/), which is a separate package that would have to be
added to buildroot. Since it has lots of dependencies and since it doesn't make
much sense to build developer documentation for the target, it would make more
sense to create a dummy gtkdocize in buildroot.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
