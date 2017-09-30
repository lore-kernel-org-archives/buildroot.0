From: grunpferd at netscape.net <grunpferd@netscape.net>
Date: Fri, 29 Sep 2017 22:56:31 -0400
Subject: [Buildroot] build failure netsniff-ng-0.6.3
Message-ID: <15ed0b6bdb0-c09-38edf@webjas-vad019.srv.aolmail.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following compile errors occurred during building netsniff-ng-0.6.3.



This used to work successfully previously. Using an internal toolchain ggc6 / glibc.


Changed to latest linux-4.13.4 kernel. 


The following compile errors get reported:


Building mausezahn:
  CC    str.c
  CC    die.c
  CC    dev.c
  CC    sock.c
  CC    link.c
  CC    sysctl.c
  CC    xmalloc.c
  CC    staging/layer1.c
  CC    staging/layer2.c
  CC    staging/layer3.c
  CC    staging/layer4.c
  CC    staging/hextools.c
  CC    staging/tools.c
staging/tools.c: In function ?get_ip6_range_count?:
staging/tools.c:485:10: error: ?UINT64_MAX? undeclared (first use in this function)
   return UINT64_MAX;
          ^~~~~~~~~~
staging/tools.c:485:10: note: each undeclared identifier is reported only once for each function it appears in
Makefile:184: recipe for target 'mausezahn/staging/tools.o' failed
make[1]: *** [mausezahn/staging/tools.o] Error 1




It looks that UINT64_MAX is not declared.


This was working fine recently. Using latest buildroot git master along with latest linux-4.13.4.


Regards,


Ross
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170929/a9c42b0a/attachment-0001.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config
Type: application/octet-stream
Size: 118400 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170929/a9c42b0a/attachment-0001.obj>
