From: Xuebing Wang <xbing6@gmail.com>
Date: Mon, 27 Apr 2015 14:35:53 +0800
Subject: [Buildroot] Any ideas about mechanism of updating software/firmware?
Message-ID: <553DD8C9.1040602@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Community,

I am new to Buildroot. I am developing a commercial product based on 
Buildroot 2014.02, and I need the mechanism to update software/firmware 
of the product.

Here are some of my thought:
1) In eMMC, there is a partition which can be exported to PC via USB 
mass storage.
2( Once u-boot detects a special key-combination or new file in 
above-mentioned eMMC partition, u-boot boots a special kernel with 
initramfs.
3) In above-mentioned kernel + initramfs, it compares version buildroot 
distribution kernel (/etc/issue) and version+build number embedded in 
the filename of in the partition above.
3.1) If a new version is found, it updates u-boot / kernel / rootfs.

Is it a good practice to update 'system/skeleton/etc/issue' when a new 
version will be 'git tag'ed and built?

Thanks.

-- 
Xuebing
