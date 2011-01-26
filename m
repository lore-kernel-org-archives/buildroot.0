From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 26 Jan 2011 16:44:01 +0000 (UTC)
Subject: [Buildroot] [Bug 3145] jffs2 image generation fails
In-Reply-To: <bug-3145-163@https.bugs.busybox.net/>
References: <bug-3145-163@https.bugs.busybox.net/>
Message-ID: <20110126164401.6C6378D38C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3145

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED

--- Comment #3 from Peter Korsgaard <jacmet@uclibc.org>  ---
Getting liblzo to also build shared libs could be a nice extension, but a
static lib should work fine as well. From what you quoted the problem seems
more to be that gcc wasn't passed the correct -I and -L options for it to
search output/host.

We've changed a few things since 2010.05 (and updated to a newer mtd-utils
version), and I've just done a test build where I do see the correct -I / -L
flags, so the issue seems to be fixed.

I'll add the --enable-shared for host/target builds of liblzo.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
