From: Rick Foos <rick@synchromeshcomputing.com>
Date: Tue, 17 Jul 2007 16:42:59 -0500
Subject: [Buildroot] [PATCH] fix make clean for package/dropbear
Message-ID: <013b01c7c8bb$71f06d10$8200000a@k2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

make clean fails when dropbear is selected.

# make clean
# dropbear makefile does not have uninstall target.
#
# make[1]: Entering directory 
`/home/rick/build/mindspeed_build_arm/dropbear-0.49'
# make[1]: *** No rule to make target `uninstall'.  Stop.
#make[1]: Leaving directory 
`/home/rick/build/mindspeed_build_arm/dropbear-0.49'
#make: *** [dropbear-clean] Error 2

In dropbear.mk, the install target was modified in the past, and manually 
installs the package from dropbear.mk.

The clean method called the dropbear makefile with uninstall. The dropbear 
makefile no longer contains uninstall, and this uninstall call was now a bug 
since the install was done in dropbear.mk.

This patch comments out the uninstall call, and does the correct uninstall 
based on the existing commands in dropbear.mk.

Cheers,
Rick Foos
-------------- next part --------------
A non-text attachment was scrubbed...
Name: dropbear-clean.patch
Type: application/octet-stream
Size: 1191 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070717/0b06d11a/attachment.obj 
