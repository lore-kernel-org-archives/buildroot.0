From: Ed Swierk <eswierk@arastra.com>
Date: Fri Jul 21 17:02:24 2006
Subject: [Buildroot] [PATCH] symlink $(STAGING_DIR)/usr to $(STAGING_DIR)
Message-ID: <c1bf1cf0607211702g34227b6dye197301e8b8e7702@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some toolchain packages install themselves to $(STAGING_DIR) while
others end up in $(STAGING_DIR)/usr, resulting in two bin directories,
two lib directories, two include directories, etc. This makes it
harder to fix build problems within buildroot, and adds unnecessary
complication to the process of configuring a package to build outside
buildroot.

The attached patch simply symlinks $(STAGING_DIR)/usr to
$(STAGING_DIR), thereby merging the two directory hierarchies into
one.

--Ed
-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot-toolchain-usr-dir.patch
Type: text/x-patch
Size: 370 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20060721/d20a4888/buildroot-toolchain-usr-dir.bin
