From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 20 Dec 2010 21:01:48 +0000 (UTC)
Subject: [Buildroot] [Bug 2995] -fstack-protector-all causes ssh to SIGSEGV
In-Reply-To: <bug-2995-163@https.bugs.busybox.net/>
References: <bug-2995-163@https.bugs.busybox.net/>
Message-ID: <20101220210148.62CCB8DC50@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2995

--- Comment #4 from Mario Klebsch <mario@klebsch.de>  ---
(In reply to comment #1)
> Do you have "Enable stack protection support" (BR2_TOOLCHAIN_BUILDROOT_USE_SSP)
> enabled? If yes, do things work if you disable that and do a fresh rebuild
> (make clean; make)

This option was enabled, and now, after I have disabled this option and rebuild
everything, it seems to work fine.

- Is there an incomaptibility bewteen stack prot4ectiona nd ucLibC or my alix
target system?

- Could it be, that some choosen value in my kernels .config might be the cause
of my trouble?

- Will Buildroot 2010.11 allow me to use stack protection on my target system?

- How does the %gs register fit into this problem? I have learned, that this
register is related to thread local storage, but it is hard to find information
about x86 register usage on linux systems on the web.

73, Mario

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
