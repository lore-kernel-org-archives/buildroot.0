From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 30 Jul 2009 13:52:51 +0000 (UTC)
Subject: [Buildroot] [Bug 513] Add new squid package
In-Reply-To: <bug-513-163@https.bugs.busybox.net/>
References: <bug-513-163@https.bugs.busybox.net/>
Message-ID: <20090730135251.5DBD07781B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=513





--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  2009-07-30 13:52:50 UTC ---
+SQUID_MAKE_OPT = HOSTCXX=g++

should probably be

+SQUID_MAKE_OPT = HOSTCXX=$(CXX_FOR_BUILD)

BTW, why not using directly the CXX_FOR_BUILD environment variable in the
configure.in/Makefile.am of Squid ? These environment variables are already
passed to the ./configure script.

It's probably not needed in this case, but passing CXXFLAGS_FOR_BUILD might
also be a good thing, since it is used to pass the correct -I flags to the host
headers in the $(HOST_DIR).


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
