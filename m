From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 22 Jul 2019 06:52:44 +0000
Subject: [Buildroot] [Bug 12031] Build of cups-filters fails while linking,
 apparently due to missing libiconv
In-Reply-To: <bug-12031-163@https.bugs.busybox.net/>
References: <bug-12031-163@https.bugs.busybox.net/>
Message-ID: <bug-12031-163-7QHQrLIt86@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12031

jakobcornell at gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Severity|normal                      |minor

--- Comment #6 from jakobcornell at gmail.com ---
I've worked around the problem for now by adding `-liconv` to the `CUPS_LIBS`
definition in `output/build/cups-filters-1.21.3/Makefile`. But I wonder how one
would go about patching this so the dependency is used automatically under a
uClibc toolchain.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
