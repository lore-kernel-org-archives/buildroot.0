From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 10 Mar 2016 17:36:27 +0000
Subject: [Buildroot] [Bug 8746] At startup system stops with 'cannot set
 terminal process group (-1): Inappropriate ioctl for device' error
In-Reply-To: <bug-8746-163@https.bugs.busybox.net/>
References: <bug-8746-163@https.bugs.busybox.net/>
Message-ID: <bug-8746-163-Yv6xXfzxyW@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8746

--- Comment #5 from Ralph Birt <rdbirt@gmail.com> ---
It seems that /sbin has been removed from 2015.11 and is, instead, made a link
to /usr/sbin.  So /sbin/init is now /usr/sbin/init.

I have an /sbin directory in my overlay skeleton directory structure so the
link to /usr/bin disappears and /sbin now contains just the few files I have
there, and those few files don't include /sbin/init.

The solution is for me to change my overlay directory structure so the files I
used to put into /sbin will now go into /usr/sbin.

Thanks for looking at this with me.

Regards,
Ralph

-- 
You are receiving this mail because:
You are on the CC list for the bug.
