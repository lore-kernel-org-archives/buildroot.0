From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 15 Sep 2015 09:41:50 +0000 (UTC)
Subject: [Buildroot] [Bug 8331] kexec fails due to missing /usr/sbin/shutdown
In-Reply-To: <bug-8331-163@https.bugs.busybox.net/>
References: <bug-8331-163@https.bugs.busybox.net/>
Message-ID: <20150915094150.41C9781EA4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8331

--- Comment #7 from Peter Korsgaard <jacmet@uclibc.org> 2015-09-15 09:41:50 UTC ---
(In reply to comment #5)
> Systemd is providing /usr/sbin/shutdown


Ok, so there's two issues:

- Not all of our init implementations provide shutdown (busybox doesn't,
sysvinit has /sbin/shutdown, systemd has /usr/sbin/shutdown

- Systemd doesn't install it where kexec looks for it

I see that kexec-lite doesn't have such code.

I've never used kexec, but looking at the kexec code I'm not sure what the
shutdown code is for, it seems to just be a wrapper around shutting down that
isn't normally used (as it gets checked before do_exec).

What is your use case for needing it?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
