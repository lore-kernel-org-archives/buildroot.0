From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 28 May 2019 13:12:44 +0000
Subject: [Buildroot] [Bug 11916] getfattr 2.4.48 issue
In-Reply-To: <bug-11916-163@https.bugs.busybox.net/>
References: <bug-11916-163@https.bugs.busybox.net/>
Message-ID: <bug-11916-163-JUs6fbCtog@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11916

--- Comment #1 from Jean-pierre Cartal <jpcartal@free.fr> ---
Created attachment 8061
  --> https://bugs.busybox.net/attachment.cgi?id=8061&action=edit
Patch to avoid symbol version lookup issue

This patch solves the issue by not linking setfattr and getfattr with libattr,
and thus use the glibc version of the *xattr() functions.

Add the libattr to only attr linking command where it is really needed.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
