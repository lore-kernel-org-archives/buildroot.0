From: Tim Barr <tbarr@multitech.com>
Date: Thu, 21 Feb 2008 08:04:36 -0600
Subject: [Buildroot] Latest build problem
Message-ID: <1CD05B980C94AC408B37C82BBABAA3E60A5233B5@mtsexchange.dc.multitech.prv>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Well, I did a grep of the whole buildroot directory looking for
"/usr/bin/sstrip" and found two occurrences. One was a svn file and the
other was in "sstrip.mk". The specific line in sstrip.mk was:

SSTRIP_TARGET := $(TARGET_DIR)/usr/bin/sstrip

Which seems to be correct, so now I am really confused.

Timothy Barr
Hardware Development Engineer
for Multi-Tech Systems, Inc.
tbarr at multitech.com



> -----Original Message-----
> From: Ulf Samuelsson [mailto:ulf.samuelsson at atmel.com] 
> Sent: Tuesday, February 19, 2008 12:18 AM
> To: Tim Barr; buildroot at uclibc.org
> Subject: Re: [Buildroot] Latest build problem
> 
> 
> 
> > 
> /home/falingtrea/buildroot/build_arm_wchar/staging_dir/usr/bin/arm-lin
> > ux
> > -uclibc-gcc -Os -pipe
> > -I/home/falingtrea/buildroot/build_arm_wchar/staging_dir/usr/include
> > -I/home/falingtrea/buildroot/build_arm_wchar/staging_dir/include
> > --sysroot=/home/falingtrea/buildroot/build_arm_wchar/staging_dir/
> > -isysroot /home/falingtrea/buildroot/build_arm_wchar/staging_dir
> > .//toolchain/sstrip/sstrip.c -o
> > 
> /home/falingtrea/buildroot/project_build_arm_wchar/SuperModem-
> 2.6.22.1/r
> > oot/usr/bin/sstrip
> 
> [snip]
> 
> > Any suggestions on what I can do to move forward would be 
> appreciated. 
> > Timothy Barr
> 
> You need to look at the rule generating this statement in 
> package/SuperModem/SuperModem.mk
> 
> -o 
> /home/falingtrea/buildroot/project_build_arm_wchar/SuperModem-
> 2.6.22.1/r
> oot/usr/bin/sstrip
> 
> It looks to me that it is defined as 
> -o $(SUPERMODEM_DIR)/root/usr/bin/sstrip
> instead of
> -o $(TARGET_DIR)/usr/bin/sstrip
> or similar
> 
> 
> Best Regards,
> Ulf Samuelsson
> 
