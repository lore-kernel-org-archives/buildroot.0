From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 26 Oct 2012 06:56:16 +0000 (UTC)
Subject: [Buildroot] [Bug 5624] When building directfb,
 BR2_TARGET_LDFLAGS not used by libtool
In-Reply-To: <bug-5624-163@https.bugs.busybox.net/>
References: <bug-5624-163@https.bugs.busybox.net/>
Message-ID: <20121026065616.42F9F9994B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5624

--- Comment #6 from Jean-Mickael <jean-mickael.guerin@6wind.com> 2012-10-26 06:56:14 UTC ---
FYI I got similar issue with my LD not having the correct emulation (mips),
and I opted to add it to LDFLAGS, "-melf64btsmip" for instance.
It fixes packages using LD directly, but a new problem appears: CC cannot
recognize such LD specific option syntax, and some packages adds TARGET_LDFLAGS
to CC.

So I would first clean-up TARGET_LDFLAGS usage before doing the LD wrapper
(which sounds good idea).

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
