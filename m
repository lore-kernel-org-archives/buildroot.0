From: Anand Sivaram <aspnair@gmail.com>
Date: Fri, 11 Nov 2016 14:49:42 +0530
Subject: [Buildroot] Question about Compilation Flags
Message-ID: <CAHBw83fzS2uZUXUrpF6+Q41G3gUEPg5uW3DXu=YauG447FjDtA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear All,

I am using buildroot on a MIPS system.  My uncompressed rootfs created by
buildroot is around 25MB.

In order to save some more space, I enabled -ffunction-sections
-fdata-sections and --gcsections as below.

File: package/Makefile.in
TARGET_CFLAGS += -ffunction-sections -fdata-sections
TARGET_LDFLAGS += -Wl,--gc-sections

Everything went fine, I saved around 1MB.  But lighttpd with mod-fcgi
enabled got SIGSEGV with the above change.

I have a question?  Could I disable these flags *only* for lighttpd, that
means using the above flags in all packages except lighttpd.

Any help would be really appreciated.

Thanks and Best Regards

Anand
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161111/21f31330/attachment.html>
