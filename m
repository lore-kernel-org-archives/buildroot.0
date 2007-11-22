From: Darcy Watkins <DWatkins@tranzeo.com>
Date: Thu, 22 Nov 2007 10:52:40 -0800
Subject: [Buildroot] Cramfs CRC endian Patch
Message-ID: <D61182AC8012EA4EBC531B3AF23BE10947FFFD@tranzeo-mail2.12stewart.tranzeo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

The endianness of the CRC of a cramfs image appears to be that of the
build host rather than the target.

The attached patch adds a new command line option "-C" to make sure that
the CRC endianess matches the target.  Without the "-C" command line
option, behaviour of mkcramfs is the same as before (i.e. to avoid
breaking someone's build process that depends on the buggy behavior).

According to my colleague, this CRC endianess is not a widespread issue,
likely because the kernel doesn't check it and not many outside of the
embedded community make much use of it.  But we have a project for which
this has become an issue to us and are submitting this patch back to the
community in case it helps anyone else.

The patch is in the form suitable to be dropped into
$TOPDIR/target/cramfs along side of the other three patches.  I believe
that the buildroot make scripts do not require any updates to build.  To
make use of the new behaviour, any makefile or script that uses the
mkcramfs tool will need to have the new "-C" option added.


Regards,

Darcy Watkins
Tranzeo Wireless Technologies, Inc.

-------------- next part --------------
A non-text attachment was scrubbed...
Name: cramfs-04-crc-endian.patch
Type: application/octet-stream
Size: 1464 bytes
Desc: cramfs-04-crc-endian.patch
Url : http://busybox.net/lists/buildroot/attachments/20071122/2a409612/attachment.obj 
