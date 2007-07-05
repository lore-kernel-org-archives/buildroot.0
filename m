From: BuraphaLinux Server <buraphalinuxserver@gmail.com>
Date: Fri, 6 Jul 2007 01:14:23 +0700
Subject: [Buildroot] trouble with building openssh in svn version 19003
Message-ID: <5d75f4610707051114n74862bet4ccddac2f35a163b@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

    While attempting to build openssh in buildroot subversion version 19003
I get this at the end of the build attempt for openssh:

scp.o: In function `bwlimit':
scp.c:(.text+0x420): undefined reference to `__fixunsdfdi'
scp.c:(.text+0x435): undefined reference to `__udivdi3'
scp.c:(.text+0x44e): undefined reference to `__umoddi3'
make[1]: *** [scp] Error 1

Are other people seeing this when they try this on pentium 4 systems?
Is this a problem with compiler flags, or is it just some functions that
are not included with uClibc?  Should I make a patch that just avoids
building scp?  sftp still seems to build and can do the same kinds of
file transfers, but not as neatly in scripts.
