From: Goetz Bock <bock@blacknet.de>
Date: Thu, 23 Nov 2006 09:38:29 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/target/cpio
In-Reply-To: <20061122212459.3EC24485FA@busybox.net>
References: <20061122212459.3EC24485FA@busybox.net>
Message-ID: <20061123083829.GN3065@priv.blacknet.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Wed, Nov 22 '06 at 13:24, aldot at uclibc.org wrote:
> Author: aldot
> Date: 2006-11-22 13:24:58 -0800 (Wed, 22 Nov 2006)
> New Revision: 16637
> 
> Log:
> 
> 
> Modified:
>    trunk/buildroot/target/cpio/cpioroot.mk

Could you change it like this?

Index: target/cpio/cpioroot.mk
===================================================================
--- target/cpio/cpioroot.mk     (revision 16643)
+++ target/cpio/cpioroot.mk     (working copy)
@@ -7,7 +7,7 @@
 CPIO_TARGET:=$(IMAGE).cpio
 
 cpioroot-init:
-       rm -f $(TARGET_DIR)/init
+       [ -e $(TARGET_DIR)/init ] || \
        ln -s sbin/init $(TARGET_DIR)/init
 
 cpioroot: host-fakeroot makedevs cpioroot-init


My skeleton now countains an init, and that should not be deleted. I
initialy added the link as otherwise the initramfs does not work.
--  
/"\ Goetz Bock at blacknet dot de  --  secure mobile Linux everNETting
\ /       (c) 2006 Creative Commons, Attribution-ShareAlike 2.0 de
 X   [ 1. Use descriptive subjects - 2. Edit a reply for brevity -  ]
/ \  [ 3. Reply to the list - 4. Read the archive *before* you post ]
