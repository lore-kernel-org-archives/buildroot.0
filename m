From: Olaf Rempel <razzor@kopf-tisch.de>
Date: Wed, 6 May 2009 12:11:10 +0200
Subject: [Buildroot] 2009.05-rc1: fix dmraid build
Message-ID: <20090506121110.46c105f8@bandomeer.europe.flane.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

the dmraid build seems to be broken.
On x86 it bails out with missing include files.
I think it's some sort of $FOO_SUBDIR issue, but I couldn't find/fix it.

After adding the "include" dir to CFLAGS it compiles, but fails during linking.
Disabling parallel build (I'm using -j2) fixed that too.

Regards
Olaf
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-dmraid-fix-build.patch
Type: text/x-patch
Size: 873 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090506/7e36bb64/attachment.bin>
