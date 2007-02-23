From: Heikki Lindholm <holindho@cs.helsinki.fi>
Date: Fri, 23 Feb 2007 18:10:02 +0200
Subject: [Buildroot] [RFC/PATCH 0/3] fix buildroot sed handling on Mac OS X
Message-ID: <45DF11DA.5010604@cs.helsinki.fi>
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

-- Heikki Lindholm
