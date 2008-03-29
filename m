From: Nigel Kukard <nkukard@lbsd.net>
Date: Sat, 29 Mar 2008 06:59:01 +0000
Subject: [Buildroot] initramfs doesn't need root to create an image
Message-ID: <1206773941.3224.126.camel@nigel-x60>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Attached a patch which removes the requirement on fakeroot & makedevs
and prevents files from being created in /dev instead of devices when
one builds buildroot as a non-priv user.

Initramfs doesn't require a priv user to create the image. A perl script
merges the devices.txt into the initramfs list, fixes the permissions,
fixes ownership, orders directories to be created first and spits out a
clean list.

-N
-------------- next part --------------
A non-text attachment was scrubbed...
Name: initramfs-rework-noroot.patch
Type: text/x-patch
Size: 8028 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080329/ca2de3e9/attachment.bin 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 189 bytes
Desc: This is a digitally signed message part
Url : http://busybox.net/lists/buildroot/attachments/20080329/ca2de3e9/attachment.pgp 
