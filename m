From: Benjamin Delagoutte <benjamin.delagoutte@gmail.com>
Date: Mon, 13 Nov 2006 15:54:22 +0100
Subject: [Buildroot] Are skel.tar.gz and target_skeleton folder duplicates ?
Message-ID: <30f88efd0611130654w598ff5daj8015e3548e2f7b7d@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

While working on writing a device profile for Buildroot, I noticed Buildroot
uses both a tarball (skel.tar.gz) and a folder (target_skeleton) to build
the rootfs tree structure.

As far as I understand, the tarball is first extracted, then we copy files
found in target_skeleton to the resulting tree.

$(TARGET_DIR):
        if [ -f "$(TARGET_SKELETON)" ] ; then \
                $(ZCAT) $(TARGET_SKELETON) | tar -C $(BUILD_DIR) -xf -; \
        fi;
        if [ -d "$(TARGET_SKEL_DIR)" ] ; then \
                cp -fa $(TARGET_SKEL_DIR)/* $(TARGET_DIR)/; \
        fi;
        touch $(STAGING_DIR)/.fakeroot.00000
        -find $(TARGET_DIR) -type d -name CVS | xargs rm -rf
        -find $(TARGET_DIR) -type d -name .svn | xargs rm -rf

Eventually I don't really understand why Buildroot makes use of two
different prebuilt trees. Do someone mind explaining me the goals of this
weird strategy ?

Thank you.

Benjamin
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20061113/74dff4d1/attachment.htm 
