From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 14 Jul 2009 20:03:12 +0000 (UTC)
Subject: [Buildroot] [Bug 455] Fontconfig problem problem when
	building/installing
In-Reply-To: <bug-455-163@https.bugs.busybox.net/>
References: <bug-455-163@https.bugs.busybox.net/>
Message-ID: <20090714200312.5369A777FE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=455


Lionel Landwerlin <lionel.landwerlin@openwide.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|                            |INVALID




--- Comment #9 from Lionel Landwerlin <lionel.landwerlin@openwide.fr>  2009-07-14 20:03:11 UTC ---
(In reply to comment #8)
> (In reply to comment #7)
> > (In reply to comment #6)
> > > > Yes, I have an $(STAGING_DIR)/bin/sh installed.
> > > 
> > > Ohh? Where does that come from - Bash? That sounds like a bug in the first
> > > place
> > > 
> > 
> > That's copied from the external toolchain.
> > Whatever is in the staging we shouldn't have that kind of problem.
> > 
> 
> I think we should remove the staging directory from the PATH variable, as none
> of the binaries it contains can be executed on the host. If some package need
> to execute one binary from another package, we should have this compiled for
> the host.
> 

I confirm that removing the staging dir from the PATH variable also fix the
problem. I going to close the bug as there is no problem related to fontconfig
but rather to the external toolchain usage.

Thx for helping.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
