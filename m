From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 18 Sep 2011 10:22:40 +0000 (UTC)
Subject: [Buildroot] [Bug 3271] netperf-2.4.5 fails to compile
In-Reply-To: <bug-3271-163@https.bugs.busybox.net/>
References: <bug-3271-163@https.bugs.busybox.net/>
Message-ID: <20110918102240.BED8D8D5D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=3271

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |WONTFIX

--- Comment #6 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
netperf requires the ftw() function and related structures to be supported by
the toolchain. The default configuration of uClibc included in Buildroot makes
sure that the generated toolchain has support for ftw():

UCLIBC_HAS_FTW=y

So if you generate a toolchain with Crosstool-NG, it's up to you to make sure
that the uClibc of that toolchain has the required features. Buildroot cannot
support all possible variants of uClibc configurations, so in a generic way, we
only support the configuration we provide in toolchain/uClibc.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
