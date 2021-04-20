From: Mikhail B. WproxyM <w.proxy.m@gmail.com>
Date: Tue, 20 Apr 2021 12:35:16 +0300
Subject: [Buildroot] boot/grub2: grub-core-build-fixes-for-i386 (grub-2.04 +
 binutils-2.35.2 + pseudo-op .code64)
Message-ID: <CANTg=Qj3vMern005jEMmUs2dWvi0oJ9Y3aoS4ocsrD91KoXW5Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We are using binutils-2.35.2+ (later then 2.29.1), grub-2.04,
cross-compiling on recent buildroot under i386/i686 and getting error:

> lib/i386/relocator64.S:66: Error: unknown pseudo-op: `.code64'

So, the working patch is attached. Please add it to buildroot.

Sources:
1) https://debbugs.gnu.org/cgi/bugreport.cgi?bug=41982 (Jul 2020)
2)
http://archive.linuxfromscratch.org/mail-archives/lfs-support/2018-January/051723.html

--
Best regards
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210420/a08994a2/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0150-grub-core-build-fixes-for-i386.patch
Type: text/x-patch
Size: 1722 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210420/a08994a2/attachment.bin>
