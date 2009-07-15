From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 15 Jul 2009 07:31:07 +0000 (UTC)
Subject: [Buildroot] [Bug 455] Fontconfig problem problem when
	building/installing
In-Reply-To: <bug-455-163@https.bugs.busybox.net/>
References: <bug-455-163@https.bugs.busybox.net/>
Message-ID: <20090715073108.03C07777F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=455





--- Comment #12 from Peter Korsgaard <jacmet@uclibc.org>  2009-07-15 07:31:07 UTC ---
(In reply to comment #11)

> > The problem is the various *-config scripts, like sdl-config which get
> > installed by various packages and *SHOULD* get called instead of whatever is
> > present on the host.
> 
> I'm agree, but shouldn't we provides them from the $(HOST_DIR) ?

Well, it's not that simple. HOST_DIR is for stuff for the host, so a sdl-config
there would point to the host libraries, not the target ones. Also notice that
these scripts gets installed with make install of the packages, so we don't
have direct control over it. And finally don't forget the cross compiler which
also gets installed into STAGING_DIR together with the headers/libs, and people
expect to simply be able to add STAGING_DIR/usr/bin to their path and be good
to go.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
