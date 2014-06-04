From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  4 Jun 2014 05:59:24 +0000 (UTC)
Subject: [Buildroot] [Bug 7160] host-xz not built.
In-Reply-To: <bug-7160-163@https.bugs.busybox.net/>
References: <bug-7160-163@https.bugs.busybox.net/>
Message-ID: <20140604055924.E4D889CE93@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7160

Peter Korsgaard <jacmet@uclibc.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED

--- Comment #1 from Peter Korsgaard <jacmet@uclibc.org> 2014-06-04 05:59:24 UTC ---
Thanks for the report.

From a quick look I think the right fix is to change $$(XZ) to xz in
fs/common.mk, E.G.:

ROOTFS_$(2)_COMPRESS_CMD = xz -9 -C crc32 -c

But I will take a closer look and test.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
