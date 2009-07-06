From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  6 Jul 2009 23:26:30 +0000 (UTC)
Subject: [Buildroot] [Bug 83] liblockfile fails to compile due to eaccess
	redefinition
In-Reply-To: <bug-83-163@https.bugs.busybox.net/>
References: <bug-83-163@https.bugs.busybox.net/>
Message-ID: <20090706232630.90E6B77806@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=83


Lionel Landwerlin <lionel.landwerlin@openwide.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |REOPENED
         Resolution|WORKSFORME                  |




--- Comment #3 from Lionel Landwerlin <lionel.landwerlin@openwide.fr>  2009-07-06 23:26:29 UTC ---
(In reply to comment #2)
> I use the current toolchain when compiling my kernel.  I was simply trying to
> maintain the same toolchain across all builds, but it looks like that may not
> be the best track to take.
> 

It's a problem with new glibc which added the eaccess function in unistd.h
under the _GNU_SOURCE flag.
It's been fixed in later verions of liblockfile :
http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=392779.

I just compiled a buildroot with liblockfile version 1.08. Please update the
version in buildroot.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
