From: Andre <armcc2000@yahoo.com>
Date: Mon, 5 Mar 2007 17:38:22 -0800 (PST)
Subject: [Buildroot] linux-libc-headers-2.4.31 patch
Message-ID: <383559.18640.qm@web35605.mail.mud.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This testapp fails to compile with a uclibc toolchain based on
buildroot's linux 2.4.31 libc headers:

#include <linux/fs.h>

int main (void)
{
    return (BLKGETSIZE64 == 0x80041272) ? 0 : 1;
}

tst.c: In function 'main':
tst.c:5: error: 'u64' undeclared (first use in this function)
tst.c:5: error: (Each undeclared identifier is reported only once
tst.c:5: error: for each function it appears in.)

Buildroot patch attached.




 
____________________________________________________________________________________
Want to start your own business?
Learn how on Yahoo! Small Business.
http://smallbusiness.yahoo.com/r-index
-------------- next part --------------
A non-text attachment was scrubbed...
Name: patch_buildroot_20070305
Type: application/octet-stream
Size: 1537 bytes
Desc: 1516509758-patch_buildroot_20070305
Url : http://busybox.net/lists/buildroot/attachments/20070305/8c416512/attachment.obj 
