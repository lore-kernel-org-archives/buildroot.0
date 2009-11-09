From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  9 Nov 2009 09:48:58 +0000 (UTC)
Subject: [Buildroot] [Bug 693] setting an external toolchain makes the
	compilation fail
In-Reply-To: <bug-693-163@https.bugs.busybox.net/>
References: <bug-693-163@https.bugs.busybox.net/>
Message-ID: <20091109094858.9D84D777DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=693


Damien Courouss? <damien.courousse.logica@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #721 is|0                           |1
           obsolete|                            |




--- Comment #2 from Damien Courouss? <damien.courousse.logica@gmail.com>  2009-11-09 09:48:55 UTC ---
Created an attachment (id=725)
 --> (https://bugs.busybox.net/attachment.cgi?id=725)
new patch

The first patch used 'sort -u' to remove duplicate values of sysroot lines in
SYSROOT_DIR; hence I deliberately intended to make it fail if $(GCC) -v
contained several different values for the option --with-sysroot.

However the last value of --with-sysroot corresponds to the actual
configuration of GCC and we should remember this one only. So the attached
patch.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
