From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 02 Nov 2018 08:44:32 +0000
Subject: [Buildroot] [Bug 11476] stdio2.h error invalid use of
 __builtin_va_arg_pack
In-Reply-To: <bug-11476-163@https.bugs.busybox.net/>
References: <bug-11476-163@https.bugs.busybox.net/>
Message-ID: <bug-11476-163-m6ougA8X71@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11476

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
Thanks for your bug report. Could you try without the following options:

BR2_SSP_REGULAR=y
BR2_RELRO_PARTIAL=y
BR2_FORTIFY_SOURCE_1=y

and see if the problem still appears ? If it does not appear, enabling those
options one by one to see which one breaks the build would be useful.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
