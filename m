From: Robert P. J. Day <rpjday@mindspring.com>
Date: Tue, 9 Oct 2007 16:38:53 -0400 (EDT)
Subject: [Buildroot] build error for nios2, based on kernel headers selection
Message-ID: <Pine.LNX.4.64.0710091632500.6683@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


  first time taking a crack at buildroot, selected "nios2", at which
point "toolchain/kernel_headers/Config.in" forced me into the only
legal selection of "Linux 2.6 snapshot" as the choice for kernel
headers.

  but this caused the build to then break almost immediately with:

echo "uclibc" > /home/rpjday/buildroot/buildroot/project_build_nios2/uclibc/root/etc/hostname
wget --passive-ftp  -P /home/rpjday/buildroot/buildroot/dl http://www.kernel.org/pub/linux/kernel/v2.6//linux-2.6..tar.bz2
--16:28:26--  http://www.kernel.org/pub/linux/kernel/v2.6//linux-2.6..tar.bz2
           => `/home/rpjday/buildroot/buildroot/dl/linux-2.6..tar.bz2'
Resolving www.kernel.org... 204.152.191.5, 204.152.191.37
Connecting to www.kernel.org|204.152.191.5|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
16:28:26 ERROR 404: Not Found.

  note how the kernel tarball name is generated as
"linux-2.6..tar.bz2" which, not surprisingly, doesn't exist.  i
haven't looked more closely but i'm guessing that, somewhere in the
build, it's not acceptable to just have "2.6" as the version of the
kernel headers.

rday

-- 
========================================================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://crashcourse.ca
========================================================================
