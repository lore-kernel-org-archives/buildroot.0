From: Daniel Mierswa <impulze@impulze.org>
Date: Mon, 17 Aug 2009 08:01:35 +0200
Subject: [Buildroot] [PATCH] initial util-linux-ng package
Message-ID: <4A88F23F.7010904@impulze.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


This is my first attempt to replace the obsolete util-linux package with
util-linux-ng. I replaced the susv3 patch with an uptodate version and
sent it upstream, the nls and umount2 patch were removed because I
didn't face any issues. If there's platform specific stuff to be added
we can still figure it out. I hope someone finds interest in this.
Cheers.

Signed-off-by: Daniel Mierswa <impulze@impulze.org>
---
 package/Config.in                                  |    2 +-
 ...0001-replace-bcopy-bzero-index-and-rindex.patch |  418 +++++++++++++++++++
 .../0002-Allow-linking-with-uClibc.patch           |   26 ++
 package/util-linux-ng/Config.in                    |   14 +
 package/util-linux-ng/util-linux-ng.mk             |   99 +++++
 package/util-linux/Config.in                       |    8 -
 package/util-linux/util-linux-no-nls-fix.patch     |   25 --
 package/util-linux/util-linux-susv3-legacy.patch   |  429 --------------------
 package/util-linux/util-linux-umount2-fix.patch    |   20 -
 package/util-linux/util-linux.mk                   |   92 -----
 10 files changed, 558 insertions(+), 575 deletions(-)
 create mode 100644 package/util-linux-ng/0001-replace-bcopy-bzero-index-and-rindex.patch
 create mode 100644 package/util-linux-ng/0002-Allow-linking-with-uClibc.patch
 create mode 100644 package/util-linux-ng/Config.in
 create mode 100644 package/util-linux-ng/util-linux-ng.mk
 delete mode 100644 package/util-linux/Config.in
 delete mode 100644 package/util-linux/util-linux-no-nls-fix.patch
 delete mode 100644 package/util-linux/util-linux-susv3-legacy.patch
 delete mode 100644 package/util-linux/util-linux-umount2-fix.patch
 delete mode 100644 package/util-linux/util-linux.mk

--
Mierswa, Daniel

If you still don't like it, that's ok: that's why I'm boss. I simply know better than you do.
               --- Linus Torvalds, comp.os.linux.advocacy, 1996/07/22
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-initial-util-linux-ng-package.patch
Type: text/x-patch
Size: 40344 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090817/1ca44910/attachment-0001.bin>
