From: Nigel Kukard <nkukard@lbsd.net>
Date: Tue, 18 Mar 2008 12:56:10 +0000
Subject: [Buildroot] patches ...
Message-ID: <1205844970.23833.13.camel@nigel-x60>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

1. confusing busybox config option description patch, busybox can be
built as shared libs, hardlinks ... etc. rename to full install.

2. kernel 2.6.24 creates a symlink to bzImage, which is copied inplace,
symlink and all, this gives an incorrect symlink deref in
binaries/uclibc/ and points to ../../x86/bzImage. Do not copy symlink in
place, follow it.

3. Ltrace version changed, cannot find the old version on any debian
mirrors.

-N
-------------- next part --------------
A non-text attachment was scrubbed...
Name: busybox-confusing-config-option.patch
Type: text/x-patch
Size: 1369 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080318/48d24fa2/attachment.bin 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: deref-kernel-image.patch
Type: text/x-patch
Size: 550 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080318/48d24fa2/attachment-0001.bin 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: ltrace-update.patch
Type: text/x-patch
Size: 586 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080318/48d24fa2/attachment-0002.bin 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 189 bytes
Desc: This is a digitally signed message part
Url : http://busybox.net/lists/buildroot/attachments/20080318/48d24fa2/attachment.pgp 
