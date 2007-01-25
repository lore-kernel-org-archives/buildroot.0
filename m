From: Ulf Samuelsson <ulf@atmel.com>
Date: Thu, 25 Jan 2007 22:48:35 +0100
Subject: [Buildroot] MTD fix
Message-ID: <1169761715.25586.6.camel@elrond.sweden.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author:	Ulf Samuelsson
Date:	2007-01-25

Log:
Received patch from other buildroot user.
Received patch will 
	hardwire mtd to mtd_20061007.orig.tar.gz
	no support for snapshot any longer
	board patches updated

My Modifications:
	It may be undesirable to remove snapshot etc. so 
	old files are moved to a subdirectory.
	I changed that part of the patch manually so someone may want 
	to test this further before introducing into main tree.

	renamed mtd.mk to mtd-20050122.mk
	moved all package/mtd/*.* files to package/mtd/20050122/*.*
	created "package/mtd/20061007" patch directory
	inserted received mtd patch in "package/mtd/20061007"
	inserted new makefile fragment in "package/mtd/mtd-20061007.mk"
	"mtd_acl.patch" adding "sys/acl.h" needed to compile mtd.

	Received mtd patch assumes utilities in $(MTD_DIR)/util
	Current tarball has utilities in $(MTD_DIR)
	mtd-20061007.mk modified to reflect this.
	jffs2dump does not work, commented away
	package/mtd/Config.in helptext updated to reflect changed.

Modified:
	package/mtd/Config.in
	package/mtd/mtd.mk
	package/mtd/mtd.patch


Changeset
	package/mtd/Config.in
	package/mtd/mtd.mk
	package/mtd/mtd.patch
	package/mtd/20050122/Config.in
	package/mtd/20050122/mtd-20050122.mk
	package/mtd/20050122/mtd-20050122.patch
	package/mtd/mtd-20061007.mk
	package/mtd/20061007/mtd-20061007.patch
	package/mtd/20061007/mtd_acl.patch



Best Regards
Ulf Samuelsson

-------------- next part --------------
A non-text attachment was scrubbed...
Name: mtdfix.patch
Type: text/x-patch
Size: 30958 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070125/9ee54f22/attachment-0001.bin 
