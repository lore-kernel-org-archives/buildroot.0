From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 27 Oct 2016 21:56:49 +0000
Subject: [Buildroot] [Bug 9386] ubinize fails with or without custom config
In-Reply-To: <bug-9386-163@https.bugs.busybox.net/>
References: <bug-9386-163@https.bugs.busybox.net/>
Message-ID: <bug-9386-163-L81K5Y0NIa@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9386

--- Comment #5 from Arnout Vandecappelle <arnout@mind.be> ---
Nothing weird in your log...

Can you check the permissions of output/build/ubinize.cfg? And its contents?

Do you have ACLs, SMACK, SELinux or anything like that?

I really don't see how running ubinize from without or outside of fakeroot
could make a difference...

Maybe add an strace in front of the ubinize command in ubi.mk to see what is
really going on?


I do think it's a good idea to do the ubinize outside of fakeroot. However, I'd
like to understand why this is happening - if it happens for ubinize, it could
happen for something else as well...

-- 
You are receiving this mail because:
You are on the CC list for the bug.
