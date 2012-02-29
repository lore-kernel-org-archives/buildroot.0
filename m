From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 29 Feb 2012 13:40:28 +0000 (UTC)
Subject: [Buildroot] [Bug 4808] ccache may build against wrong zlib
In-Reply-To: <bug-4808-163@https.bugs.busybox.net/>
References: <bug-4808-163@https.bugs.busybox.net/>
Message-ID: <20120229134028.0E08990BCA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4808

--- Comment #2 from Ra?l S?nchez Siles <rsanchezs@infoglobal.es> 2012-02-29 13:40:27 UTC ---
Thanks for answering, Thomas. You are right. It's not working.
After a little bit more of research, I've found out the problem is that ccache
is build using rpath as LDFLAGS. This LDFLAGS are generic for all host packages
(as stated in package/Makefile.in)

I came accross the issue by chance when my distro upgrade zlib version so it
didn't match with the one provided by buildroot.

The solution could be either voiding/fixing LDFLAGS for host-ccache compilation
or removing embedded rpath in ccache binary. I think this second is the easier
way. But what do you think?

I'll provide a patch for the second.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
