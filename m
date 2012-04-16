From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 16 Apr 2012 19:32:11 +0000 (UTC)
Subject: [Buildroot] [Bug 5006] make performs library lookup in the build
 and host library directores and not in the staging area
In-Reply-To: <bug-5006-163@https.bugs.busybox.net/>
References: <bug-5006-163@https.bugs.busybox.net/>
Message-ID: <20120416193211.3282796AEC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5006

Arnout Vandecappelle <arnout@mind.be> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |INVALID

--- Comment #3 from Arnout Vandecappelle <arnout@mind.be> 2012-04-16 19:32:10 UTC ---
The way we usually call make, this isn't needed:

$(MAKE) CC="$(TARGET_CC)" ...

Variables specified on the command line override variables in the Makefile,
unless 'override' is put in front of it.  See
http://www.gnu.org/savannah-checkouts/gnu/make/manual/html_node/Override-Directive.html

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
