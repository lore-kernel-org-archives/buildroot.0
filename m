From: Lee, Tommy <Tommy_Lee@alliedtelesis.com>
Date: Fri, 11 Sep 2015 11:04:34 -0700
Subject: [Buildroot] vconfig failure
Message-ID: <944894A3EB1D044A9003B2F944389BB20474C348C3@svr-wa-exch1.atg.lc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Buildroot Busybox,

My host is Ubuntu-14.04 LTS. My Buildroot release is 2015.05. I made the former meet the latter?s requirements. My target is Marvell ARMADA A385 (ARM-Cortex-A9) DB-88F6820-GP. I can build two images with no problems: the 4.0.4 zImage with the rootfilesystem integrated; armada-385-db-ap.dtb. They are able to be booted up using U-Boot-1.73. Now my target system has eth2 (dhcp) for the normal access; eth0 (static) for a 192.168.0.0 local segment access.



I am working on the VLAN enabling on the eth0 interface. I have made the VLAN kernel module (8021q.ko) built into my zImage by adding two lines in my mvebu_v7_defconfig file:



CONFIG_VLAN_8021Q=y

CONFIG_MACVLAN=y



Running the system I built yesterday, my ip command result is:



# ip addr add 192.168.1.1/27 dev eth0.1

ip: can't find device 'eth0.1'



Then I tried the vconfig command. It gave me:



# vconfig add eth0 1

vconfig: ioctl error for add: Package not installed



I am resolving this error now. Your experience sharing is extremely welcome. The attachments are the two configuration files for your review.



Tommy


________________________________
This e-mail message is for the sole use of the intended recipient(s) and may contain confidential and privileged information. Any unauthorized review, use, disclosure or distribution is prohibited. If you are not the intended recipient, please contact the sender by reply e-mail and destroy all copies of the original message. If you are the intended recipient, please be advised that the content of this message is subject to access, review and disclosure by the sender's e-mail System Administrator.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150911/a32ee3b4/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: mvebu_v7_defconfig
Type: application/octet-stream
Size: 2957 bytes
Desc: mvebu_v7_defconfig
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150911/a32ee3b4/attachment.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: config.sep11fri15
Type: application/octet-stream
Size: 54030 bytes
Desc: config.sep11fri15
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150911/a32ee3b4/attachment-0001.obj>
