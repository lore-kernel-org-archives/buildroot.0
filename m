From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 29 Jan 2015 10:51:15 +0000 (UTC)
Subject: [Buildroot] [Bug 7844] Lua with hard-float on MIPS by buildroot
	doesn't work
In-Reply-To: <bug-7844-163@https.bugs.busybox.net/>
References: <bug-7844-163@https.bugs.busybox.net/>
Message-ID: <20150129105115.1883580E42@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7844

--- Comment #3 from Vicente Olivert Riera <vincent.riera@imgtec.com> 2015-01-29 10:51:14 UTC ---
Hello.

I have done a Buildroot build for x86_64 using the Sourcery CodeBench toolchain
and then I chrooted into it to check if this problem is not present in other
architectures.

I have never used Lua so, please tell me if this is expected:

# chroot images /bin/bash
bash-4.3# lua  
Lua 5.1.5  Copyright (C) 1994-2012 Lua.org, PUC-Rio
> local var = 12345
> print(var)
nil
> var = 12345
> print(var)
12345

I see exactly the same behavior on MIPS big endian, tested in real hardware,
for both soft and hard float. I will check it on little endian if you think
that is necessary.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
