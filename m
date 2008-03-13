From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 Mar 2008 14:52:59 +0100
Subject: [Buildroot] Dangling symbolic links in the generated toolchain
Message-ID: <20080313145259.0af99b35@crazy>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

When creating a toolchain with the attached config file, there are some
dangling symlinks in build_arm/staging_dir/ :

$ symlinks -r build_arm/staging_dir/ | grep ^dangling
dangling: build_arm/staging_dir/arm-linux -> arm-linux-uclibcgnueabi
dangling: build_arm/staging_dir/usr/bin/cc -> gcc

The former should probably point to usr/arm-linux-uclibcgnueabi
instead. No idea for the latter, though.

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Free Embedded Linux Training Materials
on http://free-electrons.com/training
(More than 1500 pages!)
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 189 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080313/dbce62a6/attachment.pgp 
