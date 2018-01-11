From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 11 Jan 2018 19:17:00 +0000
Subject: [Buildroot] [Bug 10551] PowerPC SPE and Musl
In-Reply-To: <bug-10551-163@https.bugs.busybox.net/>
References: <bug-10551-163@https.bugs.busybox.net/>
Message-ID: <bug-10551-163-Q99fqRAeKJ@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10551

--- Comment #2 from sigurd.segtnan at kongsberg.com ---
I have asked around, and we used the information from from
https://wiki.musl-libc.org/supported-platforms.html. Since we found something
that worked for the PowerPC we used, we did not investigate further.

Today the relevant part under Supported target architectures (ABIs) is:
* powerpc (needs gcc built with ?enable-secureplt ?with-long-double-64, and
-Wl,?secure-plt to link dynamic binaries.)
* powerpc64

The "-Wl,?secure-plt" is probably for older versions of gcc (secure-plt is
mentioned in the 900-musl-support.patch fotr gcc 4.9.4, and "Pass --secure-plt
to the linker" seems to have been added to gcc in 2015 according to
https://gcc.gnu.org/ml/gcc-patches/2015-10/msg01501.html).

-- 
You are receiving this mail because:
You are on the CC list for the bug.
