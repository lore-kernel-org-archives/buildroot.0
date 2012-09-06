From: =?utf-8?q?Ra=C3=BAl_S=C3=A1nchez_Siles?= <rasasi78@gmail.com>
Date: Thu, 6 Sep 2012 18:02:26 +0200
Subject: [Buildroot] uclibc target fails on simple configurations.
Message-ID: <201209061802.29394.rasasi78@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Hello:

  After a default configuration: make xconfig, save and quit; I went for the 
uclibc target and noticed a build failure. Log attached.

  I discovered that uclibc depends on $(gcc_intermediate) target which expands 
to $(GCC_BUILD_DIR2)/.installed This means that no gcc prerequisites or 
dependencies are checked and therefore gcc configuration fails.

  The options I reckon to solve the problem were either adding a 
$(GCC_HOST_PREREQ) depends on $(gcc_intermediate) or either depend uclibc on 
gcc_intermediate (as oposed to $(gcc_intermediate)).

  I'm attaching shortly a patch addressing the issue on the second approach.

  Regards,
-- 
     Ra?l S?nchez Siles
----->Proud Debian user<-----
Linux registered user #416098
-------------- next part --------------
A non-text attachment was scrubbed...
Name: uclibc-buildfail.log.zip
Type: application/zip
Size: 2452 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120906/051737bc/attachment-0001.zip>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 490 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120906/051737bc/attachment-0001.asc>
