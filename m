From: Bryan Hundven <bryanhundven@gmail.com>
Date: Mon, 28 Jun 2010 16:00:29 -0700
Subject: [Buildroot] kexec BUILD_CC fix.
Message-ID: <AANLkTilZYVcPRHCmapk8VfKeDNKC3UcFaLLgU9y-1nto@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

While building kexec on i386 I got the same issue as in:
http://lists.busybox.net/pipermail/buildroot/2009-August/028973.html

I found that the problem is BUILD_CC is set to the same thing as TARGET_CC.
Setting BUILD_CC to HOSTCC seems to fix the issue for me.

Attached is the patch with the fix.

-Bryan
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-Fix-kexec-bin-to-hex-build-failure.patch
Type: text/x-diff
Size: 1055 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100628/e97c8b96/attachment-0001.bin>
