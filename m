From: julien.boibessot at free.fr <julien.boibessot@free.fr>
Date: Tue, 28 Nov 2006 19:09:44 +0100
Subject: [Buildroot] Buildroot, NAND flash and missing mkfs.jffs2 option
Message-ID: <1164737384.456c7b6809f9d@imp3-g19.free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi !

I have found that on my NAND flash, if I want to burn a JFFS2 rootfs image
generated with buildroot, I need to add "-n" option to JFFS2_OPTS variable in
target/jffs2/jffs2.mk Makefile.

Otherwise when mounting my rootfs, I have a lot of warning messages like this
one:
    CLEANMARKER node found at 0x00...... has totlen 0xc != normal 0x0

Was anybody aware of that special case ?
Should I send you a patch to support NAND flash ?

Regards,
Julien
