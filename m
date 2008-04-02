From: Hamish Moffatt <hamish@cloud.net.au>
Date: Wed, 2 Apr 2008 11:04:51 +1100
Subject: [Buildroot] jffs2root/ext2root targets squash ownership even if
	option disabled
Message-ID: <20080402000451.GB4616@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The ext2 and jffs2 targets both have options to set all file ownerships
to root:root;

config BR2_TARGET_ROOTFS_EXT2_SQUASH
	bool "Make all files be owned by root"
	depends on  BR2_TARGET_ROOTFS_EXT2
	default y

If enabled, they pass an appropriate option to genext2fs / mkfs.jffs2
respectively.

However regardless of whether it's enabled, they both chown all the
files to root:root anyway;

	echo "chown -R 0:0 $(TARGET_DIR)" >> $(PROJECT_BUILD_DIR)/_fakeroot.$(notdir $(EXT2_TARGET))

Does anyone know why? It appears to be a bug.


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
