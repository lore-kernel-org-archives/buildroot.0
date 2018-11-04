From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 04 Nov 2018 21:56:11 +0000
Subject: [Buildroot] [Bug 11476] stdio2.h error invalid use of
 __builtin_va_arg_pack
In-Reply-To: <bug-11476-163@https.bugs.busybox.net/>
References: <bug-11476-163@https.bugs.busybox.net/>
Message-ID: <bug-11476-163-e42AjUffNL@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11476

--- Comment #7 from romain.naour at gmail.com ---
Hi,

I found an upstream bug report about this issue [1].
With this patch [2] applied the build succeed.

I can't say why upstream didn't backport this patch on gcc5 stable branch.
So, I'm ok to disable fortify_source for gcc5.

Best regards,
Romain

[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?format=multiple&id=61164
[2]
https://github.com/gcc-mirror/gcc/commit/55f12fce4ccf77513644a247f9c401a5b1fa2402

-- 
You are receiving this mail because:
You are on the CC list for the bug.
