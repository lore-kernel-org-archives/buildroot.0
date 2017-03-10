From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 10 Mar 2017 19:53:04 +0000
Subject: [Buildroot] [Bug 9721] version 2017.02: no acceptable m4 could be
	found in $PATH
In-Reply-To: <bug-9721-163@https.bugs.busybox.net/>
References: <bug-9721-163@https.bugs.busybox.net/>
Message-ID: <bug-9721-163-gGg09mIU4K@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9721

Yann E. MORIN <yann.morin.1998@free.fr> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |yann.morin.1998 at free.fr

--- Comment #2 from Yann E. MORIN <yann.morin.1998@free.fr> ---
host-libtool in Buildroot has a dependency on host-m4, so you should have
seen host-m4 build before host-libtool.

Can you verify this is the case?

Also, I see you are building as root. This is absolutely not necessary,
and it is greatly suggested that you do not do that. Furthermore, this
is known to cause build issues in some packages (at least nodejs is
impacted). Can you retry running as non-root?

Finally, I see that you are building in a sub-directory of /usr, which
has caused issues in the past. Can you try bulding in your user's home
instead?

In the meantime, I'll try a local build in a sub-dir os /usr to check
the issue has not resurfaced...

Regards,
Yann E. MORIN.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
