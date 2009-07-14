From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 14 Jul 2009 20:21:53 +0000 (UTC)
Subject: [Buildroot] [Bug 455] Fontconfig problem problem when
	building/installing
In-Reply-To: <bug-455-163@https.bugs.busybox.net/>
References: <bug-455-163@https.bugs.busybox.net/>
Message-ID: <20090714202153.433B8777FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=455





--- Comment #10 from Peter Korsgaard <jacmet@uclibc.org>  2009-07-14 20:21:52 UTC ---
> I think we should remove the staging directory from the PATH variable, as none
> of the binaries it contains can be executed on the host. If some package need
> to execute one binary from another package, we should have this compiled for
> the host.

The problem is the various *-config scripts, like sdl-config which get
installed by various packages and *SHOULD* get called instead of whatever is
present on the host.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
