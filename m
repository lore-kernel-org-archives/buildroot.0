From: Tim Barr <tbarr@multitech.com>
Date: Mon, 18 Feb 2008 08:27:18 -0600
Subject: [Buildroot] SUDO download error
Message-ID: <1CD05B980C94AC408B37C82BBABAA3E60A341C9C@mtsexchange.dc.multitech.prv>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Well I reverted the sudo buildroot code and found a copy of
1.6.8p12.tar.gz on a sudo mirror site and downloaded it manually to my
install directory. The next file with an issue was which-2.16.tar.gz. I
manually downloaded this file and got past the error. Then it failed
trying to copy the file at91sam9260pf-flashboot-2.4.bin to directory
/tftpboot, which does not exist on my machine. So I created the
directory and gave it full permissions. Now I have 3 files in the
buildroot/binaries directory (a flashboot .bin, a linux .gz, and a
rootfs .ext2 file). I did seem to get some sort of error though:
 
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

 
Does buildroot tell you whether it finishes? Or do I just assume that if
I see no errors that buildroot was successful? 


Timothy Barr
Hardware Development Engineer
for Multi-Tech Systems, Inc.
 <mailto:tbarr@multitech.com> tbarr at multitech.com 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080218/ed170033/attachment.htm 
