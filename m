From: Lee, Tommy <Tommy_Lee@alliedtelesis.com>
Date: Thu, 30 Jul 2015 17:08:16 -0700
Subject: [Buildroot] configs/marvell_ca9_armv7_le_hfp_defconfig
Message-ID: <944894A3EB1D044A9003B2F944389BB20474AD8F64@svr-wa-exch1.atg.lc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Buildroot mailing list,

My host is Ubuntu-14.04LTS which meets the Buildroot system requirements. I am using buildroot-2015.05 to build the Linux system for the Marvell ARMADA A38x DB-88F6820-GP board. The first make process issue is that the defconfig file listed on the subject line does not originally exist in the configs folder. I copied this file from Marvell's old (2012.11-2015_T1.0) Buildroot/configs folder to the buildroot-2015.05 /configs folder. My .config file has the following line:

BR2_LINUX_KERNEL_DEFCONFIG="marvell_ca9_armv7_le_hfp_defconfig"

The subsequent make process passes through the above issue but stops at a new place shown as below:

tclee at Latitude-E6400:~/Downloads/jul30thu15/buildroot-2015.05$ make
.....
/usr/bin/install: cannot stat '/home/tclee/Downloads/jul30thu15/buildroot-2015.05/output/build/linux-4.0.4/arch/arm/configs/marvell_ca9_armv7_le_hfp_defconfig_defconfig': No such file or directory
make: *** [/home/tclee/Downloads/jul30thu15/buildroot-2015.05/output/build/linux-4.0.4/.config] Error 1

The interesting point is why "defconfig_defconfig" happens on the missing file name. I am resolving the new issue now. Your help or experience is definitely welcome.

Tommy


________________________________
This e-mail message is for the sole use of the intended recipient(s) and may contain confidential and privileged information. Any unauthorized review, use, disclosure or distribution is prohibited. If you are not the intended recipient, please contact the sender by reply e-mail and destroy all copies of the original message. If you are the intended recipient, please be advised that the content of this message is subject to access, review and disclosure by the sender's e-mail System Administrator.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150730/b43f812b/attachment.html>
