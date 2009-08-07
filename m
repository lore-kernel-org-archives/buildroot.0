From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  7 Aug 2009 19:12:59 +0000 (UTC)
Subject: [Buildroot] [Bug 545] Webkit doesn't see gtk-doc.make
In-Reply-To: <bug-545-163@https.bugs.busybox.net/>
References: <bug-545-163@https.bugs.busybox.net/>
Message-ID: <20090807191259.EFE5B7764C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=545





--- Comment #4 from Lionel Landwerlin <lionel.landwerlin@openwide.fr>  2009-08-07 19:12:58 UTC ---
(In reply to comment #3)
> gtkdocize is attempting to run, it's just not in the path, see "Warning: not
> running gtk-docize."
> 
> Should we depend on host-libgtk2 to make sure gtkdocize is available?
> 
> For now installing gtkdocize in your host system should let you build.
> 

Hmmm I'm not sure that's true. I have gtk-doc installed and I can't
autreconfigure packages that depends on gtk-doc.m4.
If I remember, that's because automake is called with -I argument pointing to
the staging directory.

Installing gtk-doc in staging directory should solve the problem.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
