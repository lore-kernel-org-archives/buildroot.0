From: Steffen Schulz <pepe_ml@gmx.net>
Date: Sun, 10 Aug 2008 07:06:49 +0200
Subject: [Buildroot] New package util-linux-ng
Message-ID: <20080810050649.GA26515@cbg.dyndns.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,


I was trying to fix bug2254 by adding util-linux-ng to buildroot.
And just before adding it to the bugtracker today I read that
Makefile.autotoools.in should be used.

Long story short, the attached patch has some issues:


- util-linux still wants to compile even though it was not selected and
  removed from Config.in
- with util-linux-ng.mk, the are no errors, the package is simply ignored
- with util-linux-ng.mk.old, the packet works. But the staging_dir
  misses a file <linux/a.out.h> which is included in <a.out.h>. I think
  this is a bug in some other packet?


Any comments on my fixes in #4274, #4284 and #4294?


/steffen
-- 
  ,''`,
 : :' :                                                +49/1781384223
 `. `'                                        gpg --recv-key A04D7875
   `-  www.debian.org                     mailto: pepe at cbg.dyndns.org
-------------- next part --------------
A non-text attachment was scrubbed...
Name: util-linux-ng.patch
Type: text/x-diff
Size: 19895 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080810/c9d8eb94/attachment.patch 
