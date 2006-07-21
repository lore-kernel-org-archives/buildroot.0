From: Ed Swierk <eswierk@arastra.com>
Date: Fri Jul 21 16:34:36 2006
Subject: [Buildroot] [PATCH] u_int undefined when compiling libpcap
Message-ID: <c1bf1cf0607211634n7509600ft308f06c00296592e@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libpcap-0.9.4 fails to compile against uClibc-20060720, complaining
that u_int is undefined. The attached patch adds -D_GNU_SOURCE to
CFLAGS when configuring libpcap, ensuring that u_int is defined
properly.

--Ed
-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot-libpcap-gnu-source.patch
Type: text/x-patch
Size: 461 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20060721/e7c3634b/buildroot-libpcap-gnu-source.bin
