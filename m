From: Doug the RockRat <rickyrockrat@yahoo.com>
Date: Sun, 4 Feb 2007 14:52:34 -0800 (PST)
Subject: [Buildroot] patch mkdosfs to properly install dosfstools (does it
	make sense to rename it dosfstools?) svn:17728
Message-ID: <153410.27989.qm@web62003.mail.re1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

diff -ruN svn/buildroot/package/mkdosfs/mkdosfs.mk
buildroot-2007-02-02/package/mkdosfs/mkdosfs.mk
--- svn/buildroot/package/mkdosfs/mkdosfs.mk   
2007-02-02 10:49:33.000000000 -0700
+++ buildroot-2007-02-02/package/mkdosfs/mkdosfs.mk   
 2007-02-04 15:47:24.000000000 -0700
@@ -31,8 +31,9 @@
        touch -c $(MKDOSFS_DIR)/mkdosfs/mkdosfs

 $(TARGET_DIR)/$(MKDOSFS_TARGET_BINARY):
$(MKDOSFS_DIR)/$(MKDOSFS_BINARY)
-       cp -a $(MKDOSFS_DIR)/$(MKDOSFS_BINARY)
$(TARGET_DIR)/$(MKDOSFS_TARGET_BINARY)
-       touch -c $(TARGET_DIR)/sbin/mkdosfs
+       $(MAKE) -C $(MKDOSFS_DIR) PREFIX=$(TARGET_DIR)
install
+       rm -rf $(TARGET_DIR)/usr/man
+       touch -c
$(TARGET_DIR)/$(MKDOSFS_TARGET_BINARY)

 mkdosfs: uclibc
$(TARGET_DIR)/$(MKDOSFS_TARGET_BINARY)




 
____________________________________________________________________________________
Need a quick answer? Get one in minutes from people who know.
Ask your question on www.Answers.yahoo.com
