From: Heikki Lindholm <holindho@cs.helsinki.fi>
Date: Sun, 25 Feb 2007 13:22:32 +0200
Subject: [Buildroot] [RFC/PATCH 0/3] fix buildroot sed handling on Mac OS X,
	try #2
Message-ID: <45E17178.5000905@cs.helsinki.fi>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello!

Here's a series of patches (ultimately) intended to make buildroot work
on Mac OS X. This first series tries to fix sed handling. The OS X (and
BSD) sed are different from the implicitly assumed GNU sed, therefore it
makes sense to build GNU sed for the buildroot toolchain. The current
code in buildroot does not correctly determine that the OS X sed does
not work for some of the required cases, and the existing sed package
cannot build sed on OS X.

This is try #2; fixed a wrong absolute path and handling of the case 
where the host has a working gsed or gnused.

-- Heikki Lindholm
