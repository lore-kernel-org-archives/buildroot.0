From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 15 Mar 2012 07:07:32 +0000 (UTC)
Subject: [Buildroot] [Bug 4922] Please consider introducing host-make for
 building software packages within the buildroot
In-Reply-To: <bug-4922-163@https.bugs.busybox.net/>
References: <bug-4922-163@https.bugs.busybox.net/>
Message-ID: <20120315070732.2305390DC5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4922

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2012-03-15 07:07:31 UTC ---
I am not sure I would like the fact that Buildroot uses a modified make,
because this means that we would have to maintain and update this make
modification in the future.

If this problem in make is annoying for your use case (and I do understand it),
wouldn't it be better to report it in the upstream project, provide a patch
(maybe adding a new make option that restores the previous behaviour, or
something), so that future versions of make will work properly, or at least
offer the option of working properly.

The problem is really two-fold here :

 * In general, I don't like building more and more host tools unnecessarily. I
want to retain the fact that when Buildroot is told to build a Busybox-based
system, it builds Busybox and *nothing* else.

 * In particular, I don't think it's a good idea for us to carry patches on the
different components that actually change their behaviour or add features. We
don't want to be maintaining those patches. These changes need to be upstream.
the only patches that we accept to carry are build fixes for cross-compilation,
or bug fixes when those are already on their way to be integrated upstream.

Of course, this is just my opinion, the opinion of others in the Buildroot
community may be different, and I am not the Buildroot maintainer, so my voice
is really one amongst many others.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
