From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 14 Dec 2010 09:38:22 +0000 (UTC)
Subject: [Buildroot] [Bug 2617] Pixman 0.19.2 & Cairo 1.10.0
In-Reply-To: <bug-2617-163@https.bugs.busybox.net/>
References: <bug-2617-163@https.bugs.busybox.net/>
Message-ID: <20101214093822.4094B8E297@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2617

--- Comment #4 from Paul Burton <Paul.Burton@imgtec.com>  ---
(In reply to comment #3)
> Paul,
> 
> Could you give a few more details on why the new patch
> cairo-1.10.0-packttstructs.patch is necessary ? The description at the top of
> the patch doesn't really explain the why.
> 
> Thanks!

Sure, essentially if you look at src/cairo-truetype-subset.c lines 98-111, you
can see that the size of the structs must match the sum of the size of their
fields, ie. have no padding, because these structs are being read from font
files which obviously aren't padded to word boundaries on disk. At least with
the compiler I'm using that was not the case by default, but the packed
attribute ensures that padding isn't added and the checks pass.

This should probably be reported upstream, I'll get to that later today.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
