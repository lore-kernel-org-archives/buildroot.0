From: Rick Foos <rick@synchromeshcomputing.com>
Date: Thu, 19 Jul 2007 18:29:25 -0500
Subject: [Buildroot] [PATCH] make distclean fixes
Message-ID: <019701c7ca5c$a5255e00$8200000a@k2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

1) make distclean followed by make fails due to missing .config.cmd
2) make distclean followed by make xxx_defconfig fails because the 
%_defconfig rule was not updated with the others.

The attached patch fixed both by adding a rule for .config.cmd, and updated 
the %_defconfig rule.

Cheers,
Rick Foos
-------------- next part --------------
A non-text attachment was scrubbed...
Name: makefile-distclean.patch
Type: application/octet-stream
Size: 1066 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070719/c2ebc4d8/attachment.obj 
