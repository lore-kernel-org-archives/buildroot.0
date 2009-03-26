From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 Mar 2009 17:33:47 +0100
Subject: [Buildroot] Bug in package/mtd/mtd-utils/mtd.mk
Message-ID: <20090326173347.148ab3da@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following bit of package/mtd/mtd-utils/mtd.mk doesn't work, since
DOWNLOAD is waiting for two arguments.

$(DL_DIR)/$(MTD_SOURCE):
        $(call DOWNLOAD,"$(MTD_URL)")

In my case, the $(DL_DIR)/$(MTD_SOURCE) is just doing nothing, and the
$(MTD_HOST_DIR)/.unpacked then fails while trying to extract the
downloaded archive.

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
