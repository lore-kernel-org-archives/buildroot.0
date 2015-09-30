From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 30 Sep 2015 12:55:04 +0000 (UTC)
Subject: [Buildroot] [Bug 8066] nodejs crashes when built with gcc 4.9
In-Reply-To: <bug-8066-163@https.bugs.busybox.net/>
References: <bug-8066-163@https.bugs.busybox.net/>
Message-ID: <20150930125504.4DDED81DA0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8066

Jeroen Roovers <jer@xs4all.nl> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jer at xs4all.nl

--- Comment #6 from Jeroen Roovers <jer@xs4all.nl> 2015-09-30 12:55:04 UTC ---
On an ARM system (cortex-a7) I am seeing a similar problem when I build
everything with gcc-4.9.*. It doesn't crash, though, it merely exits certain
functions early, causing it to output invalid HTTP headers. I have seen some
references on the wider Internet pointing to similar problems, but those were
not connected to a specific GCC version or even the same OS. The only thing I
am certain of is that GCC 4.9 miscompiles nodejs, including version 4.1.1. I
haven't tried with libuv and libhttpparser properly in place, though.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
