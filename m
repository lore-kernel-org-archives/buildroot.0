From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 04 Feb 2020 09:14:47 +0000
Subject: [Buildroot] [Bug 12536] Linux-Headers extracting failure
In-Reply-To: <bug-12536-163@https.bugs.busybox.net/>
References: <bug-12536-163@https.bugs.busybox.net/>
Message-ID: <bug-12536-163-lL7jgADIRN@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12536

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|---                         |INVALID
             Status|NEW                         |RESOLVED

--- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
We use the tarball filename extension to decide how to uncompress it, so if it
doesn't have any extension, we don't know what to do with it.

As Peter explained, it should have a .tar, .tar.gz, .tar.xz, tar.bz2, etc.
extension depending on the compression scheme being used.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
