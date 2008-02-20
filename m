From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Wed, 20 Feb 2008 01:18:29 +0100
Subject: [Buildroot] SUDO download error
References: <1CD05B980C94AC408B37C82BBABAA3E60A342204@mtsexchange.dc.multitech.prv>
Message-ID: <011901c87359$33864420$050514ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

So even if I get an error like this:

make[1]: Entering directory
`/home/falingtrea/buildroot/build_arm_wchar/at-3.1.10'

/home/falingtrea/buildroot/build_arm_wchar/staging_dir/usr/bin/arm-linux
-uclibc-gcc -Os -pipe
-I/home/falingtrea/buildroot/build_arm_wchar/staging_dir/usr/include
-I/home/falingtrea/buildroot/build_arm_wchar/staging_dir/include
--sysroot=/home/falingtrea/buildroot/build_arm_wchar/staging_dir/
-isysroot /home/falingtrea/buildroot/build_arm_wchar/staging_dir -c -O2
-g -Wall -DHAVE_CONFIG_H -DVERSION=\"3.1.9\" -DETCDIR=\"/etc\"
-DLOADAVG_MX=0.8 -DDAEMON_USERNAME=\"root\" -DDAEMON_GROUPNAME=\"root\"
-DLFILE=\"/var/lib/atjobs/.SEQ\" -Wall atd.c

atd.c:498:2: error: #error "No mail command specified."

make[1]: *** [atd.o] Error 1

And I have a rootfs file, the build is successful?



==> NO, because the rootfs is there from a previous successful build.
        buildroot cannot generate a new root fs, if the makefile exits with 
        an error.

        If you have configured buildroot to build several root fs (jffs2, ext2 etc.)
        then ALL of them have to be present, or the build have failed.

        Any "make[1] ... Error #" like error message means that the build failed.

Best Regards
Ulf Samuelsson 
