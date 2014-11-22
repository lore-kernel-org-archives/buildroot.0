From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 22 Nov 2014 10:43:26 +0000 (UTC)
Subject: [Buildroot] [Bug 7670] Fails to build mpc-1.0.2 on latest Cygwin
In-Reply-To: <bug-7670-163@https.bugs.busybox.net/>
References: <bug-7670-163@https.bugs.busybox.net/>
Message-ID: <20141122104326.C384F7FE51@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7670

--- Comment #6 from Yann E. MORIN <yann.morin.1998@free.fr> 2014-11-22 10:43:26 UTC ---
Well, the workaround is just that, and probably the build will just fail
further on.

And it's not just cygmpfr-4.dll that is at fault here: in my minimal Cygwin
install, there are 101 DLLs in /bin and there is *no* DLL in /lib or /usr/lib.
So you'd have problems one after the other anyway: after mpfr, that'll be mpc,
and you'd have to move your host mpc DLL too. Then what?

We can not tell people to break their host system (like, moving DLLs around) to
be able to run Buildroot. Working around this problem the way you did is just
not sustainable in the long run.

Cygwin is broken, we can not run on Cygwin.

So, no, I'm afraid we won't accept bug reports about running Cygwin.

As I said previously: get yourself a Linux machine. A VM would do OK, and might
even be faster than Cygwin.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
