From: Andre <armcc2000@yahoo.com>
Date: Fri, 8 Dec 2006 19:21:14 -0800 (PST)
Subject: [Buildroot] ARM softfloat patch for gcc 4.2
Message-ID: <789554.43861.qm@web35609.mail.mud.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tested with gcc 4.2 20061205 snapshot + binutils 2.17

Seems to work with one minor issue: although the newly created
arm-linux-uclibc-gcc defaults to -mfloat-abi=soft, binutils does not.

Therefore objects created by arm-linux-uclibc-as can't be linked with
objects created by arm-linux-uclibc-gcc unless -mfloat-abi=soft is
explicitly given on the arm-linux-uclibc-as commandline.

How can I force arm-linux-uclibc-as to generate softfloat compatible
object files by default ??

Andre
--



 
____________________________________________________________________________________
Yahoo! Music Unlimited
Access over 1 million songs.
http://music.yahoo.com/unlimited
-------------- next part --------------
A non-text attachment was scrubbed...
Name: patch_buildroot_gcc420_arm_softfloat
Type: application/octet-stream
Size: 1908 bytes
Desc: 4023813560-patch_buildroot_gcc420_arm_softfloat
Url : http://busybox.net/lists/buildroot/attachments/20061208/5777e715/attachment.obj 
