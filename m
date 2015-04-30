From: =?UTF-8?B?SsO2cmcgS3JhdXNl?= <joerg.krause@embedded.rocks>
Date: Thu, 30 Apr 2015 22:54:29 +0200
Subject: [Buildroot] package/dropwatch: Try to fix autobuild error
Message-ID: <55429685.6030003@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I need some help to fix autobuild error for dropwatch:
http://autobuild.buildroot.net/results/70f/70f019329fa5af6b573bc3ddd6c0bcdcb5ca8bec/

I fixed the musl build error by including a local queue.h header file 
from OpenBSD. This compiles fine, but leads to a linker error:

/home/joerg/Development/git/buildroot/output/host/usr/arm-buildroot-linux-musleabi/sysroot/usr/lib/libbfd.so: 
undefined reference to `libintl_dgettext'

I know that musl supports the gettext API natively. libintl.h is the 
header for the gettext API. There is no need for libintl. So why does 
libbfd.so does not link against libc? Any idea?

Best regards
J?rg Krause
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150430/a30713e7/attachment.html>
