From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 12 Apr 2015 12:25:16 +0000 (UTC)
Subject: [Buildroot] [Bug 8011] When building only busybox and strace,
 strace fails on not finding bluetooth/bluetooth.h
In-Reply-To: <bug-8011-163@https.bugs.busybox.net/>
References: <bug-8011-163@https.bugs.busybox.net/>
Message-ID: <20150412122516.50AC67FD53@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8011

--- Comment #10 from Jaap Crezee <jaap@jcz.nl> 2015-04-12 12:25:16 UTC ---
My strace/config.log

<snip>
configure:7337: checking bluetooth/bluetooth.h usability
configure:7337:
/data/work/zupr/ZUPR-Embedded-Buildroot_initramfs/output/host/usr/bin/ccache
/data/work/zupr/ZUPR-Embedded-Buildroot_initramfs/output/host/usr/bin/i586-unknown-linux-gnu-gcc
-c -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -pipe -Os 
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 conftest.c >&5
conftest.c:89:33: fatal error: bluetooth/bluetooth.h: No such file or directory
 #include <bluetooth/bluetooth.h>
                                 ^
compilation terminated.
configure:7337: $? = 1
</snip>

Seems rather normal. But, wait, I just did change two things:
- change default rootpw to ""
- did a make distclean

Now it seems to work as expected.

Could it have something to do with the above? Most likely number 2, I do not
think changing a root pwd wil effect something like this.
Or maybe it is ccache ?

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
