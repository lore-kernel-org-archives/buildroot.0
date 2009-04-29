From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 29 Apr 2009 18:57:12 +0000 (UTC)
Subject: [Buildroot] [Bug 271] Library 'libgcc_s.so.1' not installed in
	search path
In-Reply-To: <bug-271-163@https.bugs.busybox.net/>
References: <bug-271-163@https.bugs.busybox.net/>
Message-ID: <20090429185712.95C8A775F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=271





--- Comment #2 from Floris Bos <info@je-eigen-domein.nl>  2009-04-29 18:57:11 UTC ---
Created an attachment (id=283)
 --> (https://bugs.busybox.net/attachment.cgi?id=283)
.config

.config file.
Defaults with architecture changed to x86_64, and dropbear selected.



In the newest buildroot-20090429 snapshot, is not even installed in the root
either, but only appears in the staging dir.

==
[max at myhost buildroot]$ find project_build_x86_64/uclibc/root |grep libgcc_s
[max at myhost buildroot]$ find build_x86_64/staging_dir |grep libgcc_s
build_x86_64/staging_dir/usr/x86_64-linux-uclibc/lib64/libgcc_s.so
build_x86_64/staging_dir/usr/x86_64-linux-uclibc/lib64/libgcc_s.so.1
==

Dropbear (and most other packages, other than busybox), fails to start.
Unless you copy the file manually or disable "shared libgcc" in the config.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
