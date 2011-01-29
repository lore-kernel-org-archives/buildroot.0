From: Bryce Schober <bryce.schober@gmail.com>
Date: Fri, 28 Jan 2011 16:23:30 -0800
Subject: [Buildroot] problems building w/ external glibc toolchain
Message-ID: <AANLkTi=LxaU-+wms053YX-BFrv3nQQod0mimafS7D=4K@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've built an external glibc toolchain using crosstool-ng with old
(2.6.29.6) linux kernel headers. I've already tested that the toolchain
basically works, but buildroot fails just after building cross-depmod26.
I've build with the --debug=v option, and it seems like it's trying to go
fetch kernel headers, but doesn't know the kernel version. Looking into the
configs and makefiles, it seems that the config variables for the kernel
header versions are unsettable when using an external toolchain, yet
buildroot is going out and trying to download them without knowing the
version, eventually resulting in:

Must remake target `/home/bschober/buildroot-2010.02/dl/linux-..tar.bz2'.

Which is clearly never going to work. You'll noticed that this happened
using buildroot-2010.02, but I've reproduced the same behavior on 2010.11
and need to use the old version because I need Xorg 7.4.

<><  <><  <><
Bryce Schober
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110128/0aa55c20/attachment.html>
