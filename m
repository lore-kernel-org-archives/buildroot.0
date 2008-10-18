From: Roberto A. Foglietta <roberto.foglietta@gmail.com>
Date: Sat, 18 Oct 2008 20:57:40 +0200
Subject: [Buildroot] ext2+isofs initrd too big
Message-ID: <e4c675870810181157u69e5e3d4j3ed89b53a414c6f3@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

 using buildroot I have compiled a system which is big enough to not
fit in the initrd image (default size is 4Mb but could be enlarged by
kernel .config). Attached patch prepare a initrd of 16Mb and I can
enlarge it more in order to put all my system inside. However this is
not the best solution because has no future itself, initrd image could
not enlarged forever.

 I think the good approach should be:

 a) having a buildroot project with kernel, modules, static busybox
which generate a boot-able iso with initrd.
 b) having another buildroot project with everything which generate a
ext2 loop file system.

 The project a) should have a rc.S which mount the ext2 loop (or
equivalent) and jump on it. I could do it by myself and my question
is: do you think is there any better way to do it? What could be the
best way in order to include this behaviour into buildroot?

 Thanks in advance,
-- 
/roberto
