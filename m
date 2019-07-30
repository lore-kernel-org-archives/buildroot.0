From: chalil jitesh <chaliljitesh@gmail.com>
Date: Tue, 30 Jul 2019 18:33:52 +0530
Subject: [Buildroot] btrfs filesystem image creation using TARGET_DIR path
Message-ID: <CAP8JTaaqcBbCdoJHm5=zi0dc4NtNaq2Y=krx0UbCVz4PdB2sJw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi,

I am trying to create a btrfs filesystem image from buildroot (buildroot
2019.02 version). During the btrfs image creation step in the file
buildroot/fs/btrfs/btrfs.mk the target root file system directory path
passed to -r option seems to be given as $(TARGET_DIR) which is pointing to
build/buildroot-fs/btrfs/target instead of actual root file system
directory $(BASE_TARGET_DIR) (as followed for other file system image
creation like buildroot/fs/squashfs/squashfs.mk).
Kindly please review if my understanding is correct or if i am mising any
steps and if the -r option should point to $(BASE_TARGET_DIR).
Attaching the changes done for review.

diff -Naur btrfs/btrfs.mk btrfs_new/btrfs.mk
--- btrfs/btrfs.mk    2019-07-30 13:05:57.105137900 +0530
+++ btrfs_new/btrfs.mk        2019-07-30 13:05:52.583135800 +0530
@@ -19,7 +19,7 @@

 BTRFS_OPTS = \
        -f \
-       -r '$(TARGET_DIR)' \
+       -r '$(BASE_TARGET_DIR)' \
        -L '$(BTRFS_LABEL)' \
        --byte-count '$(BTRFS_SIZE)' \
        $(if $(BTRFS_SIZE_NODE),--nodesize '$(BTRFS_SIZE_NODE)') \


With Thanks and Regards
Jitesh
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190730/487b9a4b/attachment.html>
