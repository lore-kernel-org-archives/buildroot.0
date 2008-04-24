From: Christopher Taylor <chtaylo3@gmail.com>
Date: Thu, 24 Apr 2008 10:38:49 -0400
Subject: [Buildroot] troubleshooting techniques for cross compiled binaries
Message-ID: <2590773a0804240738h5877ca3bo86b36aba71936ff@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Can anyone share any insights they have to troubleshooting
cross-compiled binaries?

Specifically, we have an older version of buildroot building kernels
etc.  I loaded buildroot r21760 up, built the kernel and a file
system.  Both kernels are 2.6.20.4  The newly compiled kernel works
fine against the old file system but neither the new nor the old
kernels work against the new file system.

When booting either kernel against the new file system I get a kernel panic:
Freeing init memory: 104K
 1Kernel panic - not syncing: Attempted to kill init!

When I boot using a ramdisk and then mount the bad filesystem on the
target over nfs (to /mnt/nfs) and try to execute one of the binaries I
get:
-sh: bin/echo: not found

I get this for any binary, not just the ones related to busybox which
makes me thing it's a problem with how I compiled uclibc.

file busybox from the fs that doesn't work gives:
 setuid ELF 32-bit LSB executable, ARM, version 1, dynamically linked
(uses shared libs), stripped
file busybox from the fs that _does_ work gives:
 ELF 32-bit LSB executable, ARM, version 1 (ARM), statically linked, stripped

so I'm at a loss as to what's causing the problem.  Any extra hints
for techniques would be helpful...

-Chris
