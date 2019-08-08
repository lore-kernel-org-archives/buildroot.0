From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 08 Aug 2019 14:09:01 +0000
Subject: [Buildroot] [Bug 12096] tcpreplay: build fails if libdumbnet-dev is
 installed in the host
In-Reply-To: <bug-12096-163@https.bugs.busybox.net/>
References: <bug-12096-163@https.bugs.busybox.net/>
Message-ID: <bug-12096-163-pSd4891Ipu@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12096

--- Comment #1 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Thanks for the report. Unfortunately, even if tcpreplay's configure.ac has a
--with-libdnet option, a --without-libdnet doesn't seem to be properly handled,
and it will in any case try to find a libdnet installation available
system-wide. So tcpreplay's configure.ac will have to be patched.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
