From: Fredy Yanardi <fyanardi@gmail.com>
Date: Fri, 25 Jan 2008 13:09:28 +0800
Subject: [Buildroot] Resolving Qtopia4 and -qt-mouse-tslib
Message-ID: <1ec1a3270801242109x4533bc4dr6a7bf1077f90f3cd@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Today I found out the reason Qtopia always refuses to use
-qt-mouse-tslib. In fact this is a bug in Qtopia, according to Qt's
bug tracker: http://trolltech.de/developer/task-tracker/index_html?method=entry&id=194287
with description:

When configuring Qt with bad configure-flags that doesn't exists will
give false configure error.
Example:

configure -no-sql-foobar -qt-mouse-tslib
will give:
-qt-mouse-tslib: unknown argument
when it is -no-sql-foobar which is unknown.

The solution is pretty straightforward, the lines:
-no-sql-tds \
-no-sql-oci \
-no-sql-db2 \
are only intended for Qtopia commercial version since these sql
drivers are not shipped with Qtopia open source. Those lines will
trigger the aforementioned bug if we use Qtopia open source version.

Attached is a simple patch againts old qtopia4.mk to fix this issue.

Best Regards,

Fredy Yanardi
-------------- next part --------------
A non-text attachment was scrubbed...
Name: qtopia4_fix_tslib.patch
Type: text/x-diff
Size: 1228 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080125/4bcc3a9c/attachment.bin 
