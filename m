From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 24 Aug 2009 10:14:59 +0000 (UTC)
Subject: [Buildroot] [Bug 575] Buildroot Libtool Patch Fails
In-Reply-To: <bug-575-163@https.bugs.busybox.net/>
References: <bug-575-163@https.bugs.busybox.net/>
Message-ID: <20090824101500.0FD187653F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=575





--- Comment #6 from Will Newton <will.newton@gmail.com>  2009-08-24 10:14:58 UTC ---

The error you are seeing is because uClibc linuxthreads.old does not have
support for some newer features of pthreads that WebKit uses.

There is a patch that has been proposed for uClibc to fix this, but I am not
sure how correct it is and I don't know if there are plans to merge it:

http://www.mail-archive.com/uclibc at uclibc.org/msg02399.html

You could try building with this patch in toolchain/uClibc or try using the new
linuxthreads library and see if that is more successful.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
