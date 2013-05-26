From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 26 May 2013 15:17:12 +0000 (UTC)
Subject: [Buildroot] [Bug 4922] Please consider introducing host-make for
 building software packages within the buildroot
In-Reply-To: <bug-4922-163@https.bugs.busybox.net/>
References: <bug-4922-163@https.bugs.busybox.net/>
Message-ID: <20130526151712.F1D3F9A579@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=4922

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WONTFIX

--- Comment #7 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2013-05-26 15:16:03 UTC ---
Making Buildroot build make is not going to solve the problem entirely:
Buildroot itself would still be using the 'make' installed by the distribution,
which may be problematic if the 'make' installed by the distribution doesn't
work properly (for one reason or another).

Conclusion: since make is such a fundamental tool for Buildroot, if something
is broken/inappropriate in make, we need a correct make to be installed prior
to running Buildroot. We are not going to build a new 'make', from source, at
every Buildroot invocation.

Please get in touch with make upstream, and provide a patch that fixes the
behavior of $(wildcard ...) according to your needs.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
