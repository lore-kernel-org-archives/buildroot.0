From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri,  7 Feb 2014 09:03:21 +0000 (UTC)
Subject: [Buildroot] [Bug 6446] eglibc doesn't install ldconfig to target
In-Reply-To: <bug-6446-163@https.bugs.busybox.net/>
References: <bug-6446-163@https.bugs.busybox.net/>
Message-ID: <20140207090321.C5D809C8B6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6446

--- Comment #1 from Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> 2014-02-07 09:03:19 UTC ---
ldconfig, nor ldd, are required components on the target system.
These are not installed by default, even when using an external toolchain.

ldconfig basically updates /etc/ld.so.conf, which can be done by hand.
ldd just runs the executable with the env variable LD_TRACE_LOADED_OBJECTS=1
set, so you can obtain the same behavior with:

LD_TRACE_LOADED_OBJECTS=1 /usr/bin/foo



So I indeed don't think this is a bug.
What do other developers think?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
