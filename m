From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 04 Feb 2021 18:10:47 +0100
Subject: [Buildroot] [PATCH v2] configs/nexbox_a95x_defconfig: bump to
 kernel 5.10.12
In-Reply-To: <20210202100508.30949-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 2 Feb 2021 11:05:08 +0100")
References: <20210202100508.30949-1-peter@korsgaard.com>
Message-ID: <87sg6bbvxk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > The mmc probing order has changed since commit 21b2cec61c04bd1 (mmc: Set
 > PROBE_PREFER_ASYNCHRONOUS for drivers that existed in v4.4), so get rid of
 > the hardcoded root=/dev/mmcblk1p2.  The old vendor U-Boot unfortunately does
 > not have GPT support, so stick to MBR and use the legacy
 > root=PARTUUID=<disksignature>-<partition> format and set a fixed disk
 > signature, similar to how it was done for orangepi-r1 in commit 34cce93adb
 > (configs/orangepi_r1_defconfig: bump kernel to 5.10.10, u-boot to 2020.10).

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 > ---
 > Changes since v1:
 > - Keep MBR format, somehow ended up testing wrong image in v1.

Committed, thanks.

-- 
Bye, Peter Korsgaard
