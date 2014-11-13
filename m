From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 13 Nov 2014 23:48:08 +0000 (UTC)
Subject: [Buildroot] [Bug 7628] Python SSL does not get built for Raspberry
	Pi
In-Reply-To: <bug-7628-163@https.bugs.busybox.net/>
References: <bug-7628-163@https.bugs.busybox.net/>
Message-ID: <20141113234808.06DD7B4466@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7628

--- Comment #4 from tobias.meggendorfer+buildroot at gmail.com 2014-11-13 23:48:07 UTC ---
Apparently I can't edit my comments, so new comment: With the following changes
to the attached config:

262c262
< BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
---
> BR2_TARGET_GENERIC_GETTY_PORT="tty1"
652,653c652,653
< BR2_PACKAGE_PYTHON3_PY_ONLY=y
< # BR2_PACKAGE_PYTHON3_PYC_ONLY is not set
---
> # BR2_PACKAGE_PYTHON3_PY_ONLY is not set
> BR2_PACKAGE_PYTHON3_PYC_ONLY=y

find output/target/ -name "_ssl*" still is empty (after make clean, make)

output/build/host-python3-3.4.1/build/lib.linux-x86_64-3.4/_ssl.cpython-34m.so
(host-python ssl) gets built though (in every configuration I tried so far).

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
