From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Tue, 19 Feb 2008 07:18:23 +0100
Subject: [Buildroot] Latest build problem
References: <1CD05B980C94AC408B37C82BBABAA3E60A3420CD@mtsexchange.dc.multitech.prv>
Message-ID: <007001c872bf$402a8eb0$040514ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> /home/falingtrea/buildroot/build_arm_wchar/staging_dir/usr/bin/arm-linux
> -uclibc-gcc -Os -pipe
> -I/home/falingtrea/buildroot/build_arm_wchar/staging_dir/usr/include
> -I/home/falingtrea/buildroot/build_arm_wchar/staging_dir/include
> --sysroot=/home/falingtrea/buildroot/build_arm_wchar/staging_dir/
> -isysroot /home/falingtrea/buildroot/build_arm_wchar/staging_dir
> .//toolchain/sstrip/sstrip.c -o
> /home/falingtrea/buildroot/project_build_arm_wchar/SuperModem-2.6.22.1/r
> oot/usr/bin/sstrip

[snip]

> Any suggestions on what I can do to move forward would be appreciated.
> Timothy Barr

You need to look at the rule generating this statement in package/SuperModem/SuperModem.mk

-o /home/falingtrea/buildroot/project_build_arm_wchar/SuperModem-2.6.22.1/r
oot/usr/bin/sstrip

It looks to me that it is defined as 
-o $(SUPERMODEM_DIR)/root/usr/bin/sstrip
instead of
-o $(TARGET_DIR)/usr/bin/sstrip
or similar


Best Regards,
Ulf Samuelsson
