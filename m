From: Bryce Schober <bryce.schober@gmail.com>
Date: Thu, 26 Sep 2013 17:28:33 -0700
Subject: [Buildroot] Using source inclusions in defconfig
In-Reply-To: <CAAXf6LV8fu30gj5fuoMJEGjgrem-jM2RQj32m+Kd7ox1==oY7Q@mail.gmail.com>
References: <CAJpxd04ok1Eu_kERG1UQy=y4ixUWcz-YZJujx=SnJysJThtOaA@mail.gmail.com>
 <CAAXf6LV8fu30gj5fuoMJEGjgrem-jM2RQj32m+Kd7ox1==oY7Q@mail.gmail.com>
Message-ID: <CAJpxd04GX_MBQ6sZKoKJaCsxMy3CA0SLREU_V0JayEN_p6UpLA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

FWIW, I hacked up a modest solution in the attached patch that applies
cleanly against 2011.08.

In essence, you can create my_special_defconfig.in files with lines that
look like:
source "my_base_defconfig.in"
and the new Makefile target will expand it via the
scripts/expand_defconfig.sh to my_special_defconfig.

One wierdness I encountered was that the make my_special_defconfig
execution was removing the defconfig file for some unknown reason...

Unfortunately, I'm not really in a position to try this out against master,
but I'm happy to at least rebase it and make a real patch submission if
anyone is actually interested.

<><  <><  <><
Bryce Schober
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130926/777ded90/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot-2011.08-modular_defconfigs.patch
Type: application/octet-stream
Size: 1949 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130926/777ded90/attachment.obj>
