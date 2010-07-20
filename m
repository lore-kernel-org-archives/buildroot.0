From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 20 Jul 2010 07:41:03 +0000 (UTC)
Subject: [Buildroot] [Bug 2245] Netcat does not work due to incorrect
 assumptions about signed chars.
In-Reply-To: <bug-2245-163@https.bugs.busybox.net/>
References: <bug-2245-163@https.bugs.busybox.net/>
Message-ID: <20100720074103.B6FD88265B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2245

--- Comment #4 from Nick Leverton <nick@leverton.org>  ---
Hi, thankyou for the commit.

To be honest I missed that busybox implements nc - except my subconscious
obviously remembered since I mis-filed this bug in the first place !  Thanks,
I'll check out its features to see if it can do what I need.

I was looking for a netcat version which is flag-compatible with OpenBSD netcat
to ease the porting of some scripts.  I needed -k (keep listening after first
connection closes) so I've been through the various netcats to check how they
behaved without that option.  GNU netcat doesn't have -k, but since it's in the
tree already I figured I might as well submit the fix to make it run.

I've now got BSD netcat on my target anyway, the Debian patches to build it
under Linux work pretty well for buildroot too.  I can submit the package if
you are at all interested in having a third nc implementation in buildroot  ...

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
