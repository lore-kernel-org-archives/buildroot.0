From: Sergey Alyoshin <alyoshin.s@gmail.com>
Date: Mon, 21 Oct 2013 20:33:22 +0400
Subject: [Buildroot] [PATCH] kobs-ng: check Linux version for mtd enum
	redefine
Message-ID: <CAOxVtSRpiU5wOFJdzSMDtZvcCro583eugwroCu0BdYNaeYhu7A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With current  package/kobs-ng/kobs-ng-fix-mtd-defines.patch
kobs-ng failed to build with 2.6.26, because enum tested with #ifndef

mtd.c: In function 'mtd_open':
mtd.c:696:42: error: 'MTD_FILE_MODE_NORMAL' undeclared (first use in
this function)
mtd.c:696:42: note: each undeclared identifier is reported only once
for each function it appears in
mtd.c: In function 'mtd_set_ecc_mode':
mtd.c:896:43: error: 'MTD_FILE_MODE_NORMAL' undeclared (first use in
this function)
mtd.c:914:43: error: 'MTD_FILE_MODE_RAW' undeclared (first use in this function)

Updated package/kobs-ng/kobs-ng-fix-mtd-defines_v2.patch is attached.
Test built with Linux 2.6.36
-------------- next part --------------
A non-text attachment was scrubbed...
Name: kobs-ng-fix-mtd-defines_v2.patch
Type: application/octet-stream
Size: 2006 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131021/f956e494/attachment.obj>
