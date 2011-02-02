From: Ravi Chemudugunta <chemuduguntar@gmail.com>
Date: Wed, 2 Feb 2011 13:22:16 +1300
Subject: [Buildroot] RTAI Working
Message-ID: <AANLkTim11VrToTB7Zdjc=W0nFPzfu5tuX2oTKt0BoYwu@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

RTAI, working with some workarounds.

RTAI requires that the kernel be patched, and that the sources for the
kernel are available.
This creates a circular dependency (unless it is possible for RTAI to
depend on the extract
stage of the kernel).

I have gotten around the requirement to patch, by using kernel patch
feature in build root and pointing
it to a pre-extracted patch.

I am also doing the same to address the requirement that the kernel
sources be made known to
RTAI. Is it possible to use some kind of an auto-global $KERNEL_SOURCE_DIR?
I am thinking of using the set k-options function (as used in busybox
- RTAI uses a .config file, similar
 to that of the linux kernel and busybox) to set this path?

cheers,

-- 
C-x C-s, C-x C-c
-------------- next part --------------
A non-text attachment was scrubbed...
Name: Config.in
Type: application/octet-stream
Size: 232 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110202/5d56122f/attachment.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: rtai.mk
Type: application/octet-stream
Size: 482 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110202/5d56122f/attachment-0001.obj>
