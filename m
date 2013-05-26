From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 26 May 2013 17:49:02 +0000 (UTC)
Subject: [Buildroot] [Bug 5678] linux.mk: linux-menuconfig fails
In-Reply-To: <bug-5678-163@https.bugs.busybox.net/>
References: <bug-5678-163@https.bugs.busybox.net/>
Message-ID: <20130526174902.B7CF79A56B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5678

Samuel Martin <s.martin49@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WONTFIX

--- Comment #1 from Samuel Martin <s.martin49@gmail.com> 2013-05-26 17:47:53 UTC ---
(In reply to comment #0)
> make linux-menuconfig fails after make clean if using c cache
> 
> This was caused by the missing dep hostcc.

Right, host-ccache is part of the BASE_TARGETS list, which is built when
calling:
$ make all
or:
$ make toolchain

I rather suggest to build either a whole small config or just the toolchain,
before starting tweaking the linux config.

Regards,

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
